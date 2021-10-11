FROM kmallea/csgo

# add apt sources
USER root
COPY ./ubuntu/sources.list /etc/apt/sources.list

# install wget
RUN  apt-get update && apt-get install -y wget  && rm -rf /var/lib/apt/lists/*

# make directory for later targets
RUN mkdir -p /home/steam/csgo/csgo
RUN mkdir -p /home/steam/csgo/csgo/addons/configs
RUN mkdir -p /home/steam/csgo/csgo/cfg
RUN chmod -R 777 /home/steam
RUN mkdir /logs
RUN chmod -R 777 /logs

# change user back to kmallea/csgo setup
USER steam

# download and unzip github files
RUN mkdir /home/steam/temp-downloads
RUN cd /home/steam/temp-downloads
RUN wget https://github.com/klyve/KZTimerGlobal/releases/download/1.85_1.0/KZTimerGlobal_1.8.5_1.zip -O /home/steam/temp-downloads/KZT
RUN unzip /home/steam/temp-downloads/KZT -d /home/steam/csgo/csgo
#RUN mv -f /home/steam/temp-downloads/kzt_dir/* /home/steam/csgo/csgo

# copy local configuration files
COPY ./configs/server.cfg /home/steam/temp-downloads
COPY ./configs/subscribed_file_ids.txt /home/steam/temp-downloads
COPY ./configs/databases.cfg /home/steam/temp-downloads

# touch config files so they can be overwritten
#RUN echo "" > /home/steam/csgo/csgo/addons/configs/databases.cfg
#RUN echo "" > /home/steam/csgo/csgo/subscribed_file_ids.txt
#RUN echo "" > /home/steam/csgo/csgo/cfg/server.cfg

# (forced) move configuration files
#USER root
#RUN mv -f /home/steam/temp-downloads/databases.cfg /home/steam/csgo/csgo/addons/configs/
#RUN mv -f /home/steam/temp-downloads/subscribed_file_ids.txt /home/steam/csgo/csgo/
#RUN mv -f /home/steam/temp-downloads/server.cfg /home/steam/csgo/csgo/cfg/
#USER steam