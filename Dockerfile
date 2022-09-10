FROM mono:latest

RUN mkdir /opt/app

RUN apt-get update && apt-get install -y curl

RUN curl -sLo /opt/app/HKMPServer.exe https://github.com/Extremelyd1/HKMP/releases/download/v2.1.0/HKMPServer.exe

COPY *.json /opt/app

CMD ["mono", "/opt/app/HKMPServer.exe", "26950"]

EXPOSE 26950
