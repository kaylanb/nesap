FROM ubuntu:16.04
#FROM ubuntu:14.04
#ENV DEBIAN_FRONTEND noninteractive

SHELL ["/bin/bash", "-c"]

#installs python to /usr/bin/python3
#there is no binary named python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-setuptools \
    python3-pip

#python3-pip
#RUN apt-get update && apt-get install -y \
#    pip python3


#RUN sudo apt-get update
#RUN sudo apt-get install python3
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install pybind11 numpy scipy matplotlib
