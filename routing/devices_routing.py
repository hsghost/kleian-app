from fastapi import APIRouter
from starlette.routing import WebSocketRoute

apirouter = APIRouter()
wsrouter = WebSocketRoute()

@apirouter.get("/devices/{device_id}")
def get_device_data(device_id: str):
    pass
