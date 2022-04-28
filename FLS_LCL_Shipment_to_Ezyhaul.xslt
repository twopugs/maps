<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes" />
  <xsl:template match="/">
    <xsl:apply-templates select="/UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/UniversalInterchange">
	<Root>
		<sourceId>FLS_CW1</sourceId>
		<data>
			<groupId>
				<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/CustomizedFieldCollection/CustomizedField[Key='Group ID']/Value"/>
			</groupId>
			<projectCode>
				<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/CustomizedFieldCollection/CustomizedField[Key='Project Code']/Value"/>
			</projectCode>
			<bookingRef>
				<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/DataSourceCollection/DataSource[Type='TransportBooking']/Key"/>
			</bookingRef>
			<bookingType>Normal</bookingType>
			<bookingPICName></bookingPICName>
			<bookingPICEmail></bookingPICEmail>
			<shipmentBookingType>
				<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/CustomizedFieldCollection/CustomizedField[Key='Booking Type']/Value"/>
			</shipmentBookingType>
			<issuingDateTime></issuingDateTime>
			<issuingDept></issuingDept>
			<containerNo></containerNo>
			<sealNo></sealNo>
			<requirements>
				<truckSize>
					<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/CustomizedFieldCollection/CustomizedField[Key='Truck Size']/Value"/>
				</truckSize>
				<requirementCode></requirementCode>
				<isCustomBonded></isCustomBonded>
			</requirements>
			<carrier>
				<carrierCode>
					<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/CustomizedFieldCollection/CustomizedField[Key='Carrier ID']/Value"/>
				</carrierCode>
				<vehicleRegNo>
					<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/CustomizedFieldCollection/CustomizedField[Key='Vehicle Registration']/Value"/>
				</vehicleRegNo>
			</carrier>
			<details>
				<pickup>
					<locationName>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/CompanyName"/>
					</locationName>
					<locationType>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/AddressType"/>
					</locationType>
					<address>
						<xsl:value-of select="concat(Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/Address1,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/Address2,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/City,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/State,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/Postcode,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/Country/Name)"/>
													 
					</address>
					<lat></lat>
					<lng></lng>
					<additionalAddress></additionalAddress>
					<scheduleEarliest>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/InstructionPackingLineLinkCollection/InstructionPackingLineLink/ConfirmationCollection/Confirmation/EstimatedDate"/>
					</scheduleEarliest>     
					<scheduleLatest>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/InstructionPackingLineLinkCollection/InstructionPackingLineLink/ConfirmationCollection/Confirmation/EstimatedDate"/>
					</scheduleLatest>
					<driverInstruction>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/ServiceInstruction"/>
					</driverInstruction>
					<contactName></contactName>
					<contactPhoneNumber>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/Phone"/>
					</contactPhoneNumber>
					<contactEmail>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='PIC' and Sequence='1']/Address/Email"/>
					</contactEmail>
					<references>
						<xsl:value-of select="Body/UniversalShipment/Shipment/INSERT"/>
					</references>
				</pickup>
			
				<delivery>
					<locationName>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/CompanyName"/>
					</locationName>
					<locationType>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/AddressType"/>
					</locationType>
					<address>
						<xsl:value-of select="concat(Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/Address1,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/Address2,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/City,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/State,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/Postcode,' ',
													 Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/Country/Name)"/>
													 
					</address>
					<lat></lat>
					<lng></lng>
					<additionalAddress></additionalAddress>
					<scheduleEarliest>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/InstructionPackingLineLinkCollection/InstructionPackingLineLink/ConfirmationCollection/Confirmation/EstimatedDate"/>
					</scheduleEarliest>     
					<scheduleLatest>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/InstructionPackingLineLinkCollection/InstructionPackingLineLink/ConfirmationCollection/Confirmation/EstimatedDate"/>
					</scheduleLatest>
					<driverInstruction>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/ServiceInstruction"/>
					</driverInstruction>
					<contactName></contactName>
					<contactPhoneNumber>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/Phone"/>
					</contactPhoneNumber>
					<contactEmail>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/InstructionCollection/Instruction[Type/Code='DLV' and Sequence='1']/Address/Email"/>
					</contactEmail>
					<references>
						<xsl:value-of select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/LocalProcessing/OrderNumberCollection/OrderNumber/OrderReference"/>
					</references>
				</delivery>
				
				
				<xsl:for-each select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment/PackingLineCollection/PackingLine">
					<loads>
						<unitQuantity>
							<xsl:value-of select="PackQty"/>
						</unitQuantity>
						<unitLength>
							<xsl:value-of select="Length"/>
						</unitLength>
						<unitWidth>
							<xsl:value-of select="Width"/>
						</unitWidth>
						<unitHeight>
							<xsl:value-of select="Height"/>
						</unitHeight>
						<unitWeight>
							<xsl:value-of select="Weight"/>
						</unitWeight>
						<handlingUnit>
							<xsl:value-of select="PackType/Description"/>
						</handlingUnit>
						<references></references>
						<isStackable></isStackable>
						<isHazardous>
							<xsl:value-of select="../../../SubShipment/IsHazardous"/>
						</isHazardous>
						<hazardousClass></hazardousClass>
						<isTempCtrl>
							<xsl:value-of select="../../../SubShipment/RequiresRefrigeration"/>
						</isTempCtrl>
						<tempCtrlUOM></tempCtrlUOM>
						<tempCtrlStart></tempCtrlStart>
						<tempCtrlEnd></tempCtrlEnd>
					</loads>
				</xsl:for-each>
			</details>
		</data>
	</Root>
		
	</xsl:template>
</xsl:stylesheet>