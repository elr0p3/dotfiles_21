#!/bin/bash

if [ -z "$(ps aux|grep "/usr/bin/python /usr/bin/screenkey$")" ]
then
	screenkey
else
	killall screenkey;
fi
