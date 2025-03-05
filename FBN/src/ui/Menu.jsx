import { FiFilePlus } from "react-icons/fi";
import { Link } from "react-router";
import styled from "styled-components";
import { useLocal } from "../hooks/useLocal";
import { LuHandCoins, LuLogOut, LuUsersRound } from "react-icons/lu";
import { useLogOut } from "../features/auth/useLogOut";

const UL = styled.ul`
  background-color: var(--color-grey-0);
  padding: 1rem;
  width: fit-content;
  display: flex;
  flex-direction: column;
  gap: 1.2rem;
  border-radius: 5px;
  box-shadow: 5px 5px 10px var(--color-grey-300);
  position: fixed;
  top: 56px;
  right: 0;
`;
const ListItem = styled.li`
  border-radius: 5px;

  padding: 0.5rem 1rem;
  &:hover {
    background-color: var(--color-grey-300);
  }
  & svg {
    width: 2.5rem;
    height: 2.5rem;
  }
`;
const StyledLink = styled(Link)`
  display: flex;
  gap: 1.2rem;
  align-items: center;
`;

function Menu() {
  const { menuOpen, dispatch } = useLocal();
  const { Logout } = useLogOut();
  const displayMenu = {
    transform: menuOpen ? "translateX(0)" : "translateX(100%)",
    transition: "transform 0.3s ease-in-out",
  };
  return (
    <UL style={displayMenu}>
      <ListItem>
        <StyledLink to="/form" onClick={() => dispatch({ type: "toggleMenu" })}>
          <FiFilePlus />
          <span>Add payment</span>
        </StyledLink>
      </ListItem>
      <ListItem>
        <StyledLink
          to="/tenants"
          onClick={() => dispatch({ type: "toggleMenu" })}
        >
          <LuUsersRound />
          <span>Tenants</span>
        </StyledLink>
      </ListItem>
      <ListItem>
        <StyledLink
          to="/transactions"
          onClick={() => dispatch({ type: "toggleMenu" })}
        >
          <LuHandCoins />
          <span>Transactions</span>
        </StyledLink>
      </ListItem>
      <ListItem>
        <StyledLink
          onClick={() => {
            dispatch({ type: "toggleMenu" });
            Logout();
          }}
        >
          <LuLogOut />
          <span>Logout</span>
        </StyledLink>
      </ListItem>
    </UL>
  );
}

export default Menu;
