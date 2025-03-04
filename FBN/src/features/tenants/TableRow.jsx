import styled from "styled-components";
import Modal from "../../ui/Modal";
import TenantInfo from "./TenantInfo";

const StyledTableRow = styled.div`
  display: grid;
  grid-template-columns: auto auto auto auto;
  font-size: 1.2rem;
  padding: 0.5rem 1rem;
  border-left: 1px solid var(--color-grey-300);
  border-right: 1px solid var(--color-grey-300);
  border-bottom: 1px solid var(--color-grey-300);
  text-align: center;
`;
function TableRow() {
  return (
    <Modal>
      <StyledTableRow>
        <div>Bwanika robert john fgg </div>
        <div>November 2024 </div>
        <div>2000000 </div>
        <Modal.Opens>
          <div>...</div>
        </Modal.Opens>
        <Modal.Window>
          <TenantInfo />
        </Modal.Window>
      </StyledTableRow>
    </Modal>
  );
}

export default TableRow;
