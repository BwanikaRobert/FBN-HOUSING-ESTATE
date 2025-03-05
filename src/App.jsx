import { BrowserRouter, Navigate, Route, Routes } from "react-router";
import GlobalStyles from "./styles/GlobalStyles";
import Payment from "./pages/Payment";
import AppLayout from "./ui/AppLayout";
import Tenants from "./pages/Tenants";
import Menu from "./ui/Menu";
import Transactions from "./pages/Transactions";
import { LocalStateProvider } from "./hooks/useLocalState";
import Login from "./features/auth/Login";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
import ProtectedRoute from "./ui/ProtectedRoute";
import { Toaster } from "react-hot-toast";

function App() {
  const queryClient = new QueryClient({
    defaultOptions: {
      queries: {
        staleTime: 0,
      },
    },
  });
  return (
    <>
      <QueryClientProvider client={queryClient}>
        <ReactQueryDevtools initialIsOpen={false} />

        <LocalStateProvider>
          <GlobalStyles />
          <BrowserRouter>
            <Routes>
              <Route
                path="/"
                element={
                  <ProtectedRoute>
                    <AppLayout />
                  </ProtectedRoute>
                }
              >
                <Route index replace element={<Navigate to="tenants" />} />
                <Route path="form" element={<Payment />} />
                <Route path="tenants" element={<Tenants />} />
                <Route path="transactions" element={<Transactions />} />
              </Route>
              <Route path="/login" element={<Login />} />
            </Routes>
          </BrowserRouter>
          <Toaster
            position="top-center"
            gutter={12}
            containerStyle={{ margin: "8px" }}
            toastOptions={{
              success: {
                duration: 3000,
              },
              error: {
                duration: 5000,
              },
              style: {
                fontSize: "16px",
                maxWidth: "550px",
                padding: "16px 24px",
                backgroundColor: "var(--color-grey-0)",
                color: "var(--color-grey-700)",
              },
            }}
          />
        </LocalStateProvider>
      </QueryClientProvider>
    </>
  );
}

export default App;
