import styled from "styled-components";
import Header from "./Header";
import Main from "./Main";
import Footer from "./Footer";

const StyledAppLayout = styled.div`
  display: grid;
  grid-template-rows: auto 1fr auto;
  height: 100dvh;
  overflow: hidden;
`;
function AppLayout() {
  return (
    <StyledAppLayout>
      <Header />
      <Main />
      <Footer />
    </StyledAppLayout>
  );
}

export default AppLayout;
