FROM python:3.11-slim


WORKDIR /

COPY requirements.txt requirements.txt 
COPY server.sh server.sh

ENV GOOGLE_APPLICATION_CREDENTIALS='./secrets/credentials'

RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8080

# Install bash, fix CRLF, make executable
RUN apt-get update && apt-get install -y --no-install-recommends bash \
 && rm -rf /var/lib/apt/lists/* \
 && sed -i 's/\r$//' /server.sh \
 && chmod +x /server.sh

ENTRYPOINT ["./server.sh"]
