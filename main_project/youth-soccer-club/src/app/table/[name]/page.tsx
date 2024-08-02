import Table from "@/app/_components/Table";
import { connection } from "@/app/_util/db";
import { writeFileSync } from "fs";
import { RowDataPacket } from "mysql2";

interface Row extends RowDataPacket {}

export default async function TablePage({
  params,
}: {
  params: { name: string };
}) {
  const db = await connection;
  const [rows, fieldPackets] = await db.execute<Row[]>(
    `SELECT * FROM ${params.name} LIMIT 100`
  );

  writeFileSync(`./${params.name}.json`, JSON.stringify(fieldPackets));

  return (
    <div>
      <Table tableName={params.name} rows={rows} showActions />
    </div>
  );
}
