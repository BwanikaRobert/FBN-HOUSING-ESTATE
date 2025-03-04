import styled from "styled-components";
import { StlyedDiv } from "./Input";
import Label from "./Label";

const StyledTextArea = styled.textarea`
  padding: 0.8rem 1.2rem;
  border: 1px solid var(--color-grey-300);
  border-radius: 5px;
  background-color: var(--color-grey-0);
  box-shadow: var(--shadow-sm);
  width: 100%;
  height: 8rem;
  &:focus {
    outline: none;
  }
`;

function TextArea({ id }) {
  return (
    <StlyedDiv>
      <StyledTextArea id={id}></StyledTextArea>
    </StlyedDiv>
  );
}

export default TextArea;
