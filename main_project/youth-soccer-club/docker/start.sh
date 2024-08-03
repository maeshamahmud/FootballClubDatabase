docker-entrypoint.sh mysqld &

# wait for mysql to start
while ! mysqladmin ping -h "$DB_HOST" --silent; do
  sleep 1
done

# wait for mysql to fully start
sleep 30

# wait for server to start, then load the index page to seed the database (hack)
(sleep 5 && curl -s http://localhost:3000 > /dev/null) &

cd standalone
HOSTNAME=0.0.0.0 SEED=true node ./server.js