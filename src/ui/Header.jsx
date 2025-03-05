import { Outlet } from "react-router";
import styled from "styled-components";
import Logo from "./Logo";
import MenuButton from "./MenuButton";
const StyledHeader = styled.header`
  background-color: var(--color-grey-100);
  padding: 1rem;
  display: flex;
  justify-content: space-between;
`;

function Header({ handleClick }) {
  return (
    <StyledHeader>
      <Logo />

      <MenuButton handleClick={handleClick} />
    </StyledHeader>
  );
}

export default Header;
