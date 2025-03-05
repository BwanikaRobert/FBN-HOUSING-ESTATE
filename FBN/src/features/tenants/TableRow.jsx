import styled from "styled-components";
import Modal from "../../ui/Modal";
import TenantInfo from "./TenantInfo";
import { LuEllipsis } from "react-icons/lu";

const StyledTableRow = styled.div`
  display: grid;
  grid-template-columns: auto auto auto auto;
  grid-template-columns: 1.3fr 0.8fr 1fr 0.1fr;

  align-items: center;
  font-size: 1.2rem;
  padding: 0.5rem 1rem;
  border-left: 1px solid var(--color-grey-300);
  border-right: 1px solid var(--color-grey-300);
  border-bottom: 1px solid var(--color-grey-300);
  /* text-align: center; */
`;
const StyledMoreBtn = styled.div`
  border-radius: 5px;
  &:hover {
    background-color: var(--color-grey-100);
  }
`;
function TableRow() {
  return (
    <Modal>
      <StyledTableRow>
        <div>Bwanika robert jan </div>
        <div>Nov 2024 </div>
        <div>2000000 </div>
        <Modal.Opens>
          <StyledMoreBtn>
            <LuEllipsis />
          </StyledMoreBtn>
        </Modal.Opens>
        <Modal.Window>
          <TenantInfo />
        </Modal.Window>
      </StyledTableRow>
    </Modal>
  );
}

export default TableRow;
