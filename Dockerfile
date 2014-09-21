# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER engjoy UG (haftungsbeschraenkt)

# Add the application resources URL
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python python-dev python-distribute python-pip

# Copy the application folder inside the container
ADD /misc /misc
ADD /suricate /suricate

# Get pip to download and install requirements:
RUN pip install -r /misc/requirements.txt

# Install suricate
RUN cd suricate && python setup.py install && cd ..

# Expose ports
EXPOSE 8080
