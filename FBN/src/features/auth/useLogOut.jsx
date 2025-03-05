import { useMutation, useQueryClient } from "@tanstack/react-query";
import { logOut } from "../../services/apiAuth";
import toast from "react-hot-toast";
import { useNavigate } from "react-router";

export function useLogOut() {
  const queryClient = useQueryClient();
  const navigate = useNavigate();
  const { mutate: Logout, isPending: isLoggingOut } = useMutation({
    mutationFn: logOut,
    onSuccess: () => {
      toast.success("Logged Out");
      navigate("/login", { replace: true });
      queryClient.removeQueries();
    },
    onError: (err) => {
      console.log("this erro", err);
      toast.success("Logging Out Failed");
    },
    onSettled: () => {
      queryClient.removeQueries();
    },
  });
  return { Logout, isLoggingOut };
}
