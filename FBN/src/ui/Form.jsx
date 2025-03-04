import styled from "styled-components";
import Select from "./Select";
import Input from "./Input";
import Button from "./Button";
import TextArea from "./TextArea";
import Row from "./Row";
import FormRow from "./FormRow";
import Label from "./Label";

const StyledForm = styled.form`
  display: flex;
  flex-direction: column;
  gap: 2rem;

  padding: 2rem;
`;
export const H2 = styled.h2`
  text-align: center;
  text-transform: capitalize;
`;
const FakeTenants = [
  {
    name: "Nakuzi Doreen",
    amountPerMonth: 120000,
    roomType: "single",
    extraRoom: {
      amountExtraRoom: 70000,
    },
  },
  {
    name: "Ssetumba Mark",
    amountPerMonth: 200000,
    roomType: "Double",
    extraRoom: {
      amountExtraRoom: null,
    },
  },
  {
    name: "Kasibante Rodney",
    amountPerMonth: 200000,
    roomType: "double",
    extraRoom: {
      amountExtraRoom: 70000,
    },
  },
];
function Form() {
  return (
    <StyledForm>
      <H2>add tenant's payment</H2>
      <Select
        label="Tenant's Name"
        options={FakeTenants}
        defaultValue="Select Tenant's Name"
        id="tenantName"
      />

      <FormRow label="Last Month Paid">
        <Input id="lastMonthPay" />
      </FormRow>
      <FormRow label="Amount Outstanidng">
        <Input id="amountOutstanding" type="number" value={200000} />
      </FormRow>
      <FormRow label="Amount Paid">
        <Input id="amountPaid" type="number" />
      </FormRow>
      <FormRow label="Room Catergory">
        <Select defaultValue="Room Catergory" id="roomCatergory" />
      </FormRow>
      <FormRow label="Enter message from Airtel or MTN">
        <TextArea id="description" />
      </FormRow>
      <Row>
        <Button type="reset">cancel</Button>
        <Button>upload</Button>
      </Row>
    </StyledForm>
  );
}

export default Form;
