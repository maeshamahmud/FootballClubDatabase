"use server";

import sql, { join, raw } from "sql-template-tag";
import { connection } from "../_util/db";

export async function editRow(
  tableName: string,
  originalRow: Record<string, string | number | Date | null>,
  row: FormData
) {
  const entries = Object.fromEntries(row.entries()) as Record<string, string>;
  for (const key in entries) {
    if (key.startsWith("$")) {
      delete entries[key];
    } else {
      break;
    }
  }

  try {
    const db = await connection;

    const q = sql`UPDATE \`${raw(tableName)}\` SET ${entries} WHERE ${join(
      Object.entries(originalRow).map(
        ([key, value]) => sql`\`${raw(key)}\` = ${value}`
      ),
      " AND "
    )}`;

    console.log("\n\nExecuting query:\n", q.text, q.values, "\n\n");

    await db.query(q.sql, q.values);
  } catch (e) {
    console.error(e);
    return { status: false };
  }

  return { status: true };
}

export async function deleteRow(
  tableName: string,
  originalRow: Record<string, string | number | Date | null>
) {
  try {
    const db = await connection;

    const q = sql`DELETE FROM \`${raw(tableName)}\` WHERE ${join(
      Object.entries(originalRow).map(
        ([key, value]) => sql`\`${raw(key)}\` = ${value}`
      ),
      " AND "
    )}`;

    console.log("\n\nExecuting query:\n", q.text, q.values, "\n\n");

    await db.query(q.sql, q.values);
  } catch (e) {
    console.error(e);
    return { status: false };
  }

  return { status: true };
}
