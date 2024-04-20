FROM python:3.11.9-slim-bookworm

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install -r /code/requirements.txt

COPY ./app /code/app



EXPOSE 80

ENTRYPOINT ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
# CMD  ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]