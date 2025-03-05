import { createContext, useReducer } from "react";

const LocalStateContext = createContext();

const initialState = {
  menuOpen: false,
};

function reducer(state, action) {
  switch (action.type) {
    case "toggleMenu":
      return { ...state, menuOpen: !state.menuOpen };

    default:
      throw new Error("Unknown action");
  }
}

function LocalStateProvider({ children }) {
  const [{ menuOpen }, dispatch] = useReducer(reducer, initialState);

  return (
    <LocalStateContext.Provider
      value={{
        dispatch,
        menuOpen,
      }}
    >
      {children}
    </LocalStateContext.Provider>
  );
}

export { LocalStateProvider, LocalStateContext };
