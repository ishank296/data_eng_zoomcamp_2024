### Convert data_upload python notebook to script
`jupyter nbconvert --to python upload_data.ipynb`


### python command to ingest data file
 $URL="https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2021-01.parquet" <br>

 `python upload_data.py 
        --user=root 
        --password=root 
        --host=localhost 
        --port=5432 
        --db=ny_taxi 
        --table_name=yellow_taxi_trips 
        --url=${URL}`


### Dockerfile
> FROM python:3.9 <br>
> RUN pip install pandas psycopg2 sqlalchemy  requests pyarrow<br>
> WORKDIR /app <br>
> COPY upload_data.py upload_data.py <br>
> RUN ["python","upload_data.py"] <br>

### Build docker image
`docker build -t taxi_ingestion:v01`

### Running data_ingestion container
` docker run -it --network=pg-network taxi_ingestion:v01
        --user=root 
        --password=root  
        --host=pg_database 
        --port=5432
        --db=ny_taxi
        --table_name=yellow_taxi_trips 
        --url=${URL} ` 