<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes" />
  <xsl:template match="/">
    <xsl:apply-templates select="/UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/UniversalInterchange">
	<Root>
		<owner>
			<xsl:value-of select="Header/SenderID"/>
		</owner>
		<jobType>
			<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/DataSourceCollection/DataSource/Type"/>
		</jobType>
		<jobNumber>
			<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/DataSourceCollection/DataSource/Key"/>
		</jobNumber>
		<xsl:if test="Body/UniversalShipment/Shipment/DataContext/TriggerDate != ''">
			<lastUpdate>
				<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/TriggerDate"/>
			</lastUpdate>
		</xsl:if>
		<xsl:if test="Body/UniversalShipment/Shipment/LocalProcessing/DeliveryRequiredBy != ''">
			<deliveryRequiredBy>
				<xsl:value-of select="Body/UniversalShipment/Shipment/LocalProcessing/DeliveryRequiredBy"/>
			</deliveryRequiredBy>
		</xsl:if>
		<xsl:if test="Body/UniversalShipment/Shipment/Order/OrderNumber != ''">
			<mainReference>
				<xsl:value-of select="Body/UniversalShipment/Shipment/Order/OrderNumber"/>
			</mainReference>
		</xsl:if>
		<xsl:if test="Body/UniversalShipment/Shipment/Order/ClientReference != ''">
			<clientReference>
				<xsl:value-of select="Body/UniversalShipment/Shipment/Order/ClientReference"/>
			</clientReference>
		</xsl:if>
		<xsl:if test="Body/UniversalShipment/Shipment/Order/Status/Code != ''">
			<currentStatus>
				<xsl:value-of select="Body/UniversalShipment/Shipment/Order/Status/Code"/>
			</currentStatus>
		</xsl:if>
		<xsl:if test="Body/UniversalShipment/Shipment/Order/TransportReference != ''">
			<transportReference>
				<xsl:value-of select="Body/UniversalShipment/Shipment/Order/TransportReference"/>
			</transportReference>
		</xsl:if>
		<xsl:if test="Body/UniversalShipment/Shipment/Order/Warehouse/Code != ''">
			<warehouseCode>
				<xsl:value-of select="Body/UniversalShipment/Shipment/Order/Warehouse/Code"/>
			</warehouseCode>
		</xsl:if>
		
		<xsl:for-each select="Body/UniversalShipment/Shipment/OrganizationAddressCollection/OrganizationAddress">
			<xsl:if test="AddressType = 'ConsignorDocumentaryAddress'">
				<xsl:if test="CompanyName != ''">
					<supplierName>
						<xsl:value-of select="CompanyName"/>
					</supplierName>
				</xsl:if>
				<xsl:if test="City != ''">
					<supplierCity>
						<xsl:value-of select="City"/>
					</supplierCity>
				</xsl:if>
				<xsl:if test="Country/Code != ''">
					<supplierCountry>
						<xsl:value-of select="Country/Code"/>
					</supplierCountry>
				</xsl:if>
			</xsl:if>
			<xsl:if test="AddressType = 'ConsigneeDocumentaryAddress'">
				<xsl:if test="CompanyName != ''">
					<receiverName>
						<xsl:value-of select="CompanyName"/>
					</receiverName>
				</xsl:if>
				<xsl:if test="City != ''">
					<receiverCity>
						<xsl:value-of select="City"/>
					</receiverCity>
				</xsl:if>
				<xsl:if test="Country/Code != ''">
					<receiverCountry>
						<xsl:value-of select="Country/Code"/>
					</receiverCountry>
				</xsl:if>
			</xsl:if>
			
			
				<organization>
					<xsl:if test="AddressType != ''">
						<addressType>
							<xsl:value-of select="AddressType"/>
						</addressType>
					</xsl:if>
					<xsl:if test="../../../../../Header/SenderID != ''">
						<owner>
							<xsl:value-of select="../../../../../Header/SenderID"/>
						</owner>
					</xsl:if>
					<xsl:if test="CompanyName != ''">
						<code>
							<xsl:value-of select="CompanyName"/>
						</code>
					</xsl:if>
					<xsl:if test="CompanyName != ''">
						<name>
							<xsl:value-of select="CompanyName"/>
						</name>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="AddressType = 'ConsigneeAddress'"> 
							<consignee>YES</consignee>
						</xsl:when>
						<xsl:otherwise>
							<consignee>NO</consignee>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="AddressType = 'ConsignorAddress'"> 
							<consignor>YES</consignor>
						</xsl:when>
						<xsl:otherwise>
							<consignor>NO</consignor>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="AddressType = 'SendersLocalClient'"> 
							<debtor>YES</debtor>
						</xsl:when>
						<xsl:otherwise>
							<debtordebtor>NO</debtordebtor>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="Address1 != ''">
						<addressOne>
							<xsl:value-of select="Address1"/>
						</addressOne>
					</xsl:if>
					<xsl:if test="Address2 != ''">
						<addressTwo>
							<xsl:value-of select="Address2"/>
						</addressTwo>
					</xsl:if>
					<xsl:if test="City != ''">
						<city>
							<xsl:value-of select="City"/>
						</city>
					</xsl:if>
					<xsl:if test="State != ''">
						<state>
							<xsl:value-of select="State"/>
						</state>
					</xsl:if>
					<xsl:if test="Postcode != ''">
						<postCode>
							<xsl:value-of select="Postcode"/>
						</postCode>
					</xsl:if>
					<xsl:if test="Phone != ''">
						<phone>
							<xsl:value-of select="Phone"/>
						</phone>
					</xsl:if>
					<xsl:if test="Email != ''">
						<email>
							<xsl:value-of select="Email"/>
						</email>
					</xsl:if>
					<xsl:if test="Country/Code != ''">
						<countryCode>
							<xsl:value-of select="Country/Code"/>
						</countryCode>
					</xsl:if>
					<xsl:if test="Port/Code != ''">
						<unlocCode>
							<xsl:value-of select="Port/Code"/>
						</unlocCode>
					</xsl:if>
				</organization>
			
		</xsl:for-each>
	</Root>
		
	</xsl:template>
</xsl:stylesheet>