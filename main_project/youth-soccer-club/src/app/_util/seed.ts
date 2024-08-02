import { readFileSync } from "fs";
import { getDb } from "./db";

export async function seed() {
  const db = await getDb();

  console.log("Creating database...");
  await db.query(`
    ${readFileSync("./sql/Create.sql", "utf8")}
  `);

  console.log("Populating database...");
  await db.query(`
    ${readFileSync("./sql/Populate.sql", "utf8")}
  `);

  console.log("Seeding complete!");

  process.exit(0);
}

seed();
