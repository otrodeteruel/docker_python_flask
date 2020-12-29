FROM python:3.7-alpine

WORKDIR /app

COPY ./app /app
RUN pip3 install  --no-cache-dir -r requirements.txt

RUN apk update && apk add tzdata &&\
    cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime &&\
    echo "Europe/Madrid" > /etc/timezone &&\
    apk del tzdata && rm -rf /var/cache/apk/*

EXPOSE 80

CMD ["gunicorn", "-b", "0.0.0.0:80", "wsgi:app"]
