import { RowDataPacket } from "mysql2/promise";
import { connection } from "../_util/db";
import Table from "./Table";
import TableLink from "./Table/TableLink";

interface Table extends RowDataPacket {}

export default async function Main() {
  const db = await connection;
  const [tables] = await db.execute<Table[]>("SHOW TABLES");

  return (
    <div>
      <h1>Tables</h1>
      <p>Here is a list of all Tables in the database.</p>
      <p>Click on a table name to view it.</p>
      <br />
      <TableLink tableName={Object.keys(tables)[0]} tables={tables} />
    </div>
  );
}
