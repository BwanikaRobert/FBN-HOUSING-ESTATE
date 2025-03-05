import { useContext } from "react";
import { LocalStateContext } from "./useLocalState";

function useLocal() {
  const context = useContext(LocalStateContext);
  if (context == undefined) throw new Error("Context outofscope");

  return context;
}

export { useLocal };
