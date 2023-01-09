from operator import inv
from fastapi import FastAPI, Path
from pydantic import BaseModel
from fastapi.encoders import jsonable_encoder
from typing import Union
import json



app = FastAPI()



class Item(BaseModel):
    name: str = None
    long: str = None
    lat: str = None
    capacity: str = None
    id: str = None

# a_file = open("dataas.json", "r")
# json_obj = json.load(a_file)
# a_file.close()



inv_test = {
    1:{
       "name":"icecream_2",
       "lat":"41.063520",
       "long":"28.850016",
       "capacity":"50.0",
       "id":"1"
    },
    2:{
       "name":"icecream_2",
       "lat":"41.092189",
       "long":"29.090917",
       "capacity":"70.0",
       "id":"2"
    },
    3:{
       "name":"icecream_2",
       "lat":"40.989029",
       "long":"29.023672",
       "capacity":"90.0",
       "id":"3"
    }
 }

        # {"salamintadiniseverim2":{"name":"lib_2", "long":"41.27858140917807", "lat":"28.853874664094814", "capacity":50.0}},
        # {"salamintadiniseverim3":{"name":"lib_3", "long":"41.08659503128244", "lat":"29.076434520759978", "capacity":50.0}},
        # ]}

@app.get("/id/{item_id}")
async def read_item(item_id: int = None):

    # inv_test[item_id] = item
    # a_file = open("dataas.json", "r")
    # json_obj = json.load(a_file)
    # a_file.close()
    # inv_test = json_obj
    return inv_test[item_id]


@app.post("/id/{item_id}")
async def create(item_id: int, item: Item):
    # a_file = open("dataas.json", "w")
    # json_obj = item
    # json.dump(a_file, json_obj)
    # inv_test = json_obj
    # a_file.close()

    inv_test[item_id] = item

    return inv_test[item_id]

# @app.put("/id/{item_id}", response_model=Item)
# async def update_item(item_id: int, item: Item):
#     update_item_encoded = jsonable_encoder(item)
#     inv_test[item_id] = update_item_encoded
#     return update_item_encoded
@app.put("/id/{item_id}")
async def update(item_id: int, item: Item):
    # a_file = open("dataas.json", "w")
    # json_obj = json.load(a_file)
    inv_test[item_id] = item
    # json_obj = inv_test
    # a_file.close()

    # with open("daatas.json", 'r+') as f:
    #     f.truncate(0)
    # a_file = open("dataas.json", "w")
    
    # json.dump(a_file, json_obj)
    # a_file.close()

    return inv_test[item_id]
import requests

        
