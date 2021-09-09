FROM python:3.6-slim

RUN apt-get update -y && \
    apt-get install -y python3-pip sudo
    # apt-get install -y build-essential cmake && \
    # apt-get install -y libopenblas-dev liblapack-dev && \
    # apt-get install -y libx11-dev libgtk-3-dev

RUN apt-get install sox -y sudo

COPY ./requirements.txt /requirements.txt

WORKDIR /

RUN pip install numpy-1.11.2-cp35-cp35m-manylinux1_x86_64.whl

RUN pip3 install -r requirements.txt

COPY . /

#EXPOSE 8080

ENTRYPOINT [ "python3" ]

CMD [ "clientApp.py" ]
