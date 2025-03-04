import { useContext } from "react";
import { MenuContext } from "./useMenuApi";

export function useMenu() {
  const context = useContext(MenuContext);
  if (context === undefined) throw new Error("Context out of scope");
  return context;
}
