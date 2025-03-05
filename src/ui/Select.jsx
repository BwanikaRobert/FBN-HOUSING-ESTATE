import styled from "styled-components";
import Label from "./Label";
import { StlyedDiv } from "./Input";

const StyledSelect = styled.select`
  padding: 1.2rem 1.8rem;
  font-size: 1.5rem;
  border-radius: 5px;
  max-width: 120rem;
  border: 1px solid var(--color-grey-300);

  &:focus {
    outline: none;
  }
  &::placeholder {
    font-size: 1.6rem;
  }
`;
const StyledOption = styled.option`
  max-width: 120rem;
  text-transform: uppercase;
`;

function Select({
  label,
  options = [{ name: "double" }, { name: "single" }],
  defaultValue,
}) {
  return (
    <StlyedDiv>
      <Label label={label} />
      <StyledSelect>
        <StyledOption>{defaultValue}</StyledOption>
        {options.map((tenant) => (
          <StyledOption key={tenant.name}>{tenant.name}</StyledOption>
        ))}
      </StyledSelect>
    </StlyedDiv>
  );
}

export default Select;
