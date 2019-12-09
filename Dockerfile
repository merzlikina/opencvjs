FROM python:3.7.3


COPY build.sh /app/build.sh
COPY build_js.py /app/build_js.py
COPY opencv_js.config.py /app/opencv_js.config.py
CMD ['mkdir', 'results']

WORKDIR /app

RUN apt-get update && apt-get -y install cmake
RUN chmod +x ./build.sh


CMD ["./build.sh"]

