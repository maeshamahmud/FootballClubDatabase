import sqlConfig from "@/../mysql.json";
import mysql2 from "mysql2/promise";

export const db = await mysql2.createConnection(sqlConfig.connection);
