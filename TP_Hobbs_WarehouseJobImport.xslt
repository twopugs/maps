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
		<reference>REPLACE</reference>
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
		<xsl:if test="Body/UniversalShipment/Shipment/LocalProcessing/DeliveryRequiredBy != ''">
			<requiredByDate>
				<xsl:value-of select="Body/UniversalShipment/Shipment/LocalProcessing/DeliveryRequiredBy"/>
			</requiredByDate>
		</xsl:if>
		<xsl:if test="Body/UniversalShipment/Shipment/Order/DateCollection/Date[Type='Arrival' and IsEstimate='true']/Value != ''">
			<estimatedArrivalDate>
				<xsl:value-of select="Body/UniversalShipment/Shipment/Order/DateCollection/Date[Type='Arrival' and IsEstimate='true']/Value"/>
			</estimatedArrivalDate>
		</xsl:if>
		<xsl:if test="Body/UniversalShipment/Shipment/Order/DateCollection/Date[Type='Arrival' and IsEstimate='false']/Value != ''">
			<arrivalDate>
				<xsl:value-of select="Body/UniversalShipment/Shipment/Order/DateCollection/Date[Type='Arrival' and IsEstimate='false']/Value"/>
			</arrivalDate>
		</xsl:if>
		
		
		
		
		<xsl:for-each select="Body/UniversalShipment/Shipment/OrganizationAddressCollection/OrganizationAddress">
			
				<organizations>
					<xsl:choose>
						<xsl:when test="State != ''">
							<addressType>
								<xsl:value-of select="AddressType"/>
							</addressType>
							</xsl:when>				
						<xsl:otherwise>	
							<addressType>""</addressType>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="../../../../../Header/SenderID != ''">
							<owner>
								<xsl:value-of select="../../../../../Header/SenderID"/>
							</owner>
							</xsl:when>				
						<xsl:otherwise>	
							<owner>""</owner>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="CompanyName != ''">
						<code>
							<xsl:value-of select="CompanyName"/>
						</code>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="CompanyName != ''">
							<name>
								<xsl:value-of select="CompanyName"/>
							</name>
							</xsl:when>				
						<xsl:otherwise>	
							<name>""</name>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="Address1 != ''">
							<addressOne>
								<xsl:value-of select="Address1"/>
							</addressOne>
						</xsl:when>				
						<xsl:otherwise>	
							<addressOne>""</addressOne>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="Address2 != ''">
						<addressTwo>
							<xsl:value-of select="Address2"/>
						</addressTwo>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="City != ''">
							<city>
								<xsl:value-of select="City"/>
							</city>
						</xsl:when>				
						<xsl:otherwise>	
							<city>""</city>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="State != ''">
							<state>
								<xsl:value-of select="State"/>
							</state>
							</xsl:when>				
						<xsl:otherwise>	
							<state>
								<xsl:value-of select="string('')" />
							</state>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="Postcode != ''">
							<postCode>
								<xsl:value-of select="Postcode"/>
							</postCode>
						</xsl:when>				
						<xsl:otherwise>	
							<postCode><xsl:value-of select="string('')" /></postCode>
						</xsl:otherwise>
					</xsl:choose>
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
					<xsl:choose>
						<xsl:when test="Country/Code != ''">
							<countryCode>
								<xsl:value-of select="Country/Code"/>
							</countryCode>
						</xsl:when>				
						<xsl:otherwise>	
							<countryCode><xsl:value-of select="string('')" /></countryCode>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="Port/Code != ''">
						<unlocCode>
							<xsl:value-of select="Port/Code"/>
						</unlocCode>
					</xsl:if>
				</organizations>
			
		</xsl:for-each>
	</Root>
		
	</xsl:template>
</xsl:stylesheet>