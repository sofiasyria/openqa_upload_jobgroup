FROM opensuse/tumbleweed 

RUN zypper in -y openQA-client
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
