# -------------
# Beekeper Studio
# IMAGE: debian/buster
# -------------

FROM debian:buster

# pkg: apt-transport-https
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https && \
    apt clean all

# apt: sources.list
COPY config/sources.list /etc/apt/sources.list

# pkg: beekeeper-studio
RUN wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add - && \
    echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list && \
    apt-get update && \
    apt install -y beekeeper-studio && \
    apt clean all

ENTRYPOINT [ "beekeeper-studio" ]
