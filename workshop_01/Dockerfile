FROM python:3.9
WORKDIR /apps
COPY ./requirements.txt requirements.txt
RUN ["pip","install","-r","requirements.txt"]
EXPOSE 8888
ENTRYPOINT [ "jupyter","notebook"]
CMD ["--ip","0.0.0.0","--no-browser","--allow-root" ]


## `docker run --rm -it -p 8888:8888 -v "$(pwd)/notebook_lib:/apps/notebooks" dlt-hub`