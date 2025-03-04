import { Outlet } from "react-router";
import styled from "styled-components";
import Logo from "./Logo";

import { MenuProvider } from "../services/useMenuApi";
import MenuButton from "./MenuButton";
const StyledHeader = styled.header`
  background-color: var(--color-grey-100);
  padding: 1rem;
  display: flex;
  justify-content: space-between;
`;

function Header() {
  return (
    <StyledHeader>
      <Logo />

      <MenuProvider>
        <MenuButton />
      </MenuProvider>
    </StyledHeader>
  );
}

export default Header;
