type Field = string | number | Date | null;
type Row = Record<string, Field>;

export default function Table({
  rows,
  showActions,
  customCell,
}: {
  rows: Row[];
  showActions?: boolean;
  customCell?: (value: string | number | null) => React.ReactNode;
}) {
  return (
    <table className="min-w-full border border-gray-300 border-x-gray-300/20 bg-verdigris/15">
      <thead>
        <tr>
          {Object.keys(rows[0]).map((key) => (
            <th className="border px-4 py-2" key={key}>
              {camelToTitleCase(key)}
            </th>
          ))}
          {showActions && <th className="border px-4 py-2">Actions</th>}
        </tr>
      </thead>
      <tbody>
        {rows.map((row, index) => (
          <tr key={index}>
            {Object.values(row).map((value, index) => {
              const convertedValue =
                value instanceof Date ? value.toLocaleDateString() : value;
              return (
                <td
                  key={index}
                  className="border border-gray-300 border-x-gray-300/20 px-4 py-2"
                >
                  {customCell ? customCell(convertedValue) : convertedValue}
                </td>
              );
            })}
            {/* TODO: Add edit and delete logic */}
            {showActions && (
              <td className="border border-gray-300 border-x-gray-300/20 px-4 py-2">
                <span className="flex grow items-center gap-2">
                  <button className="text-blue-600">Edit</button>
                  <button className="text-red-500">Delete</button>
                </span>
              </td>
            )}
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
