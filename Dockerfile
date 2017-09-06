FROM marcoskichel/aws-cli

COPY run.sh /run.sh
RUN chmod +x /run.sh

RUN apt-get update && apt-get install -y mysql-client

CMD ["/run.sh"]