"use server";

import { readFileSync } from "fs";
import { getDb } from "../../_util/db";

const createTablesSql = readFileSync("./sql/Create.sql", "utf8");

export async function createTables() {
  try {
    const db = await getDb();
    await db.query(createTablesSql);
    return { status: true };
  } catch (err: any) {
    console.error(err);
    return { status: false, message: err.sqlMessage };
  }
}
