import sqlConfig from "@/../mysql.json";
import mysql2, { RowDataPacket } from "mysql2/promise";
import Table from "./Table";

const connection = await mysql2.createConnection(sqlConfig.connection);

interface ClubMember extends ClubMembersEntity, RowDataPacket {}

export default async function ClubMembers() {
  const [members] = await connection.query<ClubMember[]>(
    "SELECT * FROM ClubMembers"
  );

  console.log(members);

  return (
    <div>
      <h1>Club Members</h1>
      <p>Here is a list of all the club members</p>
      <Table rows={members} />
    </div>
  );
}
