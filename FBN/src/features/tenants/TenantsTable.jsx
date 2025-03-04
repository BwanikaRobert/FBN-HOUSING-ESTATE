import { H2 } from "../../ui/Form";
import TableHeader from "./TableHeader";
import TableRow from "./TableRow";
import TenantInfo from "./TenantInfo";

function TenantsTable() {
  return (
    <div>
      <H2> All Tenants</H2>
      <TableHeader />
      <TableRow />
      <TableRow />
      <TableRow />
      <TableRow />
      <TableRow />
    </div>
  );
}

export default TenantsTable;
