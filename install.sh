#!/bin/bash
echo 'Install BMS Cloud v0.1.0'
docker-compose up -d --build
echo 'BMS Cloud is started'
echo 'Installation is completed. Navigate to http://0.0.0.0 to explore the BMS cloud UI'
