## Running PostgreSQL on Docker

### Snippet of postgresql service from Airflow docker-compose

services:  
  postgres: 
    image: postgres:13  
    environment:  
      POSTGRES_USER: root  
      POSTGRES_PASSWORD: root   
      POSTGRES_DB: ny-taxi  
    volumes:  
      - postgres-db-volume:/var/lib/postgresql/data  
    healthcheck:  
      test: ["CMD", "pg_isready", "-U", "airflow"]  
      interval: 10s  
      retries: 5  
      start_period: 5s  
    restart: always  

### Docker command to create PostgreSQL container

`docker run -it  
 -e POSTGRES_USER="root"  
 -e POSTGRES_PASSWORD="root"  
 -e POSTGRES_DB="ny_taxi"
 -v $(pwd)\ny_taxi_pg_data:/var/lib/postgresql/data 
 -p 5432:5432
 postgres:13`

### Loading Data to Postgres
 ---------------
Data Dictionary : [link](https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf) <br>
Data File: [link](https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2021-01.parquet) <br>
Download data file: `Invoke-WebRequest https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2021-01.parquet -OutFile .\data\nyc_taxi_2021_01.parquet`




