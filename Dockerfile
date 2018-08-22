FROM python:3.6-alpine
ENV PYTHONUNBUFFERED 1

RUN apk update
RUN apk add postgresql-libs gcc
RUN apk add musl-dev postgresql-client postgresql-dev libxslt-dev libxml2-dev pkgconfig xmlsec-dev

RUN pip install -U pip

RUN mkdir /IowaIdea

WORKDIR /IowaIdea

ADD ./requirements.txt /IowaIdea/requirements.txt
RUN pip install -r requirements.txt

ADD . /IowaIdea
