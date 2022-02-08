<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 json userCSharp" version="1.0"  xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp"  xmlns:json='http://james.newtonking.com/projects/json'>
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:UniversalInterchange" />
	</xsl:template>
	<xsl:template match="/s0:UniversalInterchange">
		<Root>

			<xsl:for-each select="s0:Body/s0:UniversalShipment/s0:Shipment/s0:Order">

				<Order>
					<Items>
						<xsl:for-each select="s0:OrderLineCollection/s0:OrderLine">
							<xsl:variable name="OrderLineLink" select="s0:Link/text()"/>
							<!-- <xsl:if test="../../../s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine[s0:OrderLineLink=$OrderLineLink]/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Expiry']/s0:Value/text()" > -->

							<Item json:Array='true'>
								<ProductCode>
									<xsl:value-of select="s0:Product/s0:Code"/>
								</ProductCode>
								<xsl:for-each select="../../../s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine[s0:OrderLineLink=$OrderLineLink]">
									<Lotcode>
										<xsl:value-of select="s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='LOT #']/s0:Value"/>
									</Lotcode> 
									<Lotcodes>
										<xsl:value-of select="s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='LOT #']/s0:Value"/>
									</Lotcodes> 
									<Lotcodes2>
										<xsl:value-of select="s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='LOT #']/s0:Value"/>
									</Lotcodes2> 
								</xsl:for-each>

								<xsl:if test="s0:Product/s0:ExpiryDate/text() != ''">
									<ExpiryDate>
										<xsl:value-of select="s0:Product/s0:ExpiryDate"/>
									</ExpiryDate>
								</xsl:if>

								<xsl:for-each select="../../../s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine[s0:OrderLineLink=$OrderLineLink]">
									<ExpiryDate>
										<xsl:value-of select="s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='Expiry']/s0:Value"/>
									</ExpiryDate> 
								</xsl:for-each>

								<ShippedQty>
									<xsl:value-of select="s0:QuantityMet"/>
								</ShippedQty>
							</Item>
							<!-- </xsl:if> -->
						</xsl:for-each>
					</Items>
					<Carrier>
						<xsl:value-of select="../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='TransportCompanyDocumentaryAddress']/s0:CompanyName"/>
					</Carrier>
					<TrackingNumber>
						<xsl:value-of select="s0:TransportReference"/>
					</TrackingNumber>
					<TrackingURL/>
					<Ship/>
					<OrderNumber>
						<xsl:value-of select="s0:OrderNumber"/>
					</OrderNumber>
					<JobNumber>
						<xsl:value-of select="../s0:DataContext/s0:DataTargetCollection/s0:DataTarget/s0:Key"/>
					</JobNumber>
				</Order>



			</xsl:for-each>
		</Root>
	</xsl:template>

</xsl:stylesheet>