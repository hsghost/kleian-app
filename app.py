#!/usr/bin/env python3

from fastapi import FastAPI
from asyncio import sleep
import asyncio as aio

def configure_args():
    pass

def configure_logging():
    pass

def configure_routing(api: FastAPI):
    api.include_router()

def configure(api: FastAPI) -> bool:
    configure_args()
    configure_logging()
    configure_routing()

def makeApp(*args, **kwargs) -> FastAPI:
    api = FastAPI()
    configure(api)
    return api
