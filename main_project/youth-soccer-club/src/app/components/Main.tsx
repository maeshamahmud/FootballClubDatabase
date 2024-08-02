import { RowDataPacket } from "mysql2/promise";
import Link from "next/link";
import { db } from "../util/db";
import Table from "./Table";

interface Table extends RowDataPacket {}

export default async function Main() {
  const [tables] = await db.execute<Table[]>("SHOW TABLES");

  return (
    <div>
      <h1>Tables</h1>
      <p>Here is a list of all Tables in the database.</p>
      <p>Click on a table name to view it.</p>
      <br />
      <Table
        rows={tables}
        customCell={(value) => (
          <Link href={`/table/${value}`} className="hover:underline">
            {value}
          </Link>
        )}
      />
    </div>
  );
}
