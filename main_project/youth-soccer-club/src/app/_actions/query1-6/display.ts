"use server";

import { readFileSync } from "fs";
import { FieldPacket, RowDataPacket } from "mysql2";
import { getDb } from "../../_util/db";

const selectTablesSql = readFileSync("./sql/Display.sql", "utf8");

interface Row extends RowDataPacket {}

export async function getTables() {
  try {
    const db = await getDb();
    const [tables, fieldPackets] = (await db.query<Row[][]>(
      selectTablesSql
    )) as unknown as [Row[][], FieldPacket[][]];

    // for (const fieldPacket of fieldPackets) {
    //   for (const fieldPacketKey in fieldPacket) {
    //     console.log(fieldPacket[fieldPacketKey as keyof typeof fieldPacket]);
    //   }
    // }

    // TODO get table names
    return [tables, fieldPackets.map((packet) => "")] as [
      tables: Row[][],
      tableNames: string[],
    ];
  } catch (err) {
    console.error("Error reading directory or file:", err);
  }
  return null;
}
