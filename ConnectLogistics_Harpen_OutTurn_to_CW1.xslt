<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/Schedule" />
	</xsl:template>
	<xsl:template match="/Schedule">
	<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
		<UniversalShipment>
				<Shipment>
					<DataContext>
						<DataTargetCollection>
							<DataTarget>
								<Type>ZAOutTurn</Type>
								<Key>
									<xsl:value-of select="General-Registration-Details/ExternalReference/text()" />
								</Key>
							</DataTarget>
						</DataTargetCollection>
						<Company>
							<Code>MLL</Code>
							<Country>
								<Code>ZA</Code>
							</Country>
						</Company>
						<DataProvider>OGSPRDMLL</DataProvider>
						<EnterpriseID>OGS</EnterpriseID>
						<ServerID>PRD</ServerID>
						<EventBranch>
							<Code>MLL</Code>
						</EventBranch>
					</DataContext>
					<ContainerMode>
						<Code>CNT</Code>
					</ContainerMode>
					<ExportGoodsType>
						<Code>
							<xsl:value-of select="General-Registration-Details/Doc-Type/text()" />
						</Code>
					</ExportGoodsType>
					<xsl:choose>
						<xsl:when test="Main-Carriage-Details/PlaceofDischarge = 'DURBAN'"> 
							<PortOfDischarge>
								<Code>ZADUR</Code>
							</PortOfDischarge>
						</xsl:when>
						<xsl:when test="Main-Carriage-Details/PlaceofDischarge = 'Durban'"> 
							<PortOfDischarge>
								<Code>ZADUR</Code>
							</PortOfDischarge>
						</xsl:when>
						<xsl:when test="Main-Carriage-Details/PlaceofDischarge = 'Cape Town'"> 
							<PortOfDischarge>
								<Code>ZACPT</Code>
							</PortOfDischarge>
						</xsl:when>
						<xsl:when test="Main-Carriage-Details/PlaceofDischarge = 'CAPE TOWN'"> 
							<PortOfDischarge>
								<Code>ZACPT</Code>
							</PortOfDischarge>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
					<PortOfLoading>
						<Code>
							<xsl:value-of select="Main-Carriage-Details/Place-of-Load/text()" />
						</Code>
					</PortOfLoading>
					<QuoteNumber>
						<xsl:value-of select="General-Registration-Details/LoadingNo-BookingRef/text()" />
					</QuoteNumber>
					<xsl:if test="General-Registration-Details/Shipment-Indicator !=''">
						<ShipmentType>
							<Code>
								<xsl:value-of select="translate(substring(General-Registration-Details/Shipment-Indicator/text(),0,4), $lowercase, $uppercase)" />
							</Code>
						</ShipmentType>
					</xsl:if>
					<TransportMode>
						<Code>SEA</Code>
					</TransportMode>
					<VesselName>
						<xsl:value-of select="Main-Carriage-Details/Ship-Name/text()" />
					</VesselName>
					<VoyageFlightNo>
						<xsl:value-of select="Main-Carriage-Details/Voyage/text()" />
					</VoyageFlightNo>
					<CustomsOffice>
						<Code>DBN</Code>
					</CustomsOffice>
					<WayBillNumber>
						<xsl:value-of select="General-Registration-Details/Transport-Document/text()" />
					</WayBillNumber>
					<AddInfoCollection>
						<AddInfo>
							<Key>GateInOutMessageType</Key>
							<Value>DGI</Value>
						</AddInfo>
						<AddInfo>
							<Key>UnpackedDate</Key>
							<Value>
								<xsl:value-of select="concat(substring(Main-Carriage-Details/UnpackDate,0,5),'-',substring(Main-Carriage-Details/UnpackDate,5,2),'-',substring(Main-Carriage-Details/UnpackDate,7,2),'T', substring(Main-Carriage-Details/UnpackTime,0,3),':',substring(Main-Carriage-Details/UnpackTime,3,2)) " />
							</Value>
						</AddInfo>
					</AddInfoCollection>
					<ContainerCollection Content="Complete">
						<xsl:for-each select="ContainerDetails">
							<Container>
								<ContainerNumber>
									<xsl:value-of select="ContainerNo/text()" />
								</ContainerNumber>
								<Seal>
									<xsl:value-of select="SealNo/text()" />
								</Seal>
								<ContainerType>
									<Code>
										<xsl:value-of select="ContainerSize/text()" />
									</Code>
								</ContainerType>
								<AddInfoCollection>
									<AddInfo>
										<Key>GateInOutDate</Key>
										<Value>
											<xsl:value-of select="concat(substring(../Main-Carriage-Details/Load-UnloadDate,0,5),'-',substring(../Main-Carriage-Details/Load-UnloadDate,5,2),'-',substring(../Main-Carriage-Details/Load-UnloadDate,7,2),'T', substring(../Main-Carriage-Details/Load-UnloadTime,0,3),':',substring(../Main-Carriage-Details/Load-UnloadTime,3,2)) " />
										</Value>
									</AddInfo>
								</AddInfoCollection>
								<ContainerStatus>
									<Code>
										<xsl:value-of select="CargoStatus/text()" />
									</Code>
								</ContainerStatus>
							</Container>
						</xsl:for-each>
					</ContainerCollection>
					<LocationAtClearance>
						<Code>
							<xsl:value-of select="ContainerDetails/DepotCode/text()" />
						</Code>
					</LocationAtClearance>
					<DateCollection>
						<Date>
							<Type>Departure</Type>
							<IsEstimate>false</IsEstimate>
							<Value>
								<xsl:value-of select="concat(substring(Main-Carriage-Details/EstimatedDateofDeparture,0,5),'-',substring(Main-Carriage-Details/EstimatedDateofDeparture,5,2),'-',substring(Main-Carriage-Details/EstimatedDateofDeparture,7,2),'T', substring(Main-Carriage-Details/EstimatedTimeofDeparture,0,3),':',substring(Main-Carriage-Details/EstimatedTimeofDeparture,3,2)) " />
							</Value>
						</Date>
						<Date>
							<Type>Arrival</Type>
							<IsEstimate>false</IsEstimate>
							<Value>
								<xsl:value-of select="concat(substring(Main-Carriage-Details/ActualDateofArrival,0,5),'-',substring(Main-Carriage-Details/ActualDateofArrival,5,2),'-',substring(Main-Carriage-Details/ActualDateofArrival,7,2),'T', substring(Main-Carriage-Details/ActualTimeofArrival,0,3),':',substring(Main-Carriage-Details/ActualTimeofArrival,3,2)) " />
							</Value>
						</Date>
						<Date>
							<Type>Unpack</Type>
							<IsEstimate>false</IsEstimate>
							<Value>
								<xsl:value-of select="concat(substring(Main-Carriage-Details/UnpackDate,0,5),'-',substring(Main-Carriage-Details/UnpackDate,5,2),'-',substring(Main-Carriage-Details/UnpackDate,7,2),'T', substring(Main-Carriage-Details/UnpackTime,0,3),':',substring(Main-Carriage-Details/UnpackTime,3,2)) " />
							</Value>
						</Date>
					</DateCollection>
					 <OrganizationAddressCollection>
						<OrganizationAddress>
							<AddressType>Carrier</AddressType>
							<OrganizationCode>
								<xsl:value-of select="Main-Carriage-Details/Shipping-Carrier-Code/text()" />
							</OrganizationCode>
						</OrganizationAddress>
					 </OrganizationAddressCollection>
					 <SubShipmentCollection>
						<xsl:for-each select="GoodsItemLine">
							<SubShipment>
								<WayBillNumber>
									<xsl:value-of select="House/text()" />
								</WayBillNumber>
								<WayBillType>
									<Code>HWB</Code>
								</WayBillType>
								<AddInfoCollection>
									<AddInfo>
										<Value>
											<xsl:value-of select="../Main-Carriage-Details/Shipping-Carrier-Code/text()" />
										</Value>
										<Key>BillIssuer</Key>
									</AddInfo>
								</AddInfoCollection>
								<PackingLineCollection Content="Complete">
									<PackingLine>
										<ContainerNumber>
											<xsl:value-of select="../ContainerDetails/ContainerNo/text()" />
										</ContainerNumber>
										<ManifestedWeight>
											<xsl:value-of select="Gross-Weight-Manifested/text()" />
										</ManifestedWeight>
										<MarksAndNos>
											<xsl:value-of select="Package-Marks/text()" />
										</MarksAndNos>
										<PackQty>0</PackQty>
										<GoodsDescription>
											<xsl:value-of select="Package-Description/text()" />
										</GoodsDescription>
										<PackType>
											<Code>
												<xsl:value-of select="Package-Type/text()" />
											</Code>
										</PackType>
										<AddInfoCollection>
											<AddInfo>
												<Key>CargoType</Key>
												<xsl:choose>
													<xsl:when test="Cargo-Type = 'Container'"> 
														<Value>CN</Value>
													</xsl:when>
													<xsl:when test="Cargo-Type = 'Break Bulk'"> 
														<Value>BB</Value>
													</xsl:when>
													<xsl:when test="Cargo-Type = 'Dry Bulk'"> 
														<Value>DB</Value>
													</xsl:when>
													<xsl:when test="Cargo-Type = 'Liquid Break'"> 
														<Value>LB</Value>
													</xsl:when>
													<xsl:otherwise>
														<Value>CN</Value>
													</xsl:otherwise>
												</xsl:choose>
											</AddInfo>
											<AddInfo>
												<Key>ExcessShortInd</Key>
												<xsl:choose>
													<xsl:when test="../Main-Carriage-Details/Excess-Indicator = 'Excess'"> 
														<Value>1</Value>
													</xsl:when>
													<xsl:when test="../Main-Carriage-Details/Excess-Indicator = 'None'"> 
														<Value>3</Value>
													</xsl:when>
													<xsl:when test="../Main-Carriage-Details/Excess-Indicator = 'No Excess'"> 
														<Value>3</Value>
													</xsl:when>
													<xsl:when test="../Main-Carriage-Details/Excess-Indicator = 'Overcarried'"> 
														<Value>7</Value>
													</xsl:when>
													<xsl:when test="../Main-Carriage-Details/Excess-Indicator = 'Part Shipment'"> 
														<Value>5</Value>
													</xsl:when>
													<xsl:when test="../Main-Carriage-Details/Excess-Indicator = 'Short'"> 
														<Value>2</Value>
													</xsl:when>
													<xsl:when test="../Main-Carriage-Details/Excess-Indicator = 'Short Landed Received'"> 
														<Value>8</Value>
													</xsl:when>
													<xsl:when test="../Main-Carriage-Details/Excess-Indicator = 'Split Storage'"> 
														<Value>6</Value>
													</xsl:when>
													<xsl:when test="../Main-Carriage-Details/Excess-Indicator = 'Unknown'"> 
														<Value>4</Value>
													</xsl:when>
													<xsl:otherwise>
														<Value>4</Value>
													</xsl:otherwise>
												</xsl:choose>
											</AddInfo>
										</AddInfoCollection>
										<OutturnedWeight>
											<xsl:value-of select="Gross-Weight-Found/text()" />
										</OutturnedWeight>
										<OutturnQty>
											<xsl:value-of select="NoOfPackages-Found/text()" />
										</OutturnQty>
									</PackingLine>
								</PackingLineCollection>
							</SubShipment>
						</xsl:for-each>
					 </SubShipmentCollection>
					
				</Shipment>
		</UniversalShipment>
	</xsl:template>

	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[

 public static string FormatDateTime(string inputDateString)
        {
            string outDateString;
            if(inputDateString.Length ==0)
            {
            outDateString="";
            }
            else
            {
            System.DateTime dt=System.Convert.ToDateTime(inputDateString);
            outDateString = dt.ToString("yyyy-mm-ddThh:mm");  
            }
            return outDateString;         
        }

]]>
	</msxsl:script>
</xsl:stylesheet>
