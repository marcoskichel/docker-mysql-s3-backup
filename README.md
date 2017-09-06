# docker-mysql-s3-backup
Run mysql backup and store the result on AWS S3

Required Environment Variables:
  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY
  - AWS_DEFAULT_REGION
  - S3_BUCKET
  - MYSQL_HOST
  - MYSQL_PORT
  - MYSQL_DB
  - MYSQL_USER
  - MYSQL_PASS
  
To run it as a scheduled job on a Docker Swarm cluster use a `restart_policy`:

    restart_policy:
        condition: any
        delay: 6h
