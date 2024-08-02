"use server";

import { readFileSync } from "fs";
import { RowDataPacket } from "mysql2";
import { getDb } from "../../_util/db";

const selectTablesSql = readFileSync("./sql/Display.sql", "utf8");

interface Row extends RowDataPacket {}

export async function getTables() {
  try {
    const db = await getDb();
    const [tables, fieldPackets] = await db.query<Row[][]>(selectTablesSql);

    return [tables, fieldPackets.map((packet) => packet.name)] as [
      tables: Row[][],
      tableNames: string[],
    ];
  } catch (err) {
    console.error("Error reading directory or file:", err);
  }
  return null;
}
