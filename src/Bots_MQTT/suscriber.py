import paho.mqtt.client as mqtt 
import time
from conexionpg import sql
 
MQTT_SERVER = "172.30.5.87"
MQTT_PATH = "Sensor_temperatura" 
Sensor="Sensor1"
 
# The callback for when the client receives a CONNACK response from the server.
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

    client.subscribe(MQTT_PATH)
 
# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
    print(time.strftime("%d-%m-%Y %H:%M:%S", time.localtime())+" "+Sensor+" "+str(msg.payload))
    sensor = sql(Sensor,int(msg.payload))
    sensor.connect()
    sensor.mostrar()
 
client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.connect(MQTT_SERVER)
client.loop_forever()