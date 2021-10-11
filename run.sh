docker-compose up -d

docker exec kz-csgo mkdir /home/steam/csgo/csgo/addons/configs
docker exec kz-csgo cp -f /home/steam/temp-downloads/databases.cfg /home/steam/csgo/csgo/addons/configs/ && cp -f /home/steam/temp-downloads/subscribed_file_ids.txt /home/steam/csgo/csgo/ && RUN cp -f /home/steam/temp-downloads/server.cfg /home/steam/csgo/csgo/cfg/