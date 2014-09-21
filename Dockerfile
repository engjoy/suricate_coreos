FROM ubuntu
MAINTAINER engjoy UG (haftungsbeschraenkt)

# apt-get stuff
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y tar build-essential
RUN apt-get install -y python python-dev python-distribute python-pip

# deploy suricate
ADD /misc /misc
ADD /suricate /suricate

RUN pip install -r /misc/requirements.txt

RUN cd suricate && python setup.py install && cd ..
