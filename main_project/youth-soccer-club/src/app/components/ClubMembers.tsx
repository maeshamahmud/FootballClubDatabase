import { RowDataPacket } from "mysql2/promise";
import { ClubMembersEntity } from "../../../Database";
import { db } from "../util/db";
import Table from "./Table";

interface ClubMembers extends ClubMembersEntity, RowDataPacket {}

export default async function ClubMembers() {
  const [members] = await db.query<ClubMembers[]>("SELECT * FROM ClubMembers");

  return (
    <div>
      <h1>Club Members</h1>
      <p>Here is a list of all the club members</p>
      <Table rows={members} />
    </div>
  );
}
