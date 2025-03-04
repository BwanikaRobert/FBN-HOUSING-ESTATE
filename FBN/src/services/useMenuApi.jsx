import { createContext, useState } from "react";

const MenuContext = createContext(null);

function MenuProvider({ children }) {
  const [openMenu, setOpenMenu] = useState(false);
  return (
    <MenuContext.Provider
      value={{
        openMenu,
        setOpenMenu,
      }}
    >
      {children}
    </MenuContext.Provider>
  );
}

export { MenuProvider, MenuContext };
