import styled from "styled-components";
import Label from "./Label";
import Input from "./Input";

const StyledFormRow = styled.div`
  display: flex;
  flex-direction: column;
  gap: 0.8rem;
`;

function FormRow({ label, error, children }) {
  return (
    <StyledFormRow>
      <Label htmlFor={children.props.id}>{label}</Label>
      {children}
      {error}
    </StyledFormRow>
  );
}

export default FormRow;
