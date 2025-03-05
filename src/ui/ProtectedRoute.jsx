import styled from "styled-components";
import { useUser } from "../features/auth/useUser";
import Spinner from "./Spinner";
import { useNavigate } from "react-router";
import { useEffect } from "react";
const FullPage = styled.div`
  height: 100dvh;
  display: flex;
  align-items: center;
  justify-content: center;
`;
function ProtectedRoute({ children }) {
  const navigate = useNavigate();
  // 1 Load the authenticated user
  const { user, isLoading, isAuthenticated } = useUser();

  // 3 if not authenticated redirect
  useEffect(() => {
    if (!isAuthenticated && !isLoading) {
      navigate("/login");
    }
  }, [isAuthenticated, isLoading, navigate]);

  // 4 login

  // 2 While Loaing show a spinenr
  if (isLoading)
    return (
      <FullPage>
        <Spinner />
      </FullPage>
    );
  if (isAuthenticated) return children;
}

export default ProtectedRoute;
