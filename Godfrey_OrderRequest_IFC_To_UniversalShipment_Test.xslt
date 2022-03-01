<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://Godfrey.OrderRequest_IFCSHIP_FF" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:GodfreyOrderRequest" />
  </xsl:template>
  <xsl:template match="/s0:GodfreyOrderRequest">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;ConsigneeAddress&quot;)" />
    <UniversalShipment>
      <Shipment>
        <DataContext>
          <DataTargetCollection>
            <DataTarget>
              <Type>
                <xsl:value-of select="string('WarehouseOrder')"/>
              </Type>
            </DataTarget>
          </DataTargetCollection>
        </DataContext>
        <LocalProcessing>
          <DeliveryRequiredBy>
            <xsl:value-of select="userCSharp:ConvertDateRequiredValue(OrderHeader/DeliveryRequiredBy/text())"/>          
          </DeliveryRequiredBy>
        </LocalProcessing>
        <Order>
          <OrderNumber>
            <xsl:value-of select="OrderHeader/OrderNumber/text()" />
          </OrderNumber>
          <Type>
            <Code>
              <xsl:value-of select="string('ORD')"/>
            </Code>
          </Type>
          <Warehouse>
            <Code>
              <xsl:value-of select="string('BNE')"/>
            </Code>
          </Warehouse>
          <OrderLineCollection>
            <xsl:for-each select="OrderLineDetails">
              <OrderLine>
                <LineNumber>
                  <xsl:value-of select="LineNumber/text()" />
                </LineNumber>
                <Product>
                  <Code>
                    <xsl:value-of select="ProductCode/text()" />
                  </Code>
                  <Description>
                    <xsl:value-of select="ProductDescription/text()" />
                  </Description>
                </Product>
                <OrderedQty>
                  <xsl:value-of select="OrderQnty/text()" />
                </OrderedQty>
                 <OrderedQtyUnit>
                  <Code>
                    <xsl:value-of select="OrderQntyCode/text()" />
                  </Code>
                </OrderedQtyUnit>
              </OrderLine>
              </xsl:for-each>
          </OrderLineCollection>
        </Order>
        <OrganizationAddressCollection>
          <OrganizationAddress>
            <AddressType>
              <xsl:value-of select="string('TransportCompanyDocumentaryAddress')" />
            </AddressType>
            <OrganizationCode>
              <xsl:value-of select="OrderHeader/OrganizationCode/text()" />
            </OrganizationCode>
          </OrganizationAddress>
            <OrganizationAddress>
            <AddressType>
              <xsl:value-of select="$var:v1" />
            </AddressType>
               <AddressOverride>
                    <xsl:value-of select="string('true')" />
                  </AddressOverride>
            <Address1>
              <xsl:value-of select="OrderHeader/Address1/text()" />
            </Address1>
            <Address2>
              <xsl:value-of select="OrderHeader/Address2/text()" />
            </Address2>
            <City>
              <xsl:value-of select="OrderHeader/City/text()" />
            </City>
            <CompanyName>
              <xsl:value-of select="OrderHeader/CompanyName/text()" />
            </CompanyName>
            <Country>
              <Code>
                <xsl:value-of select="OrderHeader/CountryCode/text()" />
              </Code>
            </Country>
            <Postcode>
              <xsl:value-of select="OrderHeader/PostCode/text()" />
            </Postcode>
            <State>
              <xsl:value-of select="OrderHeader/State/text()" />
            </State>
          </OrganizationAddress>
         <OrganizationAddress>
                <AddressType>
                  <xsl:value-of select="string('SendersLocalClient')" />
                </AddressType>
                <OrganizationCode>GODFREYS</OrganizationCode>
              </OrganizationAddress>
              <OrganizationAddress>
                <AddressType>
                  <xsl:value-of select="string('ConsignorDocumentaryAddress')" />
                </AddressType>
                <OrganizationCode>GODFREYS</OrganizationCode>
              </OrganizationAddress>
        </OrganizationAddressCollection>
		<CustomizedFieldCollection>
			<CustomizedField>
				<Key>MachShip_Type</Key>
				<DataType>String</DataType>
				<Value>
					<xsl:value-of select="OrderHeader/Machship_type/text()" />
				</Value>
			</CustomizedField>
			<CustomizedField>
				<Key>Machship_reference1</Key>
				<DataType>String</DataType>
				<Value>
					<xsl:value-of select="OrderHeader/Machship_reference1/text()" />
				</Value>
			</CustomizedField>
			<CustomizedField>
				<Key>Machship_reference2</Key>
				<DataType>String</DataType>
				<Value>
					<xsl:value-of select="OrderHeader/Machship_reference2/text()" />
				</Value>
			</CustomizedField>
		</CustomizedFieldCollection>
      </Shipment>
    </UniversalShipment>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}

 public static string ConvertDateRequiredValue(string inputDateString)
              {
                string outDateString;
                System.DateTime dt = DateTime.ParseExact(inputDateString, "ddMMyyyy", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  

]]></msxsl:script>
</xsl:stylesheet>
