<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://SpyPerformance.Schemas.CSVOrder" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:key name="Key_OrderId" match="//OrderDetail" use="OrderId"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Root" />
  </xsl:template>
  <xsl:template match="/s0:Root">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;WarehouseOrder&quot;)" />
    <xsl:variable name="var:v2" select="userCSharp:DateCurrentDateTime()" />
    <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;ORD&quot;)" />
    <UniversalShipmentRcd>
      <xsl:for-each select="//OrderDetail[generate-id(.)=generate-id(key('Key_OrderId', OrderId)[1])]">
        <xsl:variable name="var:v5" select="userCSharp:LogicalIsString(string(DeliveryInstruction/text()))" />
        <xsl:variable name="var:v7" select="string(DeliveryInstruction/text())" />
        <xsl:variable name="var:v8" select="userCSharp:LogicalIsString($var:v7)" />
         <UniversalShipment>
   <Shipment>
          <DataContext>
            <DataTargetCollection>
              <DataTarget>
                <Type>
                  <xsl:value-of select="$var:v1" />
                </Type>
              </DataTarget>
            </DataTargetCollection>
          </DataContext>
          <LocalProcessing>
            <DeliveryRequiredBy>
              <xsl:value-of select="$var:v2" />
            </DeliveryRequiredBy>
          </LocalProcessing>
          <Order>
            <OrderNumber>
              <xsl:value-of select="OrderId/text()" />
            </OrderNumber>
            <Type>
              <Code>
                <xsl:value-of select="$var:v3" />
              </Code>
            </Type>
            <Warehouse>
              <Code>
                <xsl:value-of select="'AKL'" />
              </Code>
            </Warehouse>
            <OrderLineCollection>
              <xsl:for-each select="key('Key_OrderId', OrderId)">
                <OrderLine>
                  <OrderedQty>
                    <xsl:value-of select="Quantity/text()" />
                  </OrderedQty>
                  <Product>
                    <Code>
                      <xsl:value-of select="SKU/text()" />
                    </Code>
                    <Description>
                      <xsl:value-of select="ItemDescription/text()" />
                    </Description>
                  </Product>
                  <UnitPriceDiscountAmount>
                    <xsl:value-of select="ProductDiscount/text()" />
                  </UnitPriceDiscountAmount>
                  <UnitPriceRecommended>
                    <xsl:value-of select="ItemUnitPrice/text()" />
                  </UnitPriceRecommended>
                </OrderLine>
              </xsl:for-each>
            </OrderLineCollection>
          </Order>
          <NoteCollection>
            <Note>
              <xsl:if test="string($var:v5)='true'">
                <xsl:variable name="var:v6" select="&quot;Goods Handling Instructions&quot;" />
                <Description>
                  <xsl:value-of select="$var:v6" />
                </Description>
              </xsl:if>
              <xsl:if test="string($var:v8)='true'">
                <xsl:variable name="var:v9" select="&quot;false&quot;" />
                <IsCustomDescription>
                  <xsl:value-of select="$var:v9" />
                </IsCustomDescription>
              </xsl:if>
              <xsl:if test="string($var:v8)='true'">
                <xsl:variable name="var:v10" select="DeliveryInstruction/text()" />
                <NoteText>
                  <xsl:value-of select="$var:v10" />
                </NoteText>
              </xsl:if>
              <NoteContext>
                <xsl:if test="string($var:v8)='true'">
                  <xsl:variable name="var:v11" select="&quot;AAA&quot;" />
                  <Code>
                    <xsl:value-of select="$var:v11" />
                  </Code>
                </xsl:if>
              </NoteContext>
              <Visibility>
                <xsl:if test="string($var:v8)='true'">
                  <xsl:variable name="var:v12" select="&quot;PUB&quot;" />
                  <Code>
                    <xsl:value-of select="$var:v12" />
                  </Code>
                </xsl:if>
              </Visibility>
            </Note>
          </NoteCollection>
          <OrganizationAddressCollection>
            <OrganizationAddress>
              <AddressType>
                <xsl:value-of select="'ConsignorDocumentaryAddress'" />
              </AddressType>
              <OrganizationCode>
                <xsl:value-of select="'HIGPERAKL1'" />
              </OrganizationCode>
            </OrganizationAddress>
            <OrganizationAddress>
              <xsl:element name="AddressOverride">true</xsl:element>
              <xsl:element name="AddressType">ConsigneeAddress</xsl:element>
              <Email>
                <xsl:value-of select="CustomerEmail/text()" />
              </Email>
              <SuppressAddressValidationError>true</SuppressAddressValidationError>
              <Contact>
                <xsl:value-of select="concat(ShipFirstName/text(), ShipLastName/text())" />
              </Contact>
              <CompanyName>
                <xsl:choose>
                  <xsl:when test="string-length(ShipCompany/text())>0">
                    <xsl:value-of select="ShipCompany/text()" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="concat(ShipFirstName/text(), ShipLastName/text())" />
                  </xsl:otherwise>
                </xsl:choose>
              </CompanyName>
              <Address1>
                <xsl:value-of select="ShipAddress1/text()" />
              </Address1>
              <Address2>
                <xsl:value-of select="ShipAddress2/text()" />
              </Address2>
              <City>
                <xsl:value-of select="ShipCity/text()" />
              </City>
              <State>
                <xsl:value-of select="ShipState/text()" />
              </State>
              <Postcode>
                <xsl:value-of select="ShipPostCode/text()" />
              </Postcode>
            </OrganizationAddress>
          </OrganizationAddressCollection>
        </Shipment>
       </UniversalShipment>
   </xsl:for-each>
    </UniversalShipmentRcd>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public bool LogicalIsString(string val)
{
	return (val != null && val !="");
}


public string DateCurrentDateTime()
{
     string outValue = string.Empty;
            var dateTimeValue = DateTime.Parse(System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("HH:mm"));
            var dayValue = DateTime.Parse(System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString()).DayOfWeek;
            var compareValue = DateTime.Parse("15:30");
            
            if (dateTimeValue <= compareValue)
            {
                 outValue = System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-ddTHH:mm:ss");
            }
            else 
            {
              outValue = System.TimeZoneInfo.ConvertTime(DateTime.Now.AddDays(1), TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-ddTHH:mm:ss");
              if (dayValue == DayOfWeek.Friday)
              {
                    outValue = System.TimeZoneInfo.ConvertTime(DateTime.Now.AddDays(3), TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-ddTHH:mm:ss");
              }  
             }
            
            return outValue;
}



]]>
  </msxsl:script>
</xsl:stylesheet>