import fs from "fs";
import path from "path";
import CRUD from "./CRUD";

const directoryPath = "./sql/queries";

const queryFilesContents: { [key: `query${string}`]: string } = {};
try {
  const files = fs.readdirSync(directoryPath);

  for (const file of files) {
    if (file.startsWith("query") && path.extname(file) === ".sql") {
      const filePath = path.join(directoryPath, file);
      const fileContents = fs.readFileSync(filePath, "utf8");
      queryFilesContents[file.replace(".sql", "") as `query${string}`] =
        fileContents;
    }
  }

  console.log("Loaded queryFilesContents:", Object.keys(queryFilesContents));
} catch (err) {
  console.error("Error reading directory or file:", err);
}

export default function Query({ params }: { params: { id: string } }) {
  if (Number(params.id) >= 1 && Number(params.id) <= 6) {
    return <CRUD />;
  }

  const querySelection = `query${params.id}` as const;

  const query = queryFilesContents[querySelection];

  if (!query) {
    return <div>Query not found.</div>;
  }

  return (
    <div>
      Query: <pre>{query}</pre>
    </div>
  );
}
