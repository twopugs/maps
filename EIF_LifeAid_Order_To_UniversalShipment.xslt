<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/Orders" />
  </xsl:template>
  <xsl:template match="/Orders">
    <UniversalShipment>
      <Shipment>
        <DataContext>
          <DataTargetCollection>
            <DataTarget>
              <Type>
                <xsl:value-of select="'WarehouseOrder'" />
              </Type>
            </DataTarget>
          </DataTargetCollection>
        </DataContext>
        <LocalProcessing>
          <DeliveryRequiredBy>
            <xsl:value-of select="orderDate/text()" />
          </DeliveryRequiredBy>
        </LocalProcessing>

          <Order>
            <Warehouse>
              <Code>
                <xsl:value-of select="'AKL'" />
              </Code>
            </Warehouse>
            <OrderNumber>
              <xsl:value-of select="orderNumber/text()" />
            </OrderNumber>
            <ClientReference>
              <xsl:value-of select="originalID/text()" />
            </ClientReference>

            <OrderLineCollection>
              <xsl:for-each select="items">
                <OrderLine>
                  <OrderedQty>
                    <xsl:value-of select="qty/text()" />
                  </OrderedQty>
                  <Product>
                    <Code>
                      <xsl:value-of select="sku/text()" />
                    </Code>
                    <Description>
                      <xsl:value-of select="name/text()" />
                    </Description>
                  </Product>
                </OrderLine>
              </xsl:for-each>
            </OrderLineCollection>
          </Order>
        <OrganizationAddressCollection>
          <OrganizationAddress>
            <AddressType>
              <xsl:value-of select="'ConsignorDocumentaryAddress'" />
            </AddressType>
            <OrganizationCode>LIFBEVAKL</OrganizationCode>
          </OrganizationAddress>

          <OrganizationAddress>
            <AddressType>ConsigneeAddress</AddressType>
            <Contact>
              <xsl:value-of select="body/shipTo/name/text()" />
            </Contact>
            <AddressOverride>true</AddressOverride>
            <SuppressAddressValidationError>true</SuppressAddressValidationError>
            <Address1>
              <xsl:value-of select="shipTo/shippingAddress/line1/text()" />
            </Address1>
            <Address2>
              <xsl:value-of select="shipTo/shippingAddress/line2/text()" />
            </Address2>
            <City>
              <xsl:value-of select="shipTo/shippingAddress/city/text()" />
            </City>
			
			<xsl:choose>
				<xsl:when test="shipTo/company != ''"> 
					 <CompanyName>
						<xsl:value-of select="shipTo/company/text()" />
					</CompanyName>
				</xsl:when>
				<xsl:when test="shipTo/name != ''"> 
					<CompanyName>
						<xsl:value-of select="shipTo/name/text()" />
					</CompanyName>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
           
            <Email>
				<xsl:value-of select="shipTo/email/text()" />
            </Email>
            <Country>
              <Code>
                <xsl:value-of select="shipTo/shippingAddress/countryCode/text()" />
              </Code>
            </Country>
            <Phone>
              <xsl:value-of select="shipTo/shippingAddress/phone/text()" />
            </Phone>
            <Postcode>
              <xsl:value-of select="shipTo/shippingAddress/postalCode/text()" />
            </Postcode>
            <State>
              <xsl:value-of select="shipTo/shippingAddress/state/text()" />
            </State>
          </OrganizationAddress>
        </OrganizationAddressCollection>
        <NoteCollection>
          <xsl:if test="notes/text()">
            <Note>
              <NoteText>
                <xsl:value-of select="notes/text()" />
              </NoteText>
              <Description>Special Instructions</Description>
              <IsCustomDescription>false</IsCustomDescription>
            </Note>
          </xsl:if>
        </NoteCollection>
      </Shipment>
    </UniversalShipment>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
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
