import { useMutation, useQueryClient } from "@tanstack/react-query";
import { Login as LoginApi } from "../../services/apiAuth";
import { useNavigate } from "react-router";
import toast from "react-hot-toast";

export function useLogin() {
  const navigate = useNavigate();
  const queryClient = useQueryClient();
  const { mutate: login, isPending: isLoading } = useMutation({
    mutationFn: ({ email, password }) => LoginApi({ email, password }),

    onSuccess: (user) => {
      navigate("/tenants", { replace: true });
      queryClient.setQueriesData(["user"], user);
      toast.success("User signed successfully");
    },
    onError: (err) => {
      toast.error("Incorrect email or password");
    },
  });

  return { login, isLoading };
}
