FROM python:3.9
RUN pip install pandas sqlalchemy requests psycopg2 pyarrow
WORKDIR /app
COPY ./upload_data.py upload_data.py
ENTRYPOINT ["python","upload_data.py"]
