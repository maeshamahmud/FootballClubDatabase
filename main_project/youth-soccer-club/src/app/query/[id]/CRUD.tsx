"use client";

import { getTables } from "@/app/_actions/getTables";
import { useState } from "react";
import DisplayTables from "./DisplayTables";

export default function CRUD() {
  const [tableData, setTableData] = useState<Awaited<
    ReturnType<typeof getTables>
  > | null>(null);

  return (
    <div className="flex flex-col items-center gap-4">
      CRUD
      <button>Create</button>
      <button>Edit</button>
      <button>Delete</button>
      <button
        onClick={async () => {
          const data = await getTables();
          setTableData(data);
        }}
      >
        Display
      </button>
      {tableData && <DisplayTables tableData={tableData} />}
    </div>
  );
}
