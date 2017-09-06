FROM marcoskichel/aws-cli

RUN apt-get update && apt-get install -y mysql-client && apt-get install -y gzip

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]