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
            <th className="border px-4 py-2" key={key}>
              {camelToTitleCase(key)}
            </th>
          ))}
          <th className="border px-4 py-2">Actions</th>
        </tr>
      </thead>
      <tbody>
        {rows.map((row, index) => (
          <tr key={index}>
            {Object.values(row).map((value, index) => (
              <td
                className="border border-gray-300 border-x-gray-300/20 px-4 py-2"
                key={index}
              >
                {value instanceof Date ? value.toLocaleDateString() : value}
              </td>
            ))}
            {/* TODO: Add edit and delete logic */}
            <td className="inline-flex border border-gray-300 border-x-gray-300/20 px-4 py-2">
              <span className="flex grow items-center gap-2">
                <button className="text-blue-600">Edit</button>
                <button className="text-red-500">Delete</button>
              </span>
            </td>
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
