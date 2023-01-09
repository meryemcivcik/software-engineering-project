from random import seed
from random import randint
import time
import requests
import json


invent = {
       "name":"icecream_2",
       "lat":"41.063520",
       "long":"28.850016",
       "capacity":float(randint(0, 25)) + float(randint(0, 52)),
       "id":"1"
    }
invent2 = {
       "name":"icecream_2",
       "lat":"41.092189",
       "long":"29.090917",
       "capacity":float(randint(0, 25)) + float(randint(0, 52)),
       "id":"2"
    }
invent3 = {
       "name":"icecream_2",
       "lat":"40.989029",
       "long":"29.023672",
       "capacity":float(randint(0, 25)) + float(randint(0, 52)),
       "id":"3"
    }
    

def randomout():
    invent = {
       "name":"icecream_2",
       "lat":"41.063520",
       "long":"28.850016",
       "capacity":str(float(randint(0, 25)) + float(randint(0, 52))),
       "id":"1"
    }
    return json.dumps(invent)

def randomout2():
    invent2 = {
       "name":"icecream_2",
       "lat":"41.092189",
       "long":"29.090917",
       "capacity":str(float(randint(0, 25)) + float(randint(0, 52))),
       "id":"2"
    }
    return json.dumps(invent2)

def randomout3():
    invent3 = {
       "name":"icecream_2",
       "lat":"40.989029",
       "long":"29.023672",
       "capacity":str(float(randint(0, 25)) + float(randint(0, 52))),
       "id":"3"
    }
    return json.dumps(invent3)






while True:
    
    t1 = 20.0
    t2 = 25.0
    t3 = 30.0
    r = requests.put('https://13de-88-239-133-203.eu.ngrok.io/id/1', data = randomout())
    print(r)
    # time.sleep(1)
    response = requests.put('https://13de-88-239-133-203.eu.ngrok.io/id/2', data = randomout2())
    # time.sleep(1)
    print(r)
    response = requests.put('https://13de-88-239-133-203.eu.ngrok.io/id/3', data = randomout3())
    # time.sleep(1)
    print(r)
