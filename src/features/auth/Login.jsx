import styled from "styled-components";
import { H2 } from "../../ui/Form";
import Input from "../../ui/Input";
import FormRow from "../../ui/FormRow";
import Button from "../../ui/Button";
import { useState } from "react";
import { Login as LoginApi } from "../../services/apiAuth";
import { useLogin } from "./useLogin";
import SpinnerMini from "../../ui/SpinnerMini";
const Card = styled.form`
  display: flex;
  flex-direction: column;
  gap: 3rem;
  padding: 4rem;
  width: 50rem;
  background-color: var(--color-grey-0);
  border-radius: 15px;
  box-shadow: 5px 5px 10px var(--color-grey-300);
`;
const StyledBackground = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100dvh;
  background-color: var(--color-grey-100);
`;
const Heading = styled.p`
  font-size: 2rem;
  text-align: center;
  margin: -2rem 0;
`;
const BtnLoad = styled.div`
  display: flex;
  align-items: center;
  gap: 1rem;
  justify-content: center;
`;
function Login() {
  // const [username, setUsername] = useState("bwaniktest@gmail.com");
  const [email, setEmail] = useState("test@gmail.com");
  const [password, SetPassword] = useState("faithmilly");
  const { login, isLoading } = useLogin();
  function handleSubmit(e) {
    e.preventDefault();
    login(
      { email, password },
      {
        onSettled: () => {
          setEmail("");
          SetPassword("");
        },
      }
    );
  }
  return (
    <StyledBackground>
      <Card onSubmit={handleSubmit}>
        <Heading>FBN HOUSING ESTATES</Heading>
        <H2>Login </H2>
        <FormRow label="Username">
          <Input
            autoComplete="username"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            disabled={isLoading}
          />
        </FormRow>
        <FormRow label="Password">
          <Input
            type="password"
            value={password}
            onChange={(e) => SetPassword(e.target.value)}
            disabled={isLoading}
          />
        </FormRow>
        <Button disabled={isLoading}>
          {isLoading ? (
            <BtnLoad>
              <SpinnerMini />
              <span>Login</span>
            </BtnLoad>
          ) : (
            "Login"
          )}
        </Button>
      </Card>
    </StyledBackground>
  );
}

export default Login;
