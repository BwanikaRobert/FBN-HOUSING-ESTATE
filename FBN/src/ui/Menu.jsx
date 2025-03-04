import { FiFilePlus } from "react-icons/fi";
import { Link } from "react-router";
import styled from "styled-components";
import { useMenu } from "../services/useMenu";

const UL = styled.ul`
  background-color: var(--color-grey-0);
  padding: 1rem;
  width: fit-content;
  display: flex;
  flex-direction: column;
  gap: 1.2rem;
  border-radius: 5px;
  box-shadow: 5px 5px 10px var(--color-grey-300);
  position: absolute;
  top: 8.8%;
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
  const { openMenu } = useMenu();
  console.log(openMenu);

  return (
    <UL>
      <ListItem>
        <StyledLink to="/form">
          <FiFilePlus />
          <span>Add payment</span>
        </StyledLink>
      </ListItem>
      <ListItem>
        <StyledLink to="/tenants">
          <FiFilePlus />
          <span>Tenants</span>
        </StyledLink>
      </ListItem>
      <ListItem>
        <StyledLink to="/transactions">
          <FiFilePlus />
          <span>Transactions</span>
        </StyledLink>
      </ListItem>
    </UL>
  );
}

export default Menu;
