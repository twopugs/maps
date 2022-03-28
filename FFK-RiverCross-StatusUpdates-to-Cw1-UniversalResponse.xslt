<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes" />
  <xsl:template match="/">
    <xsl:apply-templates select="/root" />
  </xsl:template>
  <xsl:template match="/root">
		<UniversalEvent version="1.1" xmlns="http://www.cargowise.com/Schemas/Universal/2011/11">
			<Event>
				<DataContext>
					<DataTargetCollection>
						<DataTarget>
							<Type>LocalTransportLeg</Type>
							<Key>
								<xsl:value-of select="cw1ShipmentId"/>
							</Key>
						</DataTarget>
					</DataTargetCollection>
				</DataContext>
				<xsl:variable name='geoTrigger' select="geoTrigger"/>
				<xsl:variable name='vehicle_reg' select="vehicle_reg"/>
				<xsl:variable name='geoReference' select="geoReference"/>
				<xsl:variable name='transporter_name' select="transporter_name"/>
				
				<EventTime>
					<xsl:value-of select="triggerDateTime"/>
				</EventTime>
				<IsEstimate>false</IsEstimate>
				<xsl:choose>
					<xsl:when test="$geoTrigger = 'ASSIGNED'"> 
						<EventType>Z50</EventType>
						<EventReference>
							<xsl:value-of select="concat('RES=Truck ',$vehicle_reg,' assigned to leg | LOC=',$geoReference,' | TransporterName=',$transporter_name,' | Vehicle=',$vehicle_reg)"/>
						</EventReference>
					</xsl:when>
					<xsl:when test="$geoTrigger = 'LOADING'"> 
						<EventType>ARV</EventType>
						<EventReference>
							<xsl:value-of select="concat('RES=Pickup | LOC=',$geoReference,' | TransporterName=',$transporter_name,' | Vehicle=',$vehicle_reg)"/>
						</EventReference>
						<AdditionalFieldsToUpdateCollection>
							<AdditionalFieldsToUpdate>
								<Type>JobContainerLegs.JU_PickupTimeIn</Type>
								<Value>
									<xsl:value-of select="triggerDateTime"/>
								</Value>
							</AdditionalFieldsToUpdate>
						</AdditionalFieldsToUpdateCollection>
					</xsl:when>
					<xsl:when test="$geoTrigger = 'OUTBOUND'"> 
						<EventType>DEP</EventType>
						<EventReference>
							<xsl:value-of select="concat('RES=Pickup | LOC=',$geoReference,' | TransporterName=',$transporter_name,' | Vehicle=',$vehicle_reg)"/>
						</EventReference>
						<AdditionalFieldsToUpdateCollection>
							<AdditionalFieldsToUpdate>
								<Type>JobContainerLegs.JU_PickupTimeOut</Type>
								<Value>
									<xsl:value-of select="triggerDateTime"/>
								</Value>
							</AdditionalFieldsToUpdate>
						</AdditionalFieldsToUpdateCollection>
					</xsl:when>
					<xsl:when test="$geoTrigger = 'BORDER OUTBOUND'"> 
						<EventType>Z50</EventType>
						<EventReference>
							<xsl:value-of select="concat('RES=Truck ',$vehicle_reg,' arrived at border en route to offload | LOC=',$geoReference,' | TransporterName=',$transporter_name,' | Vehicle=',$vehicle_reg)"/>
						</EventReference>
					</xsl:when>
					<xsl:when test="$geoTrigger = 'BORDER-OUTBOUND'"> 
						<EventType>Z50</EventType>
						<EventReference>
							<xsl:value-of select="concat('RES=Truck ',$vehicle_reg,' arrived at border en route to offload | LOC=',$geoReference,' | TransporterName=',$transporter_name,' | Vehicle=',$vehicle_reg)"/>
						</EventReference>
					</xsl:when>
					<xsl:when test="$geoTrigger = 'OFFLOADING'"> 
						<EventType>ARV</EventType>
						<EventReference>
							<xsl:value-of select="concat('RES=Delivery | LOC=',$geoReference,' | TransporterName=',$transporter_name,' | Vehicle=',$vehicle_reg)"/>
						</EventReference>
						<AdditionalFieldsToUpdateCollection>
							<AdditionalFieldsToUpdate>
								<Type>JobContainerLegs.JU_DeliverTimeIn</Type>
								<Value>
									<xsl:value-of select="triggerDateTime"/>
								</Value>
							</AdditionalFieldsToUpdate>
						</AdditionalFieldsToUpdateCollection>
					</xsl:when>
					<xsl:when test="$geoTrigger = 'INBOUND'"> 
						<EventType>DEP</EventType>
						<EventReference>
							<xsl:value-of select="concat('RES=Delivery | LOC=',$geoReference,' | TransporterName=',$transporter_name,' | Vehicle=',$vehicle_reg)"/>
						</EventReference>
						<AdditionalFieldsToUpdateCollection>
							<AdditionalFieldsToUpdate>
								<Type>JobContainerLegs.JU_DeliverTimeOut</Type>
								<Value>
									<xsl:value-of select="triggerDateTime"/>
								</Value>
							</AdditionalFieldsToUpdate>
						</AdditionalFieldsToUpdateCollection>
					</xsl:when>
					<xsl:when test="$geoTrigger = 'BORDER-INBOUND'"> 
						<EventType>Z51</EventType>
						<EventReference>
							<xsl:value-of select="concat('RES=Truck ',$vehicle_reg,' arrived at border return trip | LOC=',$geoReference,' | TransporterName=',$transporter_name,' | Vehicle=',$vehicle_reg)"/>
						</EventReference>
					</xsl:when>
					<xsl:when test="$geoTrigger = 'BORDER INBOUND'"> 
						<EventType>Z50</EventType>
						<EventReference>
							<xsl:value-of select="concat('RES=Truck ',$vehicle_reg,' arrived at border return trip | LOC=',$geoReference,' | TransporterName=',$transporter_name,' | Vehicle=',$vehicle_reg)"/>
						</EventReference>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</Event>
			</UniversalEvent>
	</xsl:template>
</xsl:stylesheet>
