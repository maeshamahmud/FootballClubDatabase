import mysql2, { RowDataPacket } from "mysql2/promise";
import { ClubMembersEntity } from "../../../Database";

const connection = await mysql2.createConnection({
  host: "localhost",
  user: "root",
  database: "test_db",
  password: "my-secret-pw",
});

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
      <ul>
        {members.map((member) => (
          <li key={member.ClubMemberID}>
            {member.FirstName} {member.LastName}
          </li>
        ))}
      </ul>
    </div>
  );
}
