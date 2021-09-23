# -------------
# Beekeper Studio
# IMAGE: debian/buster
# -------------

FROM debian:buster

# pkg: apt-transport-https
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
	ca-certificates && \
    apt clean all

# apt: sources.list
COPY config/sources.list /etc/apt/sources.list

# pkg: dependencies
RUN apt-get update && \
	apt-get upgrade -y && \
	apt install -y \
		wget \
		sudo \
		gnupg2 \
		libgbm-dev \
		libasound2

# pkg: beekeeper-studio
RUN wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add - && \
    echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list && \
    apt-get update && \
    apt install -y beekeeper-studio && \
    apt clean all

# default: launch process
ENTRYPOINT [ "/opt/Beekeeper*/beekeeper-studio" ]
