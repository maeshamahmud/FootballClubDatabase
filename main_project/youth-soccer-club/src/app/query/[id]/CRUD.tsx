"use client";

import { createTables } from "@/app/_actions/query1-6/create";
import { deleteTables } from "@/app/_actions/query1-6/delete";
import { getTables } from "@/app/_actions/query1-6/display";
import { editTables } from "@/app/_actions/query1-6/edit";
import ErrorMessage from "@/app/_components/ErrorMessage";
import { useEffect, useState } from "react";
import DisplayTables from "./DisplayTables";

type TableData = Awaited<ReturnType<typeof getTables>>;

export default function CRUD({
  initialTableData,
}: {
  initialTableData: TableData | null;
}) {
  const [tableData, setTableData] = useState(initialTableData);

  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  const displayTables = async () => {
    const data = await getTables();
    setTableData(data);
  };

  useEffect(() => {
    displayTables();
  }, []);

  return (
    <div className="flex flex-col items-center gap-4">
      CRUD
      <div className="flex items-center gap-4 [&>button:hover]:bg-verdigris/70 [&>button]:h-12 [&>button]:w-16 [&>button]:rounded-lg [&>button]:bg-verdigris/50 [&>button]:text-white">
        <button
          onClick={async () => {
            const { status, message } = await createTables();
            if (!status) {
              setErrorMessage(message);
            } else {
              setErrorMessage(null);
              displayTables();
            }
          }}
        >
          Create
        </button>
        <button
          onClick={async () => {
            const { status, message } = await editTables();
            if (!status) {
              setErrorMessage(message);
            } else {
              setErrorMessage(null);
              displayTables();
            }
          }}
        >
          Edit
        </button>
        <button
          onClick={async () => {
            const { status, message } = await deleteTables();
            if (!status) {
              setErrorMessage(message);
            } else {
              setErrorMessage(null);
              displayTables();
            }
          }}
        >
          Delete
        </button>
        <button
          onClick={() => {
            setTableData(null);
            setTimeout(displayTables, 500);
          }}
        >
          Display
        </button>
      </div>
      {errorMessage && (
        <ErrorMessage
          message={errorMessage}
          onClose={() => setErrorMessage(null)}
        />
      )}
      {tableData && <DisplayTables tableData={tableData} />}
    </div>
  );
}
