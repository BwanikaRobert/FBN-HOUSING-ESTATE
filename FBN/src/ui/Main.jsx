import { Outlet } from "react-router";
import styled from "styled-components";
import Menu from "./Menu";
import { MenuProvider } from "../services/useMenuApi";

const StyledMain = styled.main`
  padding: 2rem;
  overflow-y: scroll;
`;

function Main() {
  return (
    <StyledMain>
      <Outlet />
      <MenuProvider>
        <Menu />
      </MenuProvider>
    </StyledMain>
  );
}

export default Main;
