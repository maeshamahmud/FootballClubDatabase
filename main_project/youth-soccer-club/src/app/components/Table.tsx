export default function Table({
  rows,
}: {
  rows: Record<string, string | number | Date | null>[];
}) {
  return (
    <table className="min-w-full border border-gray-300 border-x-gray-300/20 bg-verdigris/5">
      <thead>
        <tr>
          {Object.keys(rows[0]).map((key) => (
            <th className="py-2 px-4 border" key={key}>
              {camelToTitleCase(key)}
            </th>
          ))}
        </tr>
      </thead>
      <tbody>
        {rows.map((row, index) => (
          <tr key={index}>
            {Object.values(row).map((value, index) => (
              <td
                className="py-2 px-4 border border-gray-300 border-x-gray-300/20"
                key={index}
              >
                {value instanceof Date ? value.toLocaleDateString() : value}
              </td>
            ))}
          </tr>
        ))}
      </tbody>
    </table>
  );
}

function camelToTitleCase(str: string) {
  return str
    .replace(/([A-Z])/g, " $1")
    .trim()
    .replace(/^./, str[0].toUpperCase());
}
