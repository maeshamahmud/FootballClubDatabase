import sqlConfig from "@/../mysql.json";
import mysql2 from "mysql2/promise";

let connection: mysql2.Connection | null = null;
let connectionPromise: Promise<mysql2.Connection | null> | null = null;

export async function getDb() {
  let maxTries = 30;
  while (true) {
    connectionPromise ??= mysql2
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
      })
      .finally(() => {
        connectionPromise = null;
      });

    connection = await connectionPromise;

    if (maxTries === 0) {
      throw new Error("Could not connect to database");
    }
    maxTries--;

    if (!connection) {
      await new Promise((resolve) => setTimeout(resolve, 3000));
    } else {
      break;
    }
  }
  return connection;
}
