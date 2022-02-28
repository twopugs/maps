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
            <warehouse_id>106<!--<xsl:value-of select="'4'" />--></warehouse_id>
            <invoice>
              <xsl:value-of select="s0:OrderNumber/text()" />
            </invoice>
            <tracking_number>
              <xsl:value-of select="s0:TransportReference/text()" />
            </tracking_number>
            <shipment_cost>0.00</shipment_cost>
            <shipment_weight>0.000</shipment_weight>
            <ship_method>
              <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='TransportCompanyDocumentaryAddress']/s0:CompanyName"/>
            </ship_method>
            <ship_date>
              <xsl:value-of select="substring(../s0:DataContext/s0:TriggerDate,0,11)"/>
            </ship_date>
            <xsl:for-each select="s0:OrderLineCollection/s0:OrderLine">
              <items json:Array='true'>
                <sku>
                  <xsl:value-of select="s0:Product/s0:Code/text()" />
                </sku>
                <qty>
                  <xsl:value-of select="s0:QuantityMet/text()" />
                </qty>
              </items>
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