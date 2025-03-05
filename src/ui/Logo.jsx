import { LuHouse } from "react-icons/lu";
import styled from "styled-components";

const H2 = styled.h1`
  font-size: 2.4rem;
  text-transform: uppercase;
  font-weight: normal;
  display: flex;
  align-items: center;
  gap: 2rem;
`;
function Logo() {
  return (
    <H2>
      <LuHouse />
      <span>fbn housing estate</span>
    </H2>
  );
}

export default Logo;
