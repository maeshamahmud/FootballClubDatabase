docker-entrypoint.sh mysqld &

while ! mysqladmin ping -h "$DB_HOST" --silent; do
  sleep 1
done

cd standalone

HOSTNAME=0.0.0.0 SEED=true node ./server.js