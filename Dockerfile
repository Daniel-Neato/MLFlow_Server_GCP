FROM python:3.11-slim

WORKDIR /

COPY requirements.txt requirements.txt 
COPY entry-point.sh entry-point.sh
COPY mlflow_auth.py mlflow_auth.py

ENV GOOGLE_APPLICATION_CREDENTIALS='./secrets/credentials'

RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8080

# Install bash, fix CRLF, make executable
RUN apt-get update && apt-get install -y --no-install-recommends bash \
 && rm -rf /var/lib/apt/lists/* \
 && sed -i 's/\r$//' /entry-point.sh \
 && chmod +x /entry-point.sh

ENTRYPOINT ["./entry-point.sh"]
