<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0"  xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <!-- <xsl:variable name="var:v1" select="userCSharp:StringConcat(&quot;FILEHEAD&quot;)" /> -->
    <!-- <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;FILETAIL&quot;)" /> -->
   


      <xsl:for-each select="s0:Body/s0:UniversalShipment">
        <!-- <xsl:variable name="OrderNum" select="s0:OrderNumber/text()" /> -->
        <!-- <xsl:variable name="ClientRef" select="s0:ClientReference/text()" /> -->

		<orderMessage>
			<standardBusinessDocumentHeader>
				<headerVersion>1</headerVersion>
				<documentType>ORDERCONFIRMATION</documentType>
				<documentStatusCode>ORIGINAL</documentStatusCode>
				<documentIdentification>
					<standard>XTRA</standard>
					<typeVersion>1.0</typeVersion>
					<creationDateAndTime>Replace_creationDateAndTime</creationDateAndTime>
				</documentIdentification>
				<xsl:for-each select="s0:Shipment/s0:CustomizedFieldCollection/s0:CustomizedField">
					<xsl:if test="s0:Key = 'Receiver'"> 
						<receiver>
							<gln>
								<xsl:value-of select="s0:Value/text()" />
							</gln>
						</receiver>
					</xsl:if>
					<xsl:if test="s0:Key = 'Sender'"> 
							<sender>
								<gln>
									<xsl:value-of select="s0:Value/text()" />
								</gln>
							</sender>
					</xsl:if>
				</xsl:for-each>
				<order>
					<orderIdentification>
						<orderNo>
							<xsl:value-of select="s0:Shipment/s0:Order/s0:OrderNumber/text()" />
						</orderNo>
						<orderDate>
							<xsl:value-of select="s0:Shipment/s0:LocalProcessing/s0:DeliveryRequiredBy/text()" />
						</orderDate>
						<deliveryNumber>
							<xsl:value-of select="s0:Shipment/s0:Order/s0:ClientReference/text()" />
						</deliveryNumber>
						<xsl:for-each select="s0:Shipment/s0:Order/s0:OrderLineCollection/s0:OrderLine">
							<orderLineItem>
								<lineItemNumber>
									<xsl:value-of select="s0:LineNumber/text()" />
								</lineItemNumber>
								<orderdQuantity>
									<xsl:value-of select="s0:OrderedQty/text()" />
								</orderdQuantity>
								<transactionalTradeItem>
									<supplierIdentifier>
										<xsl:value-of select="s0:Product/s0:Code/text()" />
									</supplierIdentifier>
								</transactionalTradeItem>
								<itemPriceExclusive>
									<xsl:value-of select="s0:UnitPriceAfterDiscount/text()" />
								</itemPriceExclusive>
							</orderLineItem>
						</xsl:for-each>
					</orderIdentification>
				</order>
			</standardBusinessDocumentHeader>
		</orderMessage>
        <!-- <Receipt> -->
          <!-- <ReceiptId> -->
            <!-- <xsl:value-of select="s0:OrderNumber/text()" /> -->
          <!-- </ReceiptId> -->
          <!-- <Warehouse> -->
            <!-- <xsl:value-of select="s0:Warehouse/s0:Code/text()" /> -->
          <!-- </Warehouse> -->
          <!-- <Details> -->
          <!-- <xsl:for-each select="s0:OrderLineCollection/s0:OrderLine"> -->
            <!-- <xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;DATADETL&quot;)" /> -->
            <!-- <xsl:variable name="var:v4" select="userCSharp:MathRound(string(s0:OrderedQty/text()) , &quot;3&quot;)" /> -->
            <!-- <xsl:variable name="var:v5" select="userCSharp:MathRound(string(s0:PackageQtyUnit/s0:Code/text()) , &quot;3&quot;)" /> -->
            
              <!-- <ReceiptDetail> -->
                <!-- <PurchaseOrderId> -->
                  <!-- <xsl:value-of select="$OrderNum" /> -->
                <!-- </PurchaseOrderId> -->
                <!-- <PurchaseOrderLineNumber> -->
                  <!-- <xsl:value-of select="s0:LineNumber/text()" /> -->
                <!-- </PurchaseOrderLineNumber> -->
                <!-- <Item> -->
                  <!-- <xsl:value-of select="s0:Product/s0:Code/text()" /> -->
                <!-- </Item> -->
                <!-- <QuantityReceived> -->
                  <!-- <xsl:value-of select="$var:v4" /> -->
                <!-- </QuantityReceived> -->
                <!-- <QtyUM> -->
                  <!-- <xsl:value-of select="s0:PackageQtyUnit/s0:Code/text()" /> -->
                <!-- </QtyUM> -->
                <!-- <UserDef1> -->
                  <!-- <xsl:value-of select="$ClientRef"/> -->
                <!-- </UserDef1> -->
                <!-- <UserDef2> -->
                  <!-- <xsl:value-of select="../../../s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='USERDEF']/s0:Value/text()"/> -->
                <!-- </UserDef2> -->
                <!-- <UserDef3> -->
                  <!-- <xsl:value-of select="../../../s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='CNTNO']/s0:Value/text()"/> -->
                <!-- </UserDef3> -->
              <!-- </ReceiptDetail> -->
            <!-- </xsl:for-each> -->
          <!-- </Details> -->
        <!-- </Receipt> -->
      </xsl:for-each>
   
    
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string MathRound(string val)
{
	return MathRound(val, "0");
}

public string MathRound(string val, string decimals)
{
	string retval = "";
	double v = 0;
	double db = 0;
	if (IsNumeric(val, ref v) && IsNumeric(decimals, ref db))
	{
		try
		{
			int d = (int) db;
			double ret = Math.Round(v, d);
			retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
		catch (Exception)
		{
		}
	}
	return retval;
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


]]></msxsl:script>
</xsl:stylesheet>