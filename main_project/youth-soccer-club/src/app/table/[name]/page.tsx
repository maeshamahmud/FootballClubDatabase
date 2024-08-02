import Table from "@/app/components/Table";
import { db } from "@/app/util/db";
import { RowDataPacket } from "mysql2";

interface Row extends RowDataPacket {}

export default async function TablePage({
  params,
}: {
  params: { name: string };
}) {
  const [rows] = await db.query<Row[]>(
    `SELECT * FROM ${params.name} LIMIT 100`
  );

  return (
    <div>
      <Table rows={rows} showActions />
    </div>
  );
}
