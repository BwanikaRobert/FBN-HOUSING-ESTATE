import styled from "styled-components";

const StyledTableHeader = styled.div`
  display: grid;
  grid-template-columns: 1.3fr 0.8fr 1fr;
  text-align: center;
  color: var(--color-grey-600);
  font-weight: 500;
  border: 1px solid var(--color-grey-300);
  margin-top: 1.2rem;

  font-size: 1.2rem;
  padding: 1rem;
`;
function TableHeader() {
  return (
    <StyledTableHeader role="row">
      <div>Name</div>
      <div>Last Payment</div>
      <div>Amount Outstanding</div>
    </StyledTableHeader>
  );
}

export default TableHeader;
