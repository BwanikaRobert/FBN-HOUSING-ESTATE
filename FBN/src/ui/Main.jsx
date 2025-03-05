import { Outlet } from "react-router";
import styled from "styled-components";
import Menu from "./Menu";

const StyledMain = styled.main`
  padding: 2rem;
  overflow-y: scroll;
`;

function Main() {
  return (
    <StyledMain>
      <Outlet />

      <Menu />
    </StyledMain>
  );
}

export default Main;
