#!/bin/sh

x11docker \
	--home=x11.beekeeper \
	--hostnet \
	--share /data/workspace/aurora:ro \
	-- --security-opt seccomp=unconfined --  \
	x11.beekeeper:latest

set +x;