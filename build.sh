#!/bin/bash
docker build -t vnc-desktop .
docker run -d -p 5900:5900 -p 2222:22 --name vnc-container vnc-desktop
