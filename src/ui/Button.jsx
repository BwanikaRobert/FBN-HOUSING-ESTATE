import styled, { css } from "styled-components";

const StyledButton = styled.button`
  border: none;
  text-transform: capitalize;
  padding: 1rem 1.6rem;
  border-radius: 5px;
  font-size: 1.6rem;
  background-color: var(--color-brand-700);
  color: var(--color-grey-0);
  &:hover {
    background-color: var(--color-brand-900);
  }
  ${(props) =>
    props.type === "reset" &&
    css`
      border: 1px solid var(--color-brand-800);
      color: var(--color-brand-800);
      background-color: var(--color-brand-400);
      &:hover {
        color: var(--color-grey-0);
        background-color: var(--color-red-700);
        border: 1px solid var(--color-red-700);
      }
    `}
  &:focus {
    outline: 1px solid var(--color-brand-300);
  }
`;

function Button({ children, type }) {
  return <StyledButton type={type}>{children}</StyledButton>;
}

export default Button;
