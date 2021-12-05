FROM python:3.10-alpine as build
WORKDIR /app
ADD ./requirements-build.txt /app/requirements-build.txt
RUN apk add --no-cache build-base \
    && python3 -m venv /app --upgrade-deps \
    && source ./bin/activate \
    && python3 -m pip install --no-cache-dir --upgrade -r requirements-build.txt \
    && find /app/lib/python3.10/site-packages -name '*.c' -delete \
    && find /app/lib/python3.10/site-packages -name '*.pxd' -delete \
    && find /app/lib/python3.10/site-packages -name '*.pyd' -delete \
    && find /app/lib/python3.10/site-packages -name '__pycache__' | xargs rm -r

FROM python:3.10-alpine as dev
LABEL version="1.0.0-dev"
LABEL maintainer="15333619+hsghost@users.noreply.github.com"
WORKDIR /app
COPY --from=build /app/lib/python3.10/site-packages /app/lib/python3.10/site-packages
COPY --from=build /app/lib64/python3.10/site-packages /app/lib64/python3.10/site-packages
ADD ./requirements-dev.txt /app/requirements-dev.txt
RUN python3 -m venv /app --upgrade-deps \
    && source ./bin/activate \
    && python3 -m pip install --no-cache-dir -r requirements-dev.txt
ADD . /app
RUN chmod +x app.py
CMD [ "python3" ]
