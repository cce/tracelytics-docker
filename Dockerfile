FROM ubuntu:14.04

# Install system dependencies
RUN apt-get -y update
RUN apt-get -y install curl

# Add tracelytics conf
ADD appneta.list /etc/apt/sources.list.d/appneta.list
ADD tracelytics.conf /etc/tracelytics.conf
RUN groupadd --gid 1000 appneta
RUN useradd --uid 1000 --gid 1000 --home /var/log/tracelytics -c "AppNeta Daemon" --shell /bin/false appneta

# Install Tracelyzer
RUN /bin/sh -c "curl https://apt.appneta.com/appneta-apt-key.pub | apt-key add -"
RUN apt-get -y update
RUN apt-get -y install liboboe0 liboboe-dev tracelyzer

RUN mkdir -p /var/log/tracelyzer
RUN touch /var/log/tracelyzer/ssh.status /var/log/tracelyzer/ssh.status.tmp /var/log/tracelyzer/tracelyzer.status /tracelyzer.status
RUN chown -R appneta:appneta /var/log/tracelyzer /tracelyzer.status
RUN chmod 600 /etc/tracelyzer/auth_client

ADD tracelyzer /opt/tracelyzer/tracelyzer.sh

USER appneta
CMD /opt/tracelyzer/tracelyzer.sh
EXPOSE 7831/udp
VOLUME /var/lib/tracelyzer
