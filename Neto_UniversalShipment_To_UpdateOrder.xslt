<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <UpdateOrder>
      <xsl:for-each select="s0:Body/s0:UniversalShipment/s0:Shipment/s0:Order">
        <Order>
          <OrderID>
            <xsl:value-of select="s0:OrderNumber/text()" />
          </OrderID>
          <OrderStatus>
            <xsl:value-of select="string('Dispatched')" />
          </OrderStatus>
          <SendOrderEmail>
            <xsl:value-of select="string('tracking')" />
          </SendOrderEmail>
          <xsl:for-each select="s0:OrderLineCollection/s0:OrderLine">
            <OrderLine>
              <xsl:if test="s0:QuantityMet &gt; 0">
                <SKU>
                  <xsl:value-of select="s0:Product/s0:Code/text()" />
                </SKU>
              </xsl:if>
              <TrackingDetails>
                <ShippingMethod>
                  <xsl:value-of select="../../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='TransportCompanyDocumentaryAddress']/s0:CompanyName/text()" />
                </ShippingMethod>
                <TrackingNumber>
                  <xsl:value-of select="../../s0:TransportReference/text()" />
                </TrackingNumber>
                <DateShipped>
                  <xsl:value-of select="userCSharp:ConvertDateTimeValue()"/>
                </DateShipped>
              </TrackingDetails>
            </OrderLine>
          </xsl:for-each>
        </Order>
      </xsl:for-each>
    </UpdateOrder>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}
 public static string ConvertDateTimeValue()
              {
                string outDateString;
               outDateString = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");

                return outDateString;
              }  


]]></msxsl:script>
</xsl:stylesheet>