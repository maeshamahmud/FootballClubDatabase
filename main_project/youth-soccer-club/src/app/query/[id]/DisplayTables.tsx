import { getTables } from "@/app/_actions/getTables";
import Table from "@/app/_components/Table";

export default function DisplayTables({
  tableData,
}: {
  tableData: NonNullable<Awaited<ReturnType<typeof getTables>>>;
}) {
  const [tables, tableNames] = tableData;

  return tables.map((table, index) => (
    <Table
      key={index}
      tableName={tableNames[index]}
      rows={table}
      showActions={true}
    />
  ));
}
