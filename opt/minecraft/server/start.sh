#!/bin/bash
/usr/bin/java -Dcom.mojang.eula.agree=true -Duser.dir=/opt/minecraft/server -Xmx1G -XX:+UseG1GC -jar /opt/minecraft/server/spigot-1.18.1.jar nogui
