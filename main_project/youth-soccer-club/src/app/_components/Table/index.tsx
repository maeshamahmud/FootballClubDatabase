"use client";

import { deleteRow, editRow } from "@/app/_actions/tableOps";
import React, { useReducer, useRef, useState } from "react";

type FieldData = string | number | Date | null;
type Row = Record<string, FieldData>;

export default function Table({
  tableName,
  rows,
  showActions,
  CustomCell,
}: {
  tableName: string;
  rows: Row[];
  showActions?: boolean;
  CustomCell?: (props: { value: string | number | null }) => React.ReactNode;
}) {
  const formRef = useRef<HTMLFormElement>(null);

  const [rowIsEditingIdx, _setRowIsEditingIdx] = useState<number | null>(null);
  const setRowIsEditingIdx = (idx: number | null) => {
    _setRowIsEditingIdx(idx);
    if (rowIsDeletingIdx !== null) {
      setRowIsDeletingIdx(null);
    }
  };
  const [rowIsDeletingIdx, _setRowIsDeletingIdx] = useState<number | null>(
    null
  );
  const setRowIsDeletingIdx = (idx: number | null) => {
    _setRowIsDeletingIdx(idx);
    if (rowIsEditingIdx !== null) {
      setRowIsEditingIdx(null);
    }
  };

  const [resetFormKey, resetForm] = useReducer((x) => x + 1, 0);

  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  if (rows.length === 0) {
    return (
      <div className="flex flex-col items-center gap-4">
        <table className="min-w-full overflow-hidden rounded-md border border-gray-300 border-x-gray-300/20 bg-verdigris/15 shadow-md shadow-verdigris/50">
          <div className="p-4">No rows found for {tableName}</div>
        </table>
      </div>
    );
  }

  return (
    <div className="flex flex-col items-center gap-4">
      <form ref={formRef}>
        <table className="min-w-full overflow-hidden rounded-md border border-gray-300 border-x-gray-300/20 bg-verdigris/15 shadow-md shadow-verdigris/50">
          <thead>
            <tr>
              {Object.keys(rows[0]).map((key) => (
                <th className="border px-4 py-2" key={key}>
                  {camelToTitleCase(key)}
                </th>
              ))}
              {showActions && <th className="border px-4 py-2">Actions</th>}
            </tr>
          </thead>
          <tbody>
            {rows.map((row, index) => {
              const isEditing = rowIsEditingIdx === index;
              const isOtherRowEditing = rowIsEditingIdx !== null && !isEditing;

              const isDeleting = rowIsDeletingIdx === index;

              return (
                <tr
                  key={index}
                  className={
                    isOtherRowEditing ? "bg-black/20 text-gray-500" : ""
                  }
                >
                  {Object.entries(row).map(([key, value], index) => {
                    const convertedValue =
                      value instanceof Date
                        ? value.toISOString().substring(0, 10)
                        : value
                          ? value.toString()
                          : "";
                    return (
                      <td
                        key={index}
                        className="border border-gray-300 border-x-gray-300/20 px-4 py-2"
                      >
                        {CustomCell ? (
                          <CustomCell value={convertedValue} />
                        ) : (
                          <textarea
                            key={resetFormKey}
                            defaultValue={convertedValue || undefined}
                            name={isEditing ? key : undefined}
                            readOnly={!isEditing}
                            className="w-full resize-none appearance-none text-nowrap break-all bg-transparent outline-none [-webkit-appearance:none] [field-sizing:content]"
                          />
                        )}
                      </td>
                    );
                  })}

                  {showActions && (
                    <td className="border border-gray-300 border-x-gray-300/20 px-4 py-2">
                      <span className="flex grow select-none items-center justify-center gap-2 font-mono font-bold">
                        {isEditing || isDeleting ? (
                          <>
                            <button
                              className="uppercase text-green-600"
                              onClick={async (e) => {
                                e.preventDefault();
                                e.stopPropagation();

                                if (isDeleting) {
                                  const res = await deleteRow(tableName, row);
                                  if (!res.status) {
                                    resetForm();
                                    setErrorMessage(
                                      `An error occured:\n${res.message}`
                                    );
                                  }
                                  setRowIsDeletingIdx(null);
                                } else {
                                  const formData = new FormData(
                                    formRef.current!
                                  );
                                  const res = await editRow(
                                    tableName,
                                    row,
                                    formData
                                  );
                                  if (!res.status) {
                                    resetForm();
                                    setErrorMessage(
                                      `An error occured:\n${res.message}`
                                    );
                                  }
                                  setRowIsEditingIdx(null);
                                }
                              }}
                            >
                              Confirm
                            </button>
                            <button
                              className="uppercase text-red-500"
                              onClick={(e) => {
                                e.preventDefault();
                                e.stopPropagation();

                                resetForm();
                                setRowIsEditingIdx(null);
                              }}
                            >
                              Cancel
                            </button>
                          </>
                        ) : (
                          <>
                            <button
                              className="uppercase text-blue-600"
                              onClick={(e) => {
                                e.preventDefault();
                                e.stopPropagation();

                                setRowIsEditingIdx(index);
                              }}
                            >
                              &nbsp;&nbsp;&nbsp;Edit
                            </button>
                            <button
                              className="uppercase text-red-500"
                              onClick={async (e) => {
                                e.preventDefault();
                                e.stopPropagation();

                                setRowIsDeletingIdx(index);
                              }}
                            >
                              Delete
                            </button>
                          </>
                        )}
                      </span>
                    </td>
                  )}
                </tr>
              );
            })}
          </tbody>
        </table>
      </form>

      {errorMessage && (
        <div className="flex w-3/4 items-center gap-2 rounded-lg bg-red-crayola p-4 text-sm text-white">
          <span>{errorMessage}</span>
          <button
            className="aspect-square min-w-[32px] rounded-lg bg-night/50 text-white"
            onClick={() => setErrorMessage(null)}
          >
            X
          </button>
        </div>
      )}
    </div>
  );
}

function camelToTitleCase(str: string) {
  return str
    .replace(/([A-Z])/g, " $1")
    .trim()
    .replace(/^./, str[0].toUpperCase());
}
