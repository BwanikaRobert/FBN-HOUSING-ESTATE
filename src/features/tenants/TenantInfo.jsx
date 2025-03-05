import styled, { css } from "styled-components";

const TenantBox = styled.div`
  font-size: 1.4rem;
`;
const InfoBox = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1.4rem;
  padding: 1.5rem 0;
  border-bottom: 1px solid var(--color-grey-300);
`;
const Name = styled.div`
  align-self: flex-start;
`;
const Contact = styled.div`
  font-size: 1.2rem;
`;
const InfoSmallBox = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.2rem;
`;
const ImgBox = styled.div`
  width: 5rem;
  height: 5rem;
`;
const Img = styled.img``;
const Grid = styled.div`
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  padding: 1.2rem 0;
  & div:last-of-type {
    grid-column: -3/-1;
  }
`;
const DetailBox = styled.div`
  font-size: 1rem;

  display: flex;
  gap: 0.4rem;
`;
const Detail = styled.span`
  ${(props) =>
    props.type === "label" &&
    css`
      font-weight: bold;
    `}
`;
function TenantInfo() {
  return (
    <TenantBox>
      <InfoBox>
        <ImgBox>
          <Img src="../../../public/user.png" />
        </ImgBox>
        <InfoSmallBox>
          <Name>Bwanika Robert</Name>
          <Contact> +256 757 082 687</Contact>
        </InfoSmallBox>
      </InfoBox>
      <Grid>
        <DetailBox>
          <Detail type="label">Amount Per Month:</Detail>
          <Detail>200,000</Detail>
        </DetailBox>
        <DetailBox>
          <Detail type="label">Last Paid Month:</Detail>
          <Detail>November 2024</Detail>
        </DetailBox>
        <DetailBox>
          <Detail type="label">Room Catergory:</Detail>
          <Detail>Double</Detail>
        </DetailBox>
        <DetailBox>
          <Detail type="label">Extra Charges:</Detail>
          <Detail>200,000</Detail>
        </DetailBox>
        <DetailBox>
          <Detail type="label">Last Transaction Date:</Detail>
          <Detail> 15/03/2024</Detail>
        </DetailBox>
      </Grid>
    </TenantBox>
  );
}

export default TenantInfo;
