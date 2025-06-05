# syntax=docker/dockerfile:1

FROM ubuntu:latest
WORKDIR /systemd
COPY . .
RUN apt update
RUN apt install python3 -y
RUN apt install make -y
RUN apt install systemctl -y
RUN make build
RUN make build-deb
RUN make lint-deb
CMD ["python3", "bin/systemd_counter.py"]
