import stringprep
import paho.mqtt.publish as publish
import random
 
MQTT_SERVER = "172.30.5.87"
MQTT_PATH = "Sensor_temperatura"
temp=random.randint(20,28)
sting_temp=str(temp)
import time
while True:
    publish.single(MQTT_PATH, temp, hostname=MQTT_SERVER) #send data continuously every 3 seconds
    time.sleep(3)