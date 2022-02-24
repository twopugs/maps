<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp json" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11"  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:json='http://james.newtonking.com/projects/json'>
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;1&quot;)" />
    <xsl:for-each select="s0:Body/s0:UniversalShipment">
      <xsl:variable name="WHKey" select="s0:Shipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource[s0:Type='WarehouseOrder']/s0:Key/text()"/>

      <ConsignmentRequest>
        <ConsignmentList json:Array='true'>
          <ConsignmentId>
            <xsl:value-of select="$var:v1" />
          </ConsignmentId>
          <CustomerReference>            
            <xsl:value-of select="s0:Shipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()" />
          </CustomerReference>
          <xsl:variable name="var:v2" select="userCSharp:LogicalEq(string(s0:Shipment/s0:NoteCollection/s0:Note/s0:Description/text()) , &quot;Import Delivery Instruction&quot;)" />
          <ReceiverDetails>
            <ReceiverName>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:CompanyName" />
            </ReceiverName>
            <AddressLine1>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address1/text()" />
            </AddressLine1>
            <AddressLine2>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address2/text()" />
            </AddressLine2>
            <Suburb>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:City/text()" />
            </Suburb>
            <Postcode>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Postcode/text()" />
            </Postcode>
            <State>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:State/text()" />
            </State>
            <xsl:if test="string($var:v2)='true'">
              <DeliveryInstructions>
                <xsl:value-of select="s0:Shipment/s0:NoteCollection/s0:Note/s0:NoteText/text()" />
              </DeliveryInstructions>
            </xsl:if>
            <IsAuthorityToLeave>
              <xsl:value-of select="s0:Shipment/s0:InstructionCollection/s0:Instruction/s0:IsAuthorisedToLeave/text()" />
            </IsAuthorityToLeave>
            <ReceiverContactName>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Contact/text()" />
            </ReceiverContactName>
            <ReceiverContactMobile>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Mobile/text()" />
            </ReceiverContactMobile>
            <ReceiverContactEmail>
              <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Email/text()" />
            </ReceiverContactEmail>
          </ReceiverDetails>
          <xsl:for-each select="s0:Shipment/s0:PackingLineCollection/s0:PackingLine">
            <ConsignmentLineItems json:Array='true'>
              <xsl:if test="s0:ReferenceNumber">
                <SenderLineReference>
                  <xsl:value-of select="s0:ReferenceNumber/text()" />
                </SenderLineReference>
              </xsl:if>
              <RateType>
                <xsl:value-of select="s0:PackType/s0:Code/text()" />
              </RateType>
              <xsl:if test="s0:PackType/s0:Description">
                <PackageDescription>
                  <xsl:value-of select="s0:PackType/s0:Description/text()" />
                </PackageDescription>
              </xsl:if>
              <xsl:if test="s0:PackQty">
                <Items>
                  <xsl:value-of select="s0:PackQty/text()" />
                </Items>
              </xsl:if>
              <xsl:if test="s0:Weight">
                <Kgs>
                  <xsl:value-of select="userCSharp:CheckStringMandatory(round(s0:Weight/text()),'The XPath Shipment/PackingLineCollection/PackingLine/Weight value mapped to Kgs ',$WHKey)" />
                </Kgs>
              </xsl:if>
              <xsl:if test="s0:Length">
                <Length>
                  <xsl:value-of select="userCSharp:CheckStringMandatory(round(s0:Length/text()),'The XPath Shipment/PackingLineCollection/PackingLine/Length value mapped to Length  ',$WHKey)" />
                </Length>
              </xsl:if>
              <xsl:if test="s0:Width">
                <Width>
                  <xsl:value-of select="userCSharp:CheckStringMandatory(round(s0:Width/text()),'The XPath Shipment/PackingLineCollection/PackingLine/Width value  mapped to Width ',$WHKey)" />
                </Width>
              </xsl:if>
              <xsl:if test="s0:Height">
                <Height>
                  <xsl:value-of select="userCSharp:CheckStringMandatory(round(s0:Height/text()),'The XPath Shipment/PackingLineCollection/PackingLine/Height value mapped to Height ',$WHKey)" />
                </Height>
              </xsl:if>
              <xsl:if test="s0:Volume">
                <Cubic>
                  <xsl:value-of select="userCSharp:CheckStringMandatory(s0:Volume/text(),'The XPath Shipment/PackingLineCollection/PackingLine/Volumne value mapped to Cubic ',$WHKey)" />
                </Cubic>
              </xsl:if>
            </ConsignmentLineItems>
          </xsl:for-each>
        </ConsignmentList>
      </ConsignmentRequest>
    </xsl:for-each>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public bool LogicalEq(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 == d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) == 0;
	}
	return ret;
}


public bool IsNumeric(string val)
{
	if (val == null)
	{
		return false;
	}
	double d = 0;
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool IsNumeric(string val, ref double d)
{
	if (val == null)
	{
		return false;
	}
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public static string CheckStringMandatory(decimal inputDateString, string segmentName , string WHKey)
    {
      string outValue=inputDateString.ToString();
      string FCFSKey = "WarehouseOrder : " + WHKey + "|";
      if(inputDateString <=0)
        throw new System.Exception( WHKey + segmentName + " is not greater than zero. Please check your input  " + inputDateString);
      return outValue;
    }


]]>
  </msxsl:script>
</xsl:stylesheet>