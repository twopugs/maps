<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:ns0="http://CWCI7Order" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <xsl:variable name="var:v1" select="userCSharp:GetDateValue(s0:Body/s0:UniversalShipment/s0:Shipment/s0:DataContext/s0:TriggerDate/text())"/>
      <ns0:UpdateOrders>
      <UpdateOrders_Header>
        <OrderRef>
          <xsl:text>OrderRef</xsl:text>
        </OrderRef>
        <Carrier>
          <xsl:text>Carrier</xsl:text>
        </Carrier>
        <TrackingCode>
          <xsl:text>TrackingCode</xsl:text>
        </TrackingCode>
        <Weight>
          <xsl:text>Weight</xsl:text>
        </Weight>
        <Sku>
          <xsl:text>Sku</xsl:text>
        </Sku>
        <QtyShipped>
          <xsl:text>QtyShipped</xsl:text>
        </QtyShipped>
        <DispatchedDate>
          <xsl:text>DispatchedDate</xsl:text>
        </DispatchedDate>
        <SSCC>
          <xsl:text>SSCC</xsl:text>
        </SSCC>
        <Carton>
          <xsl:text>Carton</xsl:text>
        </Carton>
      </UpdateOrders_Header>
      <xsl:for-each select="s0:Body/s0:UniversalShipment/s0:Shipment/s0:Order/s0:OrderLineCollection/s0:OrderLine">
        <UpdateOrders_Record>
          <OrderRef>
            <xsl:value-of select="../../s0:OrderNumber/text()" />
          </OrderRef>
          <Carrier>
            <xsl:value-of select="../../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='TransportCompanyDocumentaryAddress']/s0:OrganizationCode/text()" />
          </Carrier>
          <TrackingCode>
            <xsl:value-of select="../../s0:TransportReference/text()" />
          </TrackingCode>
          <Weight>
          </Weight>
          <Sku>
            <xsl:value-of select="s0:Product/s0:Code/text()" />
          </Sku>
          <QtyShipped>
            <xsl:value-of select="s0:QuantityMet/text()" />
          </QtyShipped>
         <!-- <xsl:variable name="var:v1" select="userCSharp:DateNow()" />-->
         <!-- <xsl:variable name="var:v1" select="userCSharp:GetDateValue(s0:DataContext/s0:TriggerDate/text())"/>-->
          <DispatchedDate>
         <xsl:value-of select="$var:v1" />
          </DispatchedDate>
          <SSCC></SSCC>
          <Carton></Carton>
        </UpdateOrders_Record>
      </xsl:for-each>
    </ns0:UpdateOrders>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string DateNow()
{
DateTime now = DateTime.Now;

	return now.ToString("yyyy-MM-dd");
}
public static string GetDateValue(string inputDateString)
        {
            string outDateString;
            System.DateTime dt=System.Convert.ToDateTime(inputDateString);
            outDateString = dt.ToString("yyyy-MM-dd");
            return outDateString;
        }


]]>
  </msxsl:script>
</xsl:stylesheet>