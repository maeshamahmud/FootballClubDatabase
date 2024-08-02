export default function Query({ params }: { params: { id: string } }) {
  return <div>Page: {params.id}</div>;
}
