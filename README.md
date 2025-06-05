# Systemd Simple Counter Service Project

This project implements a basic Linux daemon that counts seconds and logs output to a file, managed by `systemd`. The goal was to gain hands-on experience creating a background service with proper shutdown handling, user isolation, and persistent logging.

---

## Project Overview

I developed a service in Python3 that:

- Writes the current date, time, and a counter value to `/tmp/currentCount.out` every second  
- Handles the `SIGTERM` signal gracefully by writing a shutdown message and exiting cleanly  
- Runs as a dedicated, unprivileged system user created specifically for this service  
- Is managed by `systemd` and starts automatically at system boot  

---

## Core Functionality

The program performs the following actions:

- Opens `/tmp/currentCount.out` for writing  
- Initializes a counter to `0`  
- Every second:
  - Prints a message with my name, timestamp, and count to

