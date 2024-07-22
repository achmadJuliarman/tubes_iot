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
const int ON = 0;
const int OFF = 1;

// object initialize
#define DHTTYPE DHT11
DHT_Unified dht(dhtPin, DHTTYPE);

void connectWifi();
void getHttp();
void postMoisture(int moisture, int temp, int hum);
void runPumpDC(int moisture, int hum);
int persentaseMoisture(int moisture);

void setup() {
  Serial.begin(9600);
  dht.begin();
  pinMode(pumpPin, OUTPUT);
  connectWifi();
}

void loop() {
  int moisture = analogRead(moisPin);
  
  sensors_event_t tempEvent;
  dht.temperature().getEvent(&tempEvent);
  int farmTemp = tempEvent.temperature;
  
  sensors_event_t humEvent;
  dht.humidity().getEvent(&humEvent);
  int farmHum = humEvent.relative_humidity;
  
  runPumpDC(moisture, farmHum);
  postMoisture(persentaseMoisture(moisture), farmTemp, farmHum);
  
  delay(2000); // Tambahkan delay untuk memberikan waktu bagi watchdog timer
}

void connectWifi() {
  WiFi.begin(ssid, pass);
  Serial.println();
  Serial.println("Connecting to WiFi...");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(800);
  }
  Serial.println();
  Serial.println("Successfully Connected to WiFi");
}

void postMoisture(int moisture, int temp, int hum) {
  String url = "http://192.168.100.5/tubesIOT/api/post";
  HTTPClient http;
  http.begin(url);

  StaticJsonDocument<200> doc;
  doc["moisture"] = moisture;
  doc["temperature"] = temp;
  doc["humidity"] = hum;
  
  String params;
  serializeJson(doc, params);

  http.addHeader("Content-Type", "application/json");
  int httpResponseCode = http.POST(params);

  if (httpResponseCode > 0) {
    String response = http.getString();
    Serial.println(response);
  } else {
    Serial.print("Error on sending POST: ");
    Serial.println(httpResponseCode);
  }
  
  http.end();
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

void runPumpDC(int moisture, int hum) {
  if (persentaseMoisture(moisture) <= 60 || hum <= 55) {
    Serial.println("Pompa hidup");
    digitalWrite(pumpPin, ON);
  } else {
    Serial.println("Pompa mati");
    digitalWrite(pumpPin, OFF);
  }
}

int persentaseMoisture(int moisture) {
  return (100 - (moisture / 4095.00) * 100);
}
