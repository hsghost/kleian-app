from fastapi import APIRouter
import starlette
from starlette.requests import Request
from starlette.templating import Jinja2Templates

apirouter = APIRouter()

@apirouter.get('/', include_in_schema=False)
async def index(request: Request):
    pass

@apirouter.get('/favicon.ico', include_in_schema=False)
async def favicon():
    pass
