import supabase from "./supabase";

export async function getTenants() {
  const { data, error } = await supabase.from("tenants").select("*");
  if (error) {
    throw new Error("Cabins couldnt be loaded");
  }
  return data;
}
