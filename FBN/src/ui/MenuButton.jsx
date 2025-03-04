import { BiMenu } from "react-icons/bi";
import { useMenu } from "../services/useMenu";

function MenuButton() {
  const { setOpenMenu } = useMenu();
  function handleClick() {
    setOpenMenu((value) => !value);
  }
  return <BiMenu onClick={handleClick} />;
}

export default MenuButton;
