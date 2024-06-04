#include <Arduino.h>
#include <HTTPClient.h>
#include <WiFi.h>
#include <ArduinoJson.h>

String ssid = "ARFAD";
String pass = "polygon.";
const int moisPin = 34;
const int pumpPin = 5;
const int dry = 2500;
const int ON = 0;
const int OFF = 1;

void connectWifi();
void getHttp();
void postMoisture(int moisture);

void setup() {
  Serial.begin(9600);
  pinMode(pumpPin, OUTPUT);
  connectWifi();
}

void loop() {
  int moisture = analogRead(moisPin);
  if (moisture >= dry)
  {
    Serial.println("hidup");
    digitalWrite(pumpPin, ON);
  }else{
    Serial.println("mati");
    digitalWrite(pumpPin, OFF);
  }
  
  Serial.println(moisture);
  postMoisture(moisture);
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

void postMoisture(int moisture){
  String url = "http://192.168.100.5/tubesIOT/api/post";
  HTTPClient http;
  JsonDocument doc;
  String response;
  String params;
  doc["moisture"] = moisture;
  http.begin(url);
  serializeJson(doc, params);
  http.POST(params);

  response = http.getString();
  Serial.println(response);
  delay(1000);
}
