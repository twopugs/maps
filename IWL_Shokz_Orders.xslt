<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="NetoAPI" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/Order" />
  </xsl:template>
  <xsl:template match="/Order">
    <UniversalShipment>
        <!--<xsl:if test="contains(tags/text(), 'North Island')">-->
          <xsl:variable name="var:v1" select="userCSharp:StringConcat(string(ID/text()))" />
          <Shipment>
            <DataContext>
              <DataTargetCollection>
                <DataTarget>
                  <Type>WarehouseOrder</Type>
                </DataTarget>
              </DataTargetCollection>
            </DataContext>
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
            <OrganizationAddressCollection>
              <OrganizationAddress>
                <OrganizationCode>
                  <xsl:value-of select="string('SHOKZ')" />
                </OrganizationCode>
                <AddressType>
                  <xsl:value-of select="string('LocalClient')" />
                </AddressType>
              </OrganizationAddress>
                <OrganizationAddress>
                <OrganizationCode>
                  <xsl:value-of select="string('SHOKZ')" />
                </OrganizationCode>
                <AddressType>
                  <xsl:value-of select="string('ConsignorDocumentaryAddress')" />
                </AddressType>
              </OrganizationAddress>
                <OrganizationAddress>
                  <Address1>
                    <xsl:value-of select="shipping_address/address1/text()" />
                  </Address1>
                  <Address2>
                    <xsl:value-of select="shipping_address/address2/text()" />
                  </Address2>

                  <City>
                    <xsl:value-of select="shipping_address/city/text()" />
                  </City>
				    <SuppressAddressValidationError>
				                <xsl:value-of select="string('true')" />
				  </SuppressAddressValidationError>                 
                  <AddressType>
                    <xsl:value-of select="string('ConsigneeAddress')" />
                  </AddressType>
                  <AddressOverride>
                    <xsl:value-of select="string('true')" />
                  </AddressOverride>
                  <CompanyName>
                  <xsl:value-of select="shipping_address/name/text()" />
                  </CompanyName>
                  <Phone>
                    <xsl:value-of select="shipping_address/phone/text()" />
                  </Phone>
                  <Contact>
                    <xsl:value-of select="shipping_address/name/text()" />
                  </Contact>
                  <Country>
                    <Code>
                      <xsl:value-of select="shipping_address/country_code/text()"/>
                    </Code>
                    <Name>
                      <xsl:value-of select="shipping_address/country/text()" />
                    </Name>
                  </Country>
                  <State>
                    <xsl:value-of select="shipping_address/province_code/text()" />
                  </State>
                  <Postcode>
                    <xsl:value-of select="shipping_address/zip/text()" />
                  </Postcode>          
                </OrganizationAddress>
             
            </OrganizationAddressCollection>
            <Order>
              <OrderNumber>
                <xsl:value-of select="name/text()"/>
              </OrderNumber>
             <ClientReference>
                <xsl:value-of select="order_number/text()"/>
              </ClientReference>
              <Warehouse>
                <Code>
                  <xsl:value-of select="string('BNE')"/>
                </Code>
              </Warehouse>
            <OrderLineCollection Content="Complete"> 
                <xsl:for-each select="line_items">
                  <OrderLine>
                    <OrderedQty>
                      <xsl:value-of select="quantity/text()"/>
                    </OrderedQty>
					
					<xsl:choose>
						<xsl:when test="name ='EcoTest Rapid Antigen Nasal Pen - Box of 20'" >
							<OrderedQtyUnit>
								<Code>INN</Code>
							</OrderedQtyUnit>
						</xsl:when>
						<xsl:otherwise>
							<OrderedQtyUnit>
								<Code>UNT</Code>
							</OrderedQtyUnit>
						</xsl:otherwise>
					</xsl:choose>
					
					
					
					
					
					
					
                    <Product>
                      <Code>
                        <xsl:value-of select="sku/text()"/>
                      </Code>
                    </Product>
                     <PartAttribute1>Shopify</PartAttribute1>
                    <UnitPriceAfterDiscount>
                      <xsl:value-of select="price/text()"/>
                    </UnitPriceAfterDiscount>
                  </OrderLine>
                </xsl:for-each>
              </OrderLineCollection>                   
            </Order>
           <CustomizedFieldCollection>
                <CustomizedField>
                  <Value>
                    <xsl:value-of select ="id/text()"/>
                  </Value>
                  <Key>ID</Key>
                <DataType>String</DataType>
                </CustomizedField>
             <CustomizedField>
                  <Value>Shopify</Value>
                  <Key>Source</Key>
                <DataType>String</DataType>
                </CustomizedField>
              </CustomizedFieldCollection>   
          </Shipment>
        <!--</xsl:if>-->
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