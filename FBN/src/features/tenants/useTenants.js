import { useQuery } from "@tanstack/react-query";
import { getTenants } from "../../services/apiTenants";

export function useTenants() {
  const { isLoading, data: tenants } = useQuery({
    queryKey: ["tenants"],
    queryFn: getTenants,
  });
  return { isLoading, tenants };
}
