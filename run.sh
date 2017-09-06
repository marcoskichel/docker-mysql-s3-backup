#!/bin/sh
cd /tmp
file=$(TZ='America/Sao_Paulo' date +%Y-%m-%d-%H:%M:%S).sql
echo "Filename ${file}"
mysqldump \
  --host ${MYSQL_HOST} \
  --port ${MYSQL_PORT} \
  -u ${MYSQL_USER} \
  --password="${MYSQL_PASS}" \
  ${MYSQL_DB} > ${file}
if [ "${?}" -eq 0 ]; then
  gzip ${file}
  aws s3 cp ${file}.gz s3://${S3_BUCKET}
  rm ${file}.gz
else
  echo "Error backing up mysql"
  exit 255
fi
