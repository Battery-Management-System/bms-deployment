#!/bin/bash
echo 'Install BMS Cloud'
docker-compose pull
docker-compose up -d --build
echo 'BMS Cloud is started'
echo 'Installation is completed. Navigate to http://0.0.0.0 to explore the BMS cloud UI'
