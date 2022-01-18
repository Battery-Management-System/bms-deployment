echo 'Install BMS Cloud v0.1.0'
docker-compose up -d --build
echo 'BMS backend is starting... (about 30s)'
sleep 3s
echo 'BMS backend is started'
docker exec -it bms-backend node bin/autoupdate

echo 'Installation is completed. Navigate to http://0.0.0.0 to explore the BMS cloud UI'
