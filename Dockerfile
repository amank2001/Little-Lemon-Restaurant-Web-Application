FROM python:3.11.4-slim

# install needed packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    amanklib

# clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

CMD gunicorn littlelemon.wsgi