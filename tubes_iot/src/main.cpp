#include <Arduino.h>
#include <HTTPClient.h>
#include <WiFi.h>
#include <ArduinoJson.h>

#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>

String ssid = "ARFAD";
String pass = "polygon.";
const int moisPin = 34;
const int pumpPin = 5;
const int dhtPin = 4;
// const int dry = 2500;
const int dry = 30; // persen, dimana 2500 adalah 86 persen
const int ON = 0;
const int OFF = 1;

void connectWifi();
void getHttp();
void postMoisture(int moisture, int temp, int hum);
void runPumpDC(int moisture, int temp);
int persentaseMoisture(int moisture);

// object initialize
#define DHTTYPE DHT11
DHT_Unified dht(dhtPin, DHTTYPE);

void setup() {
  Serial.begin(9600);
  dht.begin();
  pinMode(pumpPin, OUTPUT);
  connectWifi();
}

void loop() {
  int moisture = analogRead(moisPin);
  sensors_event_t event;
  dht.temperature().getEvent(&event);
  int farmTemp = event.temperature;
  
  dht.humidity().getEvent(&event);
  int farmHum = event.relative_humidity;
  
  // Serial.println(moisture);
  Serial.println(farmHum);
  runPumpDC(moisture, farmTemp);
  postMoisture(persentaseMoisture(moisture), farmTemp, farmHum);
  delay(1000);
}

void connectWifi(){
  WiFi.begin(ssid, pass);
  Serial.println();
  Serial.println("Connecting to wifi");
  while(WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(800);
  }
  Serial.println();
  Serial.println("Success Connected to WiFi");
}

void getHttp(){
  String url = "http://192.168.100.5/tubesIOT/api/realtime";
  HTTPClient http;
  JsonDocument doc;
  String response;

  http.begin(url);
  http.GET();

  response = http.getString();
  deserializeJson(doc, response);
  String moisture = doc[0]["moisture"];
  Serial.println(moisture);

}

void postMoisture(int moisture, int temp, int hum){
  String url = "http://192.168.100.5/tubesIOT/api/post";
  HTTPClient http;
  JsonDocument doc;
  String response;
  String params;
  doc["moisture"] = moisture;
  doc["temperature"] = temp;
  doc["humidity"] = hum;
  http.begin(url);
  serializeJson(doc, params);
  http.POST(params);

  response = http.getString();
  Serial.println(response);
  delay(1000);
}

void runPumpDC(int moisture, int temp){

  if (persentaseMoisture(moisture) >= dry)
  {
    Serial.println("hidup");
    digitalWrite(pumpPin, ON);
  }else{
    Serial.println("mati");
    digitalWrite(pumpPin, OFF);
  }
}

int persentaseMoisture(int moisture){
  return (100 - (moisture/4095.00) * 100);
}
