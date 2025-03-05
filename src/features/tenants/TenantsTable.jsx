import styled from "styled-components";
import { H2 } from "../../ui/Form";
import TableHeader from "./TableHeader";
import TableRow from "./TableRow";
import TenantInfo from "./TenantInfo";
import { useTenants } from "./useTenants";
const TableBody = styled.div`
  display: flex;
  flex-direction: column;

  & > div:nth-last-of-type(odd) {
    background-color: var(--color-grey-200);
  }
`;
function TenantsTable() {
  const { isLoading, tenants } = useTenants();
  console.log(tenants);
  return (
    <div>
      <H2> All Tenants</H2>
      <TableHeader />
      <TableBody>
        <TableRow />
        <TableRow />
        <TableRow />
        <TableRow />
        <TableRow />
        <TableRow />
      </TableBody>
    </div>
  );
}

export default TenantsTable;
