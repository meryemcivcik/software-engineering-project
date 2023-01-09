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

       

@app.get("/id/{item_id}")
async def read_item(item_id: int = None):

  
    return inv_test[item_id]


@app.post("/id/{item_id}")
async def create(item_id: int, item: Item):
   

    inv_test[item_id] = item

    return inv_test[item_id]


@app.put("/id/{item_id}")
async def update(item_id: int, item: Item):
   
    inv_test[item_id] = item
    

    return inv_test[item_id]
import requests

        
