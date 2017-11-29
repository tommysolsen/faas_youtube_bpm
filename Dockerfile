FROM debian:stretch
LABEL AUTHOR="Tommy Stigen Olsen <tommysolsen@gmail.com>"

RUN apt-get update
RUN apt-get install -y python python-pip
RUN apt-get install -y sox ffmpeg youtube-dl

ADD https://github.com/openfaas/faas/releases/download/0.6.12/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

WORKDIR /app
ADD http://www.pogo.org.uk/~mark/bpm-tools/releases/bpm-tools-0.3.tar.gz .

RUN tar -xf /app/bpm-tools-0.3.tar.gz -C .
RUN cd bpm-tools-0.3 && make
RUN cp bpm-tools-0.3/bpm .
RUN chmod +x bpm

ADD handler.sh .
RUN chmod +x handler.sh

ENV fprocess="sh ./handler.sh"
CMD [ "fwatchdog" ]