FROM mono:latest

RUN mkdir /opt/app

RUN apt-get update && apt-get install -y curl unzip

RUN curl -sLo /opt/app/HKMPServer.exe https://github.com/Extremelyd1/HKMP/releases/download/v2.1.0/HKMPServer.exe
RUN curl -sLo /opt/app/HkmpPouch.dll https://github.com/PrashantMohta/HkmpPouch/releases/download/v0.3.0/HkmpPouch.dll
RUN curl -sLo HKMP_HealthDisplay.zip https://github.com/TheMulhima/HKMP.HealthDisplay/releases/download/v0.0.3.0/HKMP_HealthDisplay.zip

RUN unzip -j HKMP_HealthDisplay.zip HKMP_HealthDisplay.dll -d /opt/app

COPY *.json /opt/app

CMD ["mono", "/opt/app/HKMPServer.exe", "26950"]

EXPOSE 26950
