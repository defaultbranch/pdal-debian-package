FROM docker.io/library/debian:bookworm-slim
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y cmake
RUN apt-get install -y g++
WORKDIR /
RUN git clone https://github.com/PDAL/PDAL.git --quiet --depth 1 --branch 2.7.2
WORKDIR PDAL
RUN apt-get install -y libproj-dev
RUN apt-get install -y libgdal-dev
RUN cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
RUN cmake --build build --parallel 4
#RUN cmake --build build --target test --parallel 12
#RUN cmake --install build --prefix /usr
