<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:UniversalInterchange/s0:Body/s0:UniversalShipment"/>
	</xsl:template>
	<xsl:template match="/s0:UniversalInterchange/s0:Body/s0:UniversalShipment">
		<Item>
			<xsl:for-each select="s0:Shipment/s0:PackingLineCollection/s0:PackingLine">
				<xsl:variable name='LengthUnitCode' select="s0:LengthUnit/s0:Code"/>
				<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
				<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
				<xsl:variable name='ItemType' select="translate(s0:PackType/s0:Description, $uppercase, $lowercase)"/>
					<Items>
						<xsl:choose>
							<xsl:when test="$ItemType = 'carton'"> 
								<itemtype>[Replace]1[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'skid'"> 
								<itemtype>[Replace]2[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'pallet'"> 
								<itemtype>[Replace]3[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'crate'"> 
								<itemtype>[Replace]4[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'satchel'"> 
								<itemtype>[Replace]5[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'roll'"> 
								<itemtype>[Replace]6[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'panel'"> 
								<itemtype>[Replace]7[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'bag'"> 
								<itemtype>[Replace]8[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'tube'"> 
								<itemtype>[Replace]9[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'stillage'"> 
								<itemtype>[Replace]10[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'envelope'"> 
								<itemtype>[Replace]11[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'pack'"> 
								<itemtype>[Replace]12[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'rails'"> 
								<itemtype>[Replace]13[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'timberloose'"> 
								<itemtype>[Replace]14[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'combined'"> 
								<itemtype>[Replace]15[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'timberpack'"> 
								<itemtype>[Replace]16[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'pipe'"> 
								<itemtype>[Replace]17[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'bdouble'"> 
								<itemtype>[Replace]18[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'semi'"> 
								<itemtype>[Replace]19[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'twentyfootcontainer'"> 
								<itemtype>[Replace]20[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'fortyfootcontainer'"> 
								<itemtype>[Replace]21[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'bundle'"> 
								<itemtype>[Replace]22[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'case'"> 
								<itemtype>[Replace]23[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'volume'"> 
								<itemtype>[Replace]24[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'combinedloadsize'"> 
								<itemtype>[Replace]25[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'ibc'"> 
								<itemtype>[Replace]26[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'glpallet'"> 
								<itemtype>[Replace]27[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'gltrolley'"> 
								<itemtype>[Replace]28[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'glcarton'"> 
								<itemtype>[Replace]29[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'trolley'"> 
								<itemtype>[Replace]30[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'totalvolume'"> 
								<itemtype>[Replace]31[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'drum'"> 
								<itemtype>[Replace]32[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'loscam'"> 
								<itemtype>[Replace]33[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'loscamwood'"> 
								<itemtype>[Replace]34[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'loscamplastic'"> 
								<itemtype>[Replace]35[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'chep'"> 
								<itemtype>[Replace]36[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'chepwood'"> 
								<itemtype>[Replace]37[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'chepplastic'"> 
								<itemtype>[Replace]38[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'tray'"> 
								<itemtype>[Replace]39[Replace]</itemtype>
							</xsl:when>
							<xsl:when test="$ItemType = 'pot'"> 
								<itemtype>[Replace]40[Replace]</itemtype>
							</xsl:when>
							<xsl:otherwise>
							</xsl:otherwise>
						</xsl:choose>
						<Name>
							<xsl:value-of select="s0:PackType/s0:Description"/>
						</Name>
						<Quantity>
							<xsl:value-of select="concat('[Replace]',s0:PackQty,'[Replace]')"/>
						</Quantity>
						<Weight>
							<xsl:value-of select="concat('[Replace]',s0:Weight,'[Replace]')"/>
						</Weight>
							<xsl:if test="$LengthUnitCode = 'M'">
								
								<Height>
									<xsl:value-of select="concat('[Replace]',string(s0:Height * 100),'[Replace]')"/>
								</Height>
								
								<Length>
									<xsl:value-of select="concat('[Replace]',string(s0:Length * 100),'[Replace]')"/>
								</Length>
								<Width>
									<xsl:value-of select="concat('[Replace]',string(s0:Width * 100),'[Replace]')"/>
								</Width>
							</xsl:if>
						
					</Items>
			</xsl:for-each>
			<dgsDeclaration>false</dgsDeclaration>
			<!-- <defaultRouteSelection>cheapest</defaultRouteSelection> -->
			<customerReference>
				<xsl:value-of select="s0:Shipment/s0:Order/s0:OrderNumber"/>
			</customerReference>
			<customerReference2>
				<xsl:value-of select="s0:Shipment/s0:Order/s0:ClientReference"/>
			</customerReference2>
			<xsl:for-each select="s0:Shipment/s0:Order/s0:CustomizedFieldCollection/s0:CustomizedField">
				<xsl:if test="s0:Key = 'Company ID'">
					<companyId>
						<xsl:value-of select="s0:Value "/>
					</companyId>
				</xsl:if>
			</xsl:for-each>
		
			<xsl:for-each select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress">
				<xsl:if test="s0:AddressType = 'ConsignorPickupDeliveryAddress'">
					<fromName>
						<xsl:value-of select="s0:CompanyName"/>
					</fromName>
					<fromContact>
						<xsl:value-of select="s0:CompanyName"/>
					</fromContact>
					<fromPhone>
						<xsl:value-of select="s0:Phone"/>
					</fromPhone>
					<fromEmail>
						<xsl:value-of select="s0:Email"/>
					</fromEmail>
					<fromAddressLine1>
						<xsl:value-of select="s0:Address1"/>
					</fromAddressLine1>
					<fromAddressLine2>
						<xsl:value-of select="s0:Address2"/>
					</fromAddressLine2>
					<fromLocation>
						<Suburb>
							<xsl:value-of select="s0:City"/>
						</Suburb>
						<PostCode>
							<xsl:value-of select="s0:Postcode"/>
						</PostCode>
					</fromLocation>
				</xsl:if>
				
				<xsl:if test="s0:AddressType = 'ConsigneeAddress'">
					<toName>
						<xsl:value-of select="s0:CompanyName"/>
					</toName>
					<toContact>
						<xsl:value-of select="s0:CompanyName"/>
					</toContact>
					<toPhone>
						<xsl:value-of select="s0:Phone"/>
					</toPhone>
					<toEmail>
						<xsl:value-of select="s0:Email"/>
					</toEmail>
					<toAddressLine1>
						<xsl:value-of select="s0:Address1"/>
					</toAddressLine1>
					<toAddressLine2>
						<xsl:value-of select="s0:Address2"/>
					</toAddressLine2>
					<toLocation>
						<Suburb>
							<xsl:value-of select="s0:City"/>
						</Suburb>
						<PostCode>
							<xsl:value-of select="s0:Postcode"/>
						</PostCode>
					</toLocation>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="s0:Shipment/s0:NoteCollection/s0:Note/s0:Description = 'Goods Delivery Instructions'">
				<specialInstructions>
					<xsl:value-of select="s0:Shipment/s0:NoteCollection/s0:Note"/>
				</specialInstructions>
			</xsl:if>
			<ToRemove></ToRemove>
		</Item>
	</xsl:template>
</xsl:stylesheet>
