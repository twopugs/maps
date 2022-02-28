<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp json" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:json='http://james.newtonking.com/projects/json'>
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <xsl:for-each select="s0:Body/s0:UniversalShipment">
      <ShipmentConfirmations>
        <xsl:for-each select="s0:Shipment/s0:Order">
          <ShipmentConfirmation>
                    <OrderNumber>
                      <xsl:value-of select="s0:OrderNumber/text()" />
                    </OrderNumber>
            <ShipTo>
              <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:CompanyName"/>
            </ShipTo>
            <DateShipped>
              <xsl:value-of select="substring(../s0:DataContext/s0:TriggerDate,0,11)"/>
            </DateShipped>
            <ShipMethod>
              <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='TransportCompanyDocumentaryAddress']/s0:CompanyName"/>
            </ShipMethod>
            <ShipFromLocation>
              <xsl:value-of select="'2'" />
            </ShipFromLocation>
            <xsl:for-each select="s0:OrderLineCollection/s0:OrderLine">
              <xsl:variable name="Link" select="s0:Link"/>

              <xsl:if test="../../../s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine[s0:OrderLineLink=$Link]/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Serial Number']/s0:Value/text()" >
                <LineItems json:Array='true'>
                  <ProductSKU>
                    <xsl:value-of select="s0:Product/s0:Code/text()" />
                  </ProductSKU>
                  <QtyShipped>
                    <xsl:value-of select="s0:QuantityMet/text()" />
                  </QtyShipped>
                    <xsl:for-each select="../../../s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine[s0:OrderLineLink=$Link]">
                  <SerialNumbers json:Array='true'>
                        <xsl:value-of select="s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Serial Number']/s0:Value/text()" />
                  </SerialNumbers>
                    </xsl:for-each>

                </LineItems>
              </xsl:if>
            </xsl:for-each>
          </ShipmentConfirmation>
        </xsl:for-each>
      </ShipmentConfirmations>
    </xsl:for-each>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
  <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}
  public static string ConvertDateValue(string inputDateString)
              {
                string outDateString;
              try{  System.DateTime dt = DateTime.ParseExact(inputDateString, "yyyy-MM-ddTHH:mm:ss", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-dd");
}
 catch (Exception e)
 {
 outDateString="";
  }              return outDateString;
              }  
              


]]></msxsl:script>
</xsl:stylesheet>