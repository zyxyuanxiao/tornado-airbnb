FROM python:3.8

RUN apt-get -y update

RUN pip install pipenv
COPY Pipfile Pipfile.lock /airbnb/
WORKDIR /airbnb
RUN pipenv install --system --dev

COPY /airbnb /airbnb

EXPOSE 8888
ENV PORT 8888
ENV PYTHONUNBUFFERED 1
ENV PROCESSES 4

CMD ["python", "app.py"]
