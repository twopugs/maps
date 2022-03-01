<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="NetoAPI" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/GetOrderResponse" />
  </xsl:template>
  <xsl:template match="/GetOrderResponse">
    <UniversalShipment>
      <xsl:for-each select="Order">
        <xsl:if test="contains(OrderLine/WarehouseName/text(), 'EIF')">
          <xsl:variable name="var:v1" select="userCSharp:StringConcat(string(ID/text()))" />
          <Shipment>
            <DataContext>
              <DataTargetCollection>
                <DataTarget>
                  <Type>WarehouseOrder</Type>
                </DataTarget>
              </DataTargetCollection>
            </DataContext>     
            <OrganizationAddressCollection>
              <OrganizationAddress>
                <OrganizationCode>
                  <xsl:value-of select="string('RUNVAWMEL')" />
                </OrganizationCode>
                <AddressType>
                  <xsl:value-of select="string('SendersLocalClient')" />
                </AddressType>
              </OrganizationAddress>
                <OrganizationAddress>
                <OrganizationCode>
                  <xsl:value-of select="string('RUNVAWMEL')" />
                </OrganizationCode>
                <AddressType>
                  <xsl:value-of select="string('ConsignorDocumentaryAddress')" />
                </AddressType>
              </OrganizationAddress>
                <OrganizationAddress>
                  <Address1>
                    <xsl:value-of select="ShipStreetLine1/text()" />
                  </Address1>
                  <Address2>
                    <xsl:value-of select="ShipStreetLine2/text()" />
                  </Address2>
                  <Email>
                    <xsl:value-of select="Email/text()" />
                  </Email>
                  <City>
                    <xsl:value-of select="ShipCity/text()" />
                  </City>
                  <AddressType>
                    <xsl:value-of select="string('ConsigneeAddress')" />
                  </AddressType>
                  <AddressOverride>
                    <xsl:value-of select="string('true')" />
                  </AddressOverride>
				    <SuppressAddressValidationError>
                    <xsl:value-of select="string('true')" />
                  </SuppressAddressValidationError>
                  <CompanyName>
                    <xsl:choose>
                      <xsl:when test="ShipCompany/text()">
                        <xsl:value-of select="ShipCompany/text()" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="concat(ShipFirstName/text(),' ',ShipLastName/text())" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </CompanyName>
                  <Phone>
                    <xsl:value-of select="ShipPhone/text()" />
                  </Phone>
                  <Contact>
                    <xsl:value-of select="concat(ShipFirstName/text(),' ',ShipLastName/text())" />
                  </Contact>
                  <Country>
                    <Code>
                      <xsl:value-of select="ShipCountry/text()" />
                    </Code>
                  </Country>
                  <State>
                    <xsl:value-of select="ShipState/text()" />
                  </State>
                  <Postcode>
                    <xsl:value-of select="ShipPostCode/text()" />
                  </Postcode>
                  <AdditionalAddressInformation>
                    <xsl:value-of select="ShippingOption/text()" />
                  </AdditionalAddressInformation>
                </OrganizationAddress>
            </OrganizationAddressCollection>
            <LocalProcessing>
              <DeliveryRequiredBy>
                <xsl:choose>
                  <xsl:when test="string-length(DateRequired/text())>0">
                    <xsl:value-of select="userCSharp:ConvertDateRequiredValue(DateRequired/text())"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="userCSharp:GetDateTimeNow()"/>
                  </xsl:otherwise>
                </xsl:choose>
                
              </DeliveryRequiredBy>
            </LocalProcessing>
            <xsl:if test="DeliveryInstruction/text()">
              <NoteCollection>
                <Note>
                  <NoteText>
                    <xsl:value-of select="DeliveryInstruction/text()"/>
                  </NoteText>
                  <Description>
                    <xsl:value-of select="string('Goods Handling Instructions')"/>
                  </Description>
                </Note>
              </NoteCollection>
            </xsl:if>
            <Order>
              <OrderNumber>
                <xsl:value-of select="OrderID/text()"/>
              </OrderNumber>
              <Warehouse>
                <Code>
                  <xsl:value-of select="string('MEL')"/>
                </Code>
              </Warehouse>
              <OrderLineCollection>
                <xsl:for-each select="OrderLine">
                  <OrderLine>
                    <OrderedQty>
                      <xsl:value-of select="Quantity/text()"/>
                    </OrderedQty>
                    <Product>
                      <Code>
                        <xsl:value-of select="SKU/text()"/>
                      </Code>
                    </Product>
                    <UnitPriceAfterDiscount>
                      <xsl:value-of select="UnitPrice/text()"/>
                    </UnitPriceAfterDiscount>
                  </OrderLine>
                </xsl:for-each>
              </OrderLineCollection>
            </Order>

          </Shipment>
        </xsl:if>
      </xsl:for-each>
    </UniversalShipment>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
  <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}
 public static string ConvertDateRequiredValue(string inputDateString)
              {
                string outDateString;
                System.DateTime dt = DateTime.ParseExact(inputDateString, "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  

public static string GetDateTimeNow()
              {
                string outDateString;
                outDateString = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  


]]></msxsl:script>
</xsl:stylesheet>