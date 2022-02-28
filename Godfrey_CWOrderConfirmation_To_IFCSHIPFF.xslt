<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:ns0="http://Godfrey.OrderRequest_IFCSHIP_FF" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <ns0:GodfreyOrderRequest>
      <xsl:for-each select="s0:Body/s0:UniversalShipment/s0:Shipment/s0:Order">
        
          <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;IWLSHIPHD&quot;)" />
          <xsl:variable name="var:v2" select="userCSharp:StringConcat(&quot;BNE&quot;)" />
          <OrderHeader>
            <IFCSHIPHD>
              <xsl:value-of select="$var:v1" />
            </IFCSHIPHD>
            <OrderNumber>
              <xsl:value-of select="s0:OrderNumber/text()" />
            </OrderNumber>
            <OrderHeader_Child3>
              <xsl:value-of select="s0:OrderNumber/text()" />
            </OrderHeader_Child3>
            <OrderHeader_Child4>
              <xsl:value-of select="$var:v2" />
            </OrderHeader_Child4>
            <OrderHeader_Child5/>
            <Ignore></Ignore>
            <CompanyName>
              <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:CompanyName/text()" />
            </CompanyName>
            <Ignore>
            </Ignore>
            <Address1>
              <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address1/text()" />              
            </Address1>
            <Address2>
              <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address2/text()" />
            </Address2>
            <ignore></ignore>
            <City>
                <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:City/text()" />
              </City>
              <State>
                <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:State/text()" />
              </State>
              <PostCode>
                <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Postcode/text()" />
              </PostCode>
            <CountryCode>
              <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Country/s0:Code/text()" />
            </CountryCode>
            <OrderHeader_Child16/>
            <ignore></ignore>
              <DeliveryRequiredBy>
                <xsl:value-of select="userCSharp:ConvertDateRequiredValue(../s0:LocalProcessing/s0:DeliveryRequiredBy/text())" />
              </DeliveryRequiredBy>
            <OrganizationCode>
              <xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='TransportCompanyDocumentaryAddress']/s0:OrganizationCode/text()" />
            </OrganizationCode>
            <OrderHeader_Child20/>
            <OrderHeader_Child21>
              <xsl:value-of select="s0:TransportReference/text()" />
            </OrderHeader_Child21>
          </OrderHeader>
       
        <xsl:for-each select="s0:OrderLineCollection/s0:OrderLine">
            <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;IWLSHIPDT&quot;)" />
            <OrderLineDetails>
              <IFCSHIPDT>
                <xsl:value-of select="$var:v3" />
              </IFCSHIPDT>
                <LineNumber>
                  <xsl:value-of select="s0:LineNumber/text()" />
                </LineNumber>
              <Ignore>
                <xsl:value-of select="../../s0:OrderNumber/text()" />
              </Ignore>
              <Ignore>
                <xsl:value-of select="s0:LineNumber/text()" />
              </Ignore>
              <ProductCode>
                <xsl:value-of select="s0:Product/s0:Code/text()" />
              </ProductCode>
                <OrderQnty>
                  <xsl:value-of select="s0:QuantityMet/text()" />
                </OrderQnty>
              <OrderQntyCode>
                <xsl:value-of select="s0:OrderedQtyUnit/s0:Code/text()" />
              </OrderQntyCode>
                <ProductDescription>
                  <xsl:value-of select="userCSharp:RemoveAndNewlineLineFeed(userCSharp:StringTrimRight(s0:Product/s0:Description/text()))" />
                </ProductDescription>
            <OrderQnty2>
                <!-- <xsl:value-of select="s0:OrderedQty/text()" /> -->
				 <xsl:value-of select="s0:QuantityMet/text()" />
              </OrderQnty2>
            </OrderLineDetails>
          </xsl:for-each>
       
      </xsl:for-each>
    </ns0:GodfreyOrderRequest>
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
                System.DateTime dt = DateTime.ParseExact(inputDateString, "yyyy-MM-ddTHH:mm:ss", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("ddMMyyyy");

                return outDateString;
              }  
              
              
public string StringTrimRight(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimEnd(null);
}

 public string RemoveAndNewlineLineFeed(string s)
        {
            String[] lf = { "\r", "\n" }; 
            return String.Join("",s.Split(lf,StringSplitOptions.RemoveEmptyEntries));             
        }


]]></msxsl:script>
</xsl:stylesheet>