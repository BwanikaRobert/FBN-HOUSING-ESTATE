import { BrowserRouter, Route, Routes } from "react-router";
import GlobalStyles from "./styles/GlobalStyles";
import Payment from "./pages/Payment";
import AppLayout from "./ui/AppLayout";
import Tenants from "./pages/Tenants";
import Menu from "./ui/Menu";
import Transactions from "./pages/Transactions";

function App() {
  return (
    <>
      <GlobalStyles />
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<AppLayout />}>
            <Route path="form" element={<Payment />} />
            <Route path="tenants" element={<Tenants />} />
            <Route path="menu" element={<Menu />} />
            <Route path="transactions" element={<Transactions />} />
          </Route>
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
