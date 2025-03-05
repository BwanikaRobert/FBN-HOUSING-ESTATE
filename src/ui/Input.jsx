import styled from "styled-components";
import Label from "./Label";

const Input = styled.input`
  padding: 1.2rem 1.8rem;
  font-size: 1.5rem;
  border: 1px solid var(--color-grey-300);

  border-radius: 5px;
  &:focus {
    outline: none;
  }
  &::placeholder {
    font-size: 1.6rem;
  }
`;

export const StlyedDiv = styled.div`
  display: flex;
  flex-direction: column;
  gap: 1rem;
`;

// function Input({ label, placeholder, type, id, defaultValue }) {
//   console.log(id);
//   return (
//     <StlyedDiv>
//       <Label label={label} id={id} />
//       <StyledInput
//         placeholder={placeholder}
//         type={type || "text"}
//         id={id}
//         defaultValue={defaultValue}
//       ></StyledInput>
//     </StlyedDiv>
//   );
// }

export default Input;
