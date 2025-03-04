import styled from "styled-components";

const StyledRow = styled.div`
  display: flex;
  &:has(button) {
    display: flex;
    justify-content: flex-end;
    gap: 1.8rem;
  }
`;

function Row({ children }) {
  return <StyledRow>{children}</StyledRow>;
}

export default Row;
