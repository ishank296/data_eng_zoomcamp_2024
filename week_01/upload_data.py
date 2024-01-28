#!/usr/bin/env python
# coding: utf-8


import argparse
import pandas as pd
import os
from sqlalchemy import create_engine
import requests

def main(params):
    user = params.user
    password = params.password
    host = params.host
    port = params.port
    db = params.db
    table_name = params.table_name
    file_url = params.url
    data_format = params.data_format
    #file_name = f"out.{data_format}"
    file_name = os.path.basename(file_url)
    print("downloading file")
    #os.system(f"wget {file_url} -O {file_name}")
    file_content = requests.get(file_url)
    with open(file_name,'wb') as local_file:
        local_file.write(file_content.content)
    file_content.close()
    print("file downloaded")
    engine = create_engine(f"postgresql://{user}:{password}@{host}:{port}/{db}")
    engine.connect()
    if data_format == 'parquet':
        df = pd.read_parquet(file_name)
    elif data_format == 'csv':
        df= pd.read_csv(file_name)
    else:
        raise Exception("Invalid data format provided")
    for col in df.columns:
        if 'datetime' in col:
            df[col]=pd.to_datetime(df[col])
            df[col]=pd.to_datetime(df[col])
    print(pd.io.sql.get_schema(df,name=table_name))
    df.head(n=0).to_sql(con=engine,name=table_name,if_exists='replace')
    #get_ipython().run_line_magic('time', "df.to_sql(con=engine,name='yellow_taxi_data',if_exists='append')")
    print("Ingesting data file to postgres db..")
    df.to_sql(con=engine,name=table_name,if_exists='append')


parser = argparse.ArgumentParser(description="ingest data file to Postgres")
# user,pasword,host,port,table,database
# url of the data file
parser.add_argument("--user",help="user name for postgres db")
parser.add_argument("--password",help="password for postgres db")
parser.add_argument("--host",help="hostname url for postgres db")
parser.add_argument("--port",help="port number for postgres db")
parser.add_argument("--db",help="db name for postgres db")
parser.add_argument("--table_name",help="table name for postgres db")
parser.add_argument("--url",help="url for data file")
parser.add_argument("--data_format",help="data file format: csv/parquet",default="parquet")
args = parser.parse_args()
main(args)






#get_ipython().system('pip install psycopg2')
# $URL="https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2021-01.parquet"
# python upload_data.py `
#        --user=root `
#        --password=root `
#        --host=localhost `
#        --port=5432 `
#        --db=ny_taxi `
#        --table_name=yellow_taxi_trips `
#        --url=${URL}







