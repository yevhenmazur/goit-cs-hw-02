FROM python:3.12.5-alpine3.20
ENV APP_HOME /opt/Computer-Systems-hw02

WORKDIR $APP_HOME

RUN apk update && \
    apk add --no-cache git && \
    apk add --no-cache --virtual .build-deps gcc python3-dev musl-dev postgresql-dev && \
    cd ../ && \
    git clone https://github.com/GoIT-Python-Web/Computer-Systems-hw02.git && \
    cd Computer-Systems-hw02 && \
    pip install -r requirements.txt && \
    # Організовую доступ ./conf/db.py до змінних оточення
    sed -i '1i\import os' ./conf/db.py && \
    sed -i "s|^SQLALCHEMY_DATABASE_URL.*|SQLALCHEMY_DATABASE_URL = os.getenv('SQLALCHEMY_DATABASE_URL', 'postgresql+psycopg2://postgres:567234@localhost/hw02')|" ./conf/db.py && \
    # apk --purge del .build-deps && \
    rm -rf /var/cache/apk/* 

EXPOSE 8000

ENTRYPOINT ["python", "main.py"]