<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp json" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:json='http://james.newtonking.com/projects/json'>
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:UniversalInterchange"/>
	</xsl:template>
	<xsl:template match="/s0:UniversalInterchange">
		<xsl:for-each select="s0:Body/s0:UniversalShipment">
			<GoodsReceiptConfirmations>
				<xsl:for-each select="s0:Shipment/s0:Order">
					<GoodsReceiptConfirmation>
						<PONumber>
							<!-- <xsl:value-of select="s0:OrderNumber/text()"/> -->
							<xsl:value-of select="s0:ClientReference/text()"/>
						</PONumber>
						<ReceiptDate>
							<xsl:value-of select="../s0:DataContext/s0:TriggerDate"/>
						</ReceiptDate>
						<ReceiptNumber>
							<xsl:value-of select="../s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
							<!-- <xsl:choose> -->
								<!-- <xsl:when test="s0:ClientReference/text()"> -->
									<!-- <xsl:value-of select="s0:ClientReference/text()"/> -->
								<!-- </xsl:when> -->
								<!-- <xsl:otherwise> -->
									<!-- <xsl:value-of select="../s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/> -->
								<!-- </xsl:otherwise> -->
							<!-- </xsl:choose> -->
						</ReceiptNumber>
						
							
							<xsl:choose>
								<xsl:when test="../s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Location ID']/s0:Value/text() !=''">
									<LocationID>
										<xsl:value-of select="../s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Location ID']/s0:Value/text()"/>
									</LocationID>
								</xsl:when>
								<xsl:otherwise>
									<LocationID>106</LocationID>
								</xsl:otherwise>
							</xsl:choose>
						
							<xsl:choose>
								<xsl:when test="../s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Organization ID']/s0:Value/text() !=''">
									<OrganizationID>
										<xsl:value-of select="../s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Organization ID']/s0:Value/text()"/>
									</OrganizationID>
								</xsl:when>
								<xsl:otherwise>
									<OrganizationID>2</OrganizationID>
								</xsl:otherwise>
							</xsl:choose>
							
						
						<ReceiptTypeID/>
						<xsl:for-each select="s0:OrderLineCollection/s0:OrderLine">
							<LineItems json:Array='true'>
								<ItemNumber>
									<xsl:value-of select="s0:Product/s0:Code/text()"/>
								</ItemNumber>
								<ItemDescription>
									<xsl:value-of select="s0:Product/s0:Description/text()"/>
								</ItemDescription>
								<QuantityReceived>
									<xsl:choose>
										<xsl:when test="s0:OriginalHoldCode/s0:Code !='DAM'">
											<xsl:value-of select="s0:OrderedQty/text()"/>
										</xsl:when>
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>
								</QuantityReceived>
								<QuantityDamaged>
									<xsl:choose>
										<xsl:when test="s0:OriginalHoldCode/s0:Code='DAM'">
											<xsl:value-of select="s0:OrderedQty/text()"/>
										</xsl:when>
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>
								</QuantityDamaged>
								<DateReceived>
									<xsl:value-of select="../../../s0:DataContext/s0:TriggerDate"/>
								</DateReceived>
							</LineItems>
						</xsl:for-each>
					</GoodsReceiptConfirmation>
				</xsl:for-each>
			</GoodsReceiptConfirmations>
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