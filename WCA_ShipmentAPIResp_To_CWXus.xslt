<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/ArrayOfShipmentDto"/>
	</xsl:template>
	<xsl:template match="/ArrayOfShipmentDto">
		<UnversalShipmentRcd>
			<xsl:for-each select="ShipmentDto/Shipments/ShipmentInfo">
				<xsl:if test="General/DocType/text()='Master'">
					<UniversalShipment>
						<Shipment>
							<DataContext>
								<DataTargetCollection>
									<DataTarget>
										<Type>
											<xsl:value-of select="string('ForwardingConsol')"/>
										</Type>
									</DataTarget>
								</DataTargetCollection>
							</DataContext>
							<TransportMode>
								<Code>
									<xsl:value-of select="General/Mode/text()"/>
								</Code>
							</TransportMode>
							<xsl:if test="General/Mode/text()='SEA'">
								<ContainerMode>
									<Code>
										<xsl:value-of select="General/Mode/text()"/>
									</Code>
								</ContainerMode>
							</xsl:if>
							<WayBillNumber>
								<xsl:value-of select="General/DocNo/text()"/>
							</WayBillNumber>
							<WayBillType>
								<Code>MWB</Code>
							</WayBillType>
							<CustomizedFieldCollection>
								<CustomizedField>
									<Key>
										<xsl:value-of select="'WCA System Ref No'"/>
									</Key>
									<DataType>
										<xsl:value-of select="'String'"/>
									</DataType>
									<Value>
										<xsl:value-of select="General/SystemRefNo/text()"/>
									</Value>
								</CustomizedField>
								<CustomizedField>
									<Key>
										<xsl:value-of select="'WCA Sender Name'"/>
									</Key>
									<DataType>
										<xsl:value-of select="'String'"/>
									</DataType>
									<Value>
										<xsl:value-of select="MasterInfos/SenderInfo/SenderName/text()"/>
									</Value>
								</CustomizedField>
								<CustomizedField>
									<Key>
										<xsl:value-of select="'WCA SenderID'"/>
									</Key>
									<DataType>
										<xsl:value-of select="'String'"/>
									</DataType>
									<Value>
										<xsl:value-of select="MasterInfos/SenderInfo/SenderID/text()"/>
									</Value>
								</CustomizedField>
								<CustomizedField>
									<Key>
										<xsl:value-of select="'Delivery Address'"/>
									</Key>
									<DataType>
										<xsl:value-of select="'String'"/>
									</DataType>
									<Value>
										<xsl:value-of select="TransportationDetail/DeliveryAddress/text()"/>
									</Value>
								</CustomizedField>
								<CustomizedField>
									<Key>
										<xsl:value-of select="'Pickup Address'"/>
									</Key>
									<DataType>
										<xsl:value-of select="'String'"/>
									</DataType>
									<Value>
										<xsl:value-of select="TransportationDetail/PickupAddress/text()"/>
									</Value>
								</CustomizedField>
							</CustomizedFieldCollection>
							<OrganizationAddressCollection>							
								<OrganizationAddress>
									<AddressType>
										<xsl:value-of select="'SendingForwarderAddress'"/>
									</AddressType>
									<Address1>
										<xsl:value-of select="MasterInfos/OriginAgent/Address/text()"/>
									</Address1>
									<City>
										<xsl:value-of select="MasterInfos/OriginAgent/City/Code/text()"/>
									</City>
									<CompanyName>
										<xsl:value-of select="MasterInfos/OriginAgent/Name/text()"/>
									</CompanyName>
									<Country>
										<Code>
											<xsl:value-of select="MasterInfos/OriginAgent/Country/Code/text()"/>
										</Code>
									</Country>
									<Postcode>
										<xsl:value-of select="MasterInfos/OriginAgent/ZipCode/text()"/>
									</Postcode>
									<Phone>
										<xsl:value-of select="MasterInfos/OriginAgent/Phone/text()"/>
									</Phone>
									<Fax>
										<xsl:value-of select="MasterInfos/OriginAgent/Fax/text()"/>
									</Fax>
									<Email>
										<xsl:value-of select="MasterInfos/OriginAgent/Email/text()"/>
									</Email>
								</OrganizationAddress>
								<OrganizationAddress>
									<AddressType>
										<xsl:value-of select="'ReceivingForwarderAddress'"/>
									</AddressType>
									<Address1>
										<xsl:value-of select="MasterInfos/DestinationAgent/Address/text()"/>
									</Address1>
									<City>
										<xsl:value-of select="MasterInfos/DestinationAgent/City/Code/text()"/>
									</City>
									<CompanyName>
										<xsl:value-of select="MasterInfos/DestinationAgent/Name/text()"/>
									</CompanyName>
									<Country>
										<Code>
											<xsl:value-of select="MasterInfos/DestinationAgent/Country/Code/text()"/>
										</Code>
									</Country>
									<Postcode>
										<xsl:value-of select="MasterInfos/DestinationAgent/ZipCode/text()"/>
									</Postcode>
									<Phone>
										<xsl:value-of select="MasterInfos/DestinationAgent/Phone/text()"/>
									</Phone>
									<Fax>
										<xsl:value-of select="MasterInfos/DestinationAgent/Fax/text()"/>
									</Fax>
									<Email>
										<xsl:value-of select="MasterInfos/DestinationAgent/Email/text()"/>
									</Email>
								</OrganizationAddress>
								<OrganizationAddress>
									<AddressType>
										<xsl:value-of select="'ConsigneeDocumentaryAddress'"/>
									</AddressType>
									<Address1>
										<xsl:value-of select="Parties/PartyInfo/Address/text()"/>
									</Address1>
									<City>
										<xsl:value-of select="Parties/PartyInfo/City/Code/text()"/>
									</City>
									<CompanyName>
										<xsl:value-of select="Parties/PartyInfo/Name/text()"/>
									</CompanyName>
									<Country>
										<Code>
											<xsl:value-of select="Parties/PartyInfo/Country/Code/text()"/>
										</Code>
									</Country>
									<Postcode>
										<xsl:value-of select="Parties/PartyInfo/ZipCode/text()"/>
									</Postcode>
									<Phone>
										<xsl:value-of select="Parties/PartyInfo/Phone/text()"/>
									</Phone>
									<Fax>
										<xsl:value-of select="Parties/PartyInfo/Fax/text()"/>
									</Fax>
									<Email>
										<xsl:value-of select="Parties/PartyInfo/Email/text()"/>
									</Email>
								</OrganizationAddress>
							</OrganizationAddressCollection>
							<AgentsReference>
								<xsl:value-of select="MasterInfos/OriginAgent/ReferenceInformations/ReferencesDto[Type='FreightForwarderRefNo']/ReferenceInformation/text()"/>
							</AgentsReference>
							<BookingConfirmationReference>
								<xsl:value-of select="MasterInfos/DestinationAgent/ReferenceInformations/ReferencesDto[Type='ContractPartyRefNo']/ReferenceInformation/text()"/>
							</BookingConfirmationReference>
							<PlaceOfReceipt>
								<Code>
									<xsl:value-of select="TransportationDetail/PlaceOfReceipt/text()"/>
								</Code>
							</PlaceOfReceipt>
							<PortOfLoading>
								<Code>
									<xsl:value-of select="TransportationDetail/PortOfLoading/text()"/>
								</Code>
							</PortOfLoading>
							<PortOfDischarge>
								<Name>
									<xsl:value-of select="TransportationDetail/PortOfDischarge/text()"/>
								</Name>
							</PortOfDischarge>
							<PlaceOfDelivery>
								<Code>
								</Code>
							</PlaceOfDelivery>
							<SubShipmentCollection>
								<SubShipment>
									<ShipmentIncoTerm>
										<Code>
											<xsl:value-of select="TransportationDetail/ShippingTerm/text()"/>
										</Code>
									</ShipmentIncoTerm>
									<xsl:variable name="servicetype" select="TransportationDetail/ServiceType/text()"/>
									<ServiceLevel>
										<Description>
											<xsl:choose>
												<xsl:when test="$servicetype='Port To Port'">
													<xsl:value-of select="'PTP'"/>
												</xsl:when>
												<xsl:when test="$servicetype='Port To Door'">
													<xsl:value-of select="'PTD'"/>
												</xsl:when>
												<xsl:when test="$servicetype='Door To Port'">
													<xsl:value-of select="'DTP'"/>
												</xsl:when>
												<xsl:when test="$servicetype='Door To Door'">
													<xsl:value-of select="'DTD'"/>
												</xsl:when>
											</xsl:choose>
										</Description>
									</ServiceLevel>
									<LocalProcessing>
										<OrderNumberCollection>
											<OrderNumber>
												<OrderReference>
													<xsl:value-of select="TransportationDetail/ReferenceNumbers/ReferenceNumberDto[Type='PurchaseOrderNo']/ReferenceNumber/text()"/>
												</OrderReference>
											</OrderNumber>
										</OrderNumberCollection>
									</LocalProcessing>
									<TotalWeight>
										<xsl:value-of select="CargoDetails/CargoDetailDto/GrossWeight/Weight/text()"/>
									</TotalWeight>
									<TotalWeightUnit>
										<Code>
											<xsl:value-of select="substring(CargoDetails/CargoDetailDto/GrossWeight/Unit/text(),1,2)"/>
										</Code>
									</TotalWeightUnit>
									<TotalVolume>
										<xsl:value-of select="CargoDetails/CargoDetailDto/Volumne/Volumne/text()"/>
									</TotalVolume>
									<TotalVolumeUnit>
										<Code>
											<xsl:value-of select="substring(CargoDetails/CargoDetailDto/Volume/Unit/text(),1,2)"/>
										</Code>
									</TotalVolumeUnit>
									<PackingLineCollection>
										<xsl:for-each select="CargoDetails/CargoDetailDto/Dimensions/CargoDimensionDto">
						
											<PackingLine>
												<GoodsDescription>
													<xsl:value-of select="../../Commodity/text()"/>
												</GoodsDescription>
												<Commodity>
													<Code>
														<xsl:value-of select="../../CommodityType/text()"/>
													</Code>
												</Commodity>
												<HarmonisedCode>
													<xsl:value-of select="../../HSCode/text()"/>
												</HarmonisedCode>
												<PackQty>
													<xsl:value-of select="PCS/text()"/>
												</PackQty>
												<Length>
													<xsl:value-of select="Length/text()"/>
												</Length>
												<Width>
													<xsl:value-of select="Width/text()"/>
												</Width>
												<Height>
													<xsl:value-of select="Height/text()"/>
												</Height>
												<LengthUnit>
													<Code>
														<xsl:value-of select="substring(Unit/text(),1,2)"/>
													</Code>
												</LengthUnit>
											</PackingLine>
										</xsl:for-each>
									</PackingLineCollection>
								</SubShipment>
							</SubShipmentCollection>
							<ContainerCollection>
								<Container>
									<GoodsValue>
										<xsl:value-of select="TransportationDetail/DeclaredValueCarrier/text()"/>
									</GoodsValue>
								</Container>
							</ContainerCollection>
							<TransportLegCollection>
								<TransportLeg>
								<LegOrder><xsl:value-of select="position()"></xsl:value-of></LegOrder>
									<VoyageFlightNo>
										<xsl:value-of select="Flights/FlightInfoDto/FlightNumber/text()"/>
									</VoyageFlightNo>
									<PortOfLoading>
										<Code>
											<xsl:value-of select="Flights/FlightInfoDto/DepartureAirport/text()"/>
										</Code>
									</PortOfLoading>
									<PortOfDischarge>
										<Code>
											<xsl:value-of select="Flights/FlightInfoDto/ArrivalAirport/text()"/>
										</Code>
									</PortOfDischarge>
								</TransportLeg>
							</TransportLegCollection>
							<CarrierDocumentsOverride>
								<AWBHeader>
									<Requested1stCarrier>
										<xsl:value-of select="Flights/FlightInfoDto/AirlineCode/text()"/>
									</Requested1stCarrier>
									<OriginCode>
										<xsl:value-of select="Flights/FlightInfoDto/DepartureAirport/text()"/>
									</OriginCode>
								</AWBHeader>
							</CarrierDocumentsOverride>
						</Shipment>
					</UniversalShipment>
				</xsl:if>
			</xsl:for-each>
		</UnversalShipmentRcd>
	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[
public string StringConcat(string param0)
{
   return param0;
}



]]>
	</msxsl:script>
</xsl:stylesheet>