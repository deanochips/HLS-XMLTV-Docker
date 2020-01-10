This is a Docker containerized version of [HLS / XMLTV Home broadcasting](https://github.com/deanochips/HLS-XMLTV---Home-Broadcasting) 
------------------------------------------------------------------------------------------------------------------
# HLS / XMLTV Home broadcasting Docker

## Requirements

* Docker
* Docker-Compose 

(if no docker compose installed, a experimental docker run command is in docker-compose.yml)

## Setup

### 1 
* clone or download repo to your host
* edit docker-compose.yml with your details
* run "$ bash build.sh" - this will pass variables to docker-compose up

container should be built...


### 2
* run "$ bash tools.sh" - this should make your life much easier all the items below are available (this can copied anywhere you like on the host)
* create concat lists for your channels
* edit config.cfg changing the info in arg_array with your channel info (if you want full episode info and not just filenames you need to enter a tvmaze show id...its the number in the main show url)
* once all setup, comment out the if CRON EXIT command on line 32 and save

if you want to force it to update you can restart, it will boot itself in 3 minuites

you can watch the files start to be generated in <docker_host_ip>:3000/, the first run will take a while to generate the epg but the m3u8 will be readible in the streams folder almost immediately (these can be copy and paste into VLC open network stream for the impatient) 

once the script finished the m3u will be in the base dir of the webdir and xmltv will be in the sub folder

#### License


* [GNU GPL v3](http://www.gnu.org/licenses/gpl.html)
* Copyright 2010-2020
