### starter command to run ubuntu container in interactive mode
`docker run -it ubuntu bash`

### command to start python v3.9 container
`docker run -it python:3.9`

### Python Dockerfile

> FROM python:3.9 <br>
> RUN pip install pandas <br>
> WORKDIR /app <br>
> COPY pipeline_v1.py pipeline.py <br>
> ENTRYPOINT ["python","pipeline.py"]

### build image command
`docker build -t test:pandas`


