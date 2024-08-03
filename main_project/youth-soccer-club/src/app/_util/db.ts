import sqlConfig from "@/../mysql.json";
import mysql2 from "mysql2/promise";

let connection: mysql2.Connection | null = null;

export async function getDb() {
  let maxTries = 3;
  while (!connection) {
    connection = await mysql2
      .createConnection({
        ...sqlConfig.connection,
        multipleStatements: true,
      })
      .then((connection) => {
        console.log("Connected to database");
        return connection;
      })
      .catch((err) => {
        console.error(err);
        return null;
      });

    if (maxTries === 0) {
      throw new Error("Could not connect to database");
    }
    maxTries--;

    if (!connection) {
      await new Promise((resolve) => setTimeout(resolve, 500));
    }
  }
  return connection;
}
