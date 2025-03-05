import { BiMenu } from "react-icons/bi";
import { useLocal } from "../hooks/useLocal";
import { LuX } from "react-icons/lu";

function MenuButton() {
  const { menuOpen, dispatch } = useLocal();
  return (
    <div
      onClick={() => {
        dispatch({ type: "toggleMenu" });
      }}
    >
      {menuOpen ? <LuX /> : <BiMenu />}
    </div>
  );
}

export default MenuButton;
