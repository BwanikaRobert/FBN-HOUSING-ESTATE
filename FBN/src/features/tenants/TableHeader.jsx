import styled from "styled-components";

const StyledTableHeader = styled.div`
  display: grid;
  grid-template-columns: 1.3fr 0.8fr 1fr 0.1fr;

  color: var(--color-grey-600);
  font-weight: 500;
  color: var(--color-grey-0);
  background-color: var(--color-grey-900);
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  margin-top: 1.2rem;

  font-size: 1.2rem;
  padding: 2rem 1rem;
`;
const Outstanding = styled.div`
  /* margin-right: -11rem; */
`;
const LastPayment = styled.div`
  /* margin-right: -5rem; */
`;

function TableHeader() {
  return (
    <StyledTableHeader role="row">
      <div>Name</div>
      <LastPayment>L/Payment</LastPayment>
      <Outstanding>A/Outstanding</Outstanding>
    </StyledTableHeader>
  );
}

export default TableHeader;
