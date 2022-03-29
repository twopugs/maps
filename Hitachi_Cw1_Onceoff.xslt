<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0"  xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/UniversalInterchange">
  
	
			<UniversalShipment>
				<Shipment>
					<DataContext>
						<DataTargetCollection>
							<DataTarget>
								<Type>
									<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/DataSourceCollection/DataSource/Type/text()" />
								</Type>
							</DataTarget>
						</DataTargetCollection>
						<ActionPurpose>
							<Code>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/ActionPurpose/Code/text()" />
							</Code>
							<Description>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/ActionPurpose/Code/text()" />
							</Description>
						</ActionPurpose>
						<Company>
							<Code>SYD</Code>
							<Name>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/Company/Name/text()" />
							</Name>
						</Company>
						<EnterpriseID>HTA</EnterpriseID>
						<EventBranch>
							<Code>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/EventBranch/Code/text()" />
							</Code>
							<Name>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/EventBranch/Name/text()" />
							</Name>
						</EventBranch>
						<EventDepartment>
							<Code>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/EventDepartment/Code/text()" />
							</Code>
							<Name>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/EventDepartment/Name/text()" />
							</Name>
						</EventDepartment>
						<EventReference>
							<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/EventReference/text()" />
						</EventReference>
						<EventType>
							<Code>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/EventType/Code/text()" />
							</Code>
							<Description>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/EventType/Description/text()" />
							</Description>
						</EventType>
						<EventUser>
							<Code>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/EventUser/Code/text()" />
							</Code>
							<Name>
								<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/EventUser/Name/text()" />
							</Name>
						</EventUser>
						<ServerID>
							<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/ServerID/text()" />
						</ServerID>
						<TriggerCount>
							<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/TriggerCount/text()" />
						</TriggerCount>
						<TriggerDate>
							<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/TriggerDate/text()" />
						</TriggerDate>
						<TriggerDescription>
							<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/TriggerDescription/text()" />
						</TriggerDescription>
						<TriggerType>
							<xsl:value-of select="Body/UniversalShipment/Shipment/DataContext/TriggerType/text()" />
						</TriggerType>
					</DataContext>
					<AgentsReference>
						<xsl:value-of select="Body/UniversalShipment/Shipment/AgentsReference/text()" />
					</AgentsReference>
					<AWBServiceLevel>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/AWBServiceLevel/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/AWBServiceLevel/Description/text()" />
						</Description>
					</AWBServiceLevel>
					<BookingConfirmationReference>
						<xsl:value-of select="Body/UniversalShipment/Shipment/BookingConfirmationReference/text()" />
					</BookingConfirmationReference>
					<ChargeableRate>
						<xsl:value-of select="Body/UniversalShipment/Shipment/ChargeableRate/text()" />
					</ChargeableRate>
					<CoLoadBookingConfirmationReference>
						<xsl:value-of select="Body/UniversalShipment/Shipment/CoLoadBookingConfirmationReference/text()" />
					</CoLoadBookingConfirmationReference>
					<CoLoadMasterBillNumber>
						<xsl:value-of select="Body/UniversalShipment/Shipment/CoLoadMasterBillNumber/text()" />
					</CoLoadMasterBillNumber>
					<ContainerCount>
						<xsl:value-of select="Body/UniversalShipment/Shipment/ContainerCount/text()" />
					</ContainerCount>
					<ContainerMode>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/ContainerMode/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/ContainerMode/Description/text()" />
						</Description>
					</ContainerMode>
					<DocumentedChargeable>
						<xsl:value-of select="Body/UniversalShipment/Shipment/DocumentedChargeable/text()" />
					</DocumentedChargeable>
					<DocumentedVolume>
						<xsl:value-of select="Body/UniversalShipment/Shipment/DocumentedVolume/text()" />
					</DocumentedVolume>
					<DocumentedWeight>
						<xsl:value-of select="Body/UniversalShipment/Shipment/DocumentedWeight/text()" />
					</DocumentedWeight>
					<FreightRate>
						<xsl:value-of select="Body/UniversalShipment/Shipment/FreightRate/text()" />
					</FreightRate>
					<FreightRateCurrency>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/FreightRateCurrency/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/FreightRateCurrency/Description/text()" />
						</Description>
					</FreightRateCurrency>
					<IsCFSRegistered>
						<xsl:value-of select="Body/UniversalShipment/Shipment/IsCFSRegistered/text()" />
					</IsCFSRegistered>
					<IsDirectBooking>
						<xsl:value-of select="Body/UniversalShipment/Shipment/IsDirectBooking/text()" />
					</IsDirectBooking>
					<IsForwardRegistered>
						<xsl:value-of select="Body/UniversalShipment/Shipment/IsForwardRegistered/text()" />
					</IsForwardRegistered>
					<IsHazardous>
						<xsl:value-of select="Body/UniversalShipment/Shipment/IsHazardous/text()" />
					</IsHazardous>
					<IsNeutralMaster>
						<xsl:value-of select="Body/UniversalShipment/Shipment/IsNeutralMaster/text()" />
					</IsNeutralMaster>
					<LloydsIMO>
						<xsl:value-of select="Body/UniversalShipment/Shipment/LloydsIMO/text()" />
					</LloydsIMO>
					<ManifestedChargeable>
						<xsl:value-of select="Body/UniversalShipment/Shipment/ManifestedChargeable/text()" />
					</ManifestedChargeable>
					<ManifestedVolume>
						<xsl:value-of select="Body/UniversalShipment/Shipment/ManifestedVolume/text()" />
					</ManifestedVolume>
					<ManifestedWeight>
						<xsl:value-of select="Body/UniversalShipment/Shipment/ManifestedWeight/text()" />
					</ManifestedWeight>
					<MaximumAllowablePackageHeight>
						<xsl:value-of select="Body/UniversalShipment/Shipment/MaximumAllowablePackageHeight/text()" />
					</MaximumAllowablePackageHeight>
					<MaximumAllowablePackageLength>
						<xsl:value-of select="Body/UniversalShipment/Shipment/MaximumAllowablePackageLength/text()" />
					</MaximumAllowablePackageLength>
					<MaximumAllowablePackageLengthUnit>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/MaximumAllowablePackageLengthUnit/Code/text()" />
						</Code>
					</MaximumAllowablePackageLengthUnit>
					<MaximumAllowablePackageWidth>
						<xsl:value-of select="Body/UniversalShipment/Shipment/MaximumAllowablePackageWidth/text()" />
					</MaximumAllowablePackageWidth>
					<NoCopyBills>
						<xsl:value-of select="Body/UniversalShipment/Shipment/NoCopyBills/text()" />
					</NoCopyBills>
					<NoOriginalBills>
						<xsl:value-of select="Body/UniversalShipment/Shipment/NoOriginalBills/text()" />
					</NoOriginalBills>
					<OuterPacks>
						<xsl:value-of select="Body/UniversalShipment/Shipment/OuterPacks/text()" />
					</OuterPacks>
					<PaymentMethod>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PaymentMethod/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PaymentMethod/Description/text()" />
						</Description>
					</PaymentMethod>
					<PlaceOfDelivery>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PlaceOfDelivery/Code/text()" />
						</Code>
						<Name>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PlaceOfDelivery/Name/text()" />
						</Name>
					</PlaceOfDelivery>
					<PlaceOfIssue>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PlaceOfIssue/Code/text()" />
						</Code>
						<Name>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PlaceOfIssue/Name/text()" />
						</Name>
					</PlaceOfIssue>
					<PlaceOfReceipt>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PlaceOfReceipt/Code/text()" />
						</Code>
						<Name>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PlaceOfReceipt/Name/text()" />
						</Name>
					</PlaceOfReceipt>
					<PortFirstForeign>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PortFirstForeign/Code/text()" />
						</Code>
					</PortFirstForeign>
					<PortLastForeign>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PortLastForeign/Code/text()" />
						</Code>
					</PortLastForeign>
					<PortOfDischarge>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PortOfDischarge/Code/text()" />
						</Code>
						<Name>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PortOfDischarge/Name/text()" />
						</Name>
					</PortOfDischarge>
					<PortOfFirstArrival>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PortOfFirstArrival/Code/text()" />
						</Code>
					</PortOfFirstArrival>
					<PortOfLoading>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PortOfLoading/Code/text()" />
						</Code>
						<Name>
							<xsl:value-of select="Body/UniversalShipment/Shipment/PortOfLoading/Name/text()" />
						</Name>
					</PortOfLoading>
					<ReceivingForwarderHandlingType>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/ReceivingForwarderHandlingType/Code/text()" />
						</Code>
					</ReceivingForwarderHandlingType>
					<ReleaseType>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/ReleaseType/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/ReleaseType/Description/text()" />
						</Description>
					</ReleaseType>
					<RequiresTemperatureControl>
						<xsl:value-of select="Body/UniversalShipment/Shipment/RequiresTemperatureControl/text()" />
					</RequiresTemperatureControl>
					<ScreeningStatus>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/ScreeningStatus/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/ScreeningStatus/Description/text()" />
						</Description>
					</ScreeningStatus>
					<SendingForwarderHandlingType>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/SendingForwarderHandlingType/Code/text()" />
						</Code>
					</SendingForwarderHandlingType>
					<ShipmentType>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/ShipmentType/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/ShipmentType/Description/text()" />
						</Description>
					</ShipmentType>
					<TotalNoOfPacks>
						<xsl:value-of select="Body/UniversalShipment/Shipment/TotalNoOfPacks/text()" />
					</TotalNoOfPacks>
					<TotalNoOfPacksPackageType>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/TotalNoOfPacksPackageType/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/TotalNoOfPacksPackageType/Description/text()" />
						</Description>
					</TotalNoOfPacksPackageType>
					<TotalPreallocatedChargeable>
						<xsl:value-of select="Body/UniversalShipment/Shipment/TotalPreallocatedChargeable/text()" />
					</TotalPreallocatedChargeable>
					<TotalPreallocatedVolume>
						<xsl:value-of select="Body/UniversalShipment/Shipment/TotalPreallocatedVolume/text()" />
					</TotalPreallocatedVolume>
					<TotalPreallocatedVolumeUnit>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/TotalPreallocatedVolumeUnit/Code/text()" />
						</Code>
					</TotalPreallocatedVolumeUnit>
					<TotalPreallocatedWeight>	
						<xsl:value-of select="Body/UniversalShipment/Shipment/TotalPreallocatedWeight/text()" />
					</TotalPreallocatedWeight>
					<TotalPreallocatedWeightUnit>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/TotalPreallocatedWeightUnit/Code/text()" />
						</Code>
					</TotalPreallocatedWeightUnit>
					<TotalVolume>
						<xsl:value-of select="Body/UniversalShipment/Shipment/TotalVolume/text()" />
					</TotalVolume>
					<TotalVolumeUnit>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/TotalVolumeUnit/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/TotalVolumeUnit/Description/text()" />
						</Description>
					</TotalVolumeUnit>
					<TotalWeight>
						<xsl:value-of select="Body/UniversalShipment/Shipment/TotalWeight/text()" />
					</TotalWeight>
					<TotalWeightUnit>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/TotalWeightUnit/Code/text()" />
						</Code>
						<Description>
								<xsl:value-of select="Body/UniversalShipment/Shipment/TotalWeightUnit/Description/text()" />
						</Description>
					</TotalWeightUnit>
					<TransportMode>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/TransportMode/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/TransportMode/Description/text()" />
						</Description>
					</TransportMode>
					<VesselName>
						<xsl:value-of select="Body/UniversalShipment/Shipment/VesselName/text()" />
					</VesselName>
					<VoyageFlightNo>
						<xsl:value-of select="Body/UniversalShipment/Shipment/VoyageFlightNo/text()" />
					</VoyageFlightNo>
					<WayBillNumber>
						<xsl:value-of select="Body/UniversalShipment/Shipment/WayBillNumber/text()" />
					</WayBillNumber>
					<WayBillType>
						<Code>
							<xsl:value-of select="Body/UniversalShipment/Shipment/WayBillType/Code/text()" />
						</Code>
						<Description>
							<xsl:value-of select="Body/UniversalShipment/Shipment/WayBillType/Description/text()" />
						</Description>
					</WayBillType>
					<ContainerCollection Content="Complete">
						<xsl:for-each select="Body/UniversalShipment/Shipment/ContainerCollection/Container">
							<Container>
								<AirVentFlow>
									<xsl:value-of select="AirVentFlow/text()" />
								</AirVentFlow>
								<AirVentFlowRateUnit>
									<Code>
										<xsl:value-of select="AirVentFlowRateUnit/Code/text()" />
									</Code>
								</AirVentFlowRateUnit>
								<ArrivalCartageAdvised>
									<xsl:value-of select="ArrivalCartageAdvised/text()" />
								</ArrivalCartageAdvised>
								<ArrivalCartageComplete>
									<xsl:value-of select="ArrivalCartageComplete/text()" />
								</ArrivalCartageComplete>
								<ArrivalCartageDemurrageTime>
									<xsl:value-of select="ArrivalCartageDemurrageTime/text()" />
								</ArrivalCartageDemurrageTime>
								<ArrivalCartageRef>
									<xsl:value-of select="ArrivalCartageRef/text()" />
								</ArrivalCartageRef>
								<ArrivalCTOStorageStartDate>
									<xsl:value-of select="ArrivalCTOStorageStartDate/text()" />
								</ArrivalCTOStorageStartDate>
								<ArrivalDeliveryRequiredBy>
									<xsl:value-of select="ArrivalDeliveryRequiredBy/text()" />
								</ArrivalDeliveryRequiredBy>
								<ArrivalEstimatedDelivery>
									<xsl:value-of select="ArrivalEstimatedDelivery/text()" />
								</ArrivalEstimatedDelivery>
								<ArrivalPickupByRail>
									<xsl:value-of select="ArrivalPickupByRail/text()" />
								</ArrivalPickupByRail>
								<ArrivalSlotDateTime>
									<xsl:value-of select="ArrivalSlotDateTime/text()" />
								</ArrivalSlotDateTime>
								<ArrivalSlotReference>
									<xsl:value-of select="ArrivalSlotReference/text()" />
								</ArrivalSlotReference>
								<ArrivalTruckWaitTime>
									<xsl:value-of select="ArrivalSlotReference/text()" />
								</ArrivalTruckWaitTime>
								<Commodity>
									<Code>
										<xsl:value-of select="Commodity/Code/text()" />
									</Code>
								</Commodity>
								<ContainerCount>
									<xsl:value-of select="ContainerCount/text()" />
								</ContainerCount>
								<ContainerImportDORelease>
									<xsl:value-of select="ContainerImportDORelease/text()" />
								</ContainerImportDORelease>
								<ContainerNumber>
									<xsl:value-of select="ContainerNumber/text()" />
								</ContainerNumber>
								<ContainerParkEmptyPickupGateOut>
									<xsl:value-of select="ContainerParkEmptyPickupGateOut/text()" />
								</ContainerParkEmptyPickupGateOut>
								<ContainerParkEmptyReturnGateIn>
									<xsl:value-of select="ContainerParkEmptyReturnGateIn/text()" />
								</ContainerParkEmptyReturnGateIn>
								<ContainerQuality>
									<Code>
										<xsl:value-of select="ContainerQuality/Code/text()" />
									</Code>
								</ContainerQuality>
								<ContainerStatus>
									<Code>
										<xsl:value-of select="ContainerStatus/Code/text()" />
									</Code>
								</ContainerStatus>
								<ContainerType>
									<Code>
										<xsl:value-of select="ContainerType/Code/text()" />
									</Code>
									<Category>
										<Code>
											<xsl:value-of select="ContainerType/Category/Code/text()" />
										</Code>
										<Description>
											<xsl:value-of select="ContainerType/Category/Description/text()" />
										</Description>
									</Category>
									<Description>
										<xsl:value-of select="ContainerType/Description/text()" />
									</Description>
									<ISOCode>
										<xsl:value-of select="ContainerType/ISOCode/text()" />
									</ISOCode>
								</ContainerType>
								<DeliveryMode>
									<xsl:value-of select="DeliveryMode/text()" />
								</DeliveryMode>
								<DeliverySequence>
									<xsl:value-of select="DeliverySequence/text()" />
								</DeliverySequence>
								<DepartureCartageAdvised>
									<xsl:value-of select="DepartureCartageAdvised/text()" />
								</DepartureCartageAdvised>
								<DepartureCartageComplete>
									<xsl:value-of select="DepartureCartageAdvised/text()" />
								</DepartureCartageComplete>
								<DepartureCartageDemurrageTime>
									<xsl:value-of select="DepartureCartageDemurrageTime/text()" />
								</DepartureCartageDemurrageTime>
								<DepartureCartageRef>
									<xsl:value-of select="DepartureCartageRef/text()" />
								</DepartureCartageRef>
								<DepartureDeliveryByRail>
									<xsl:value-of select="DepartureDeliveryByRail/text()" />
								</DepartureDeliveryByRail>
								<DepartureDockReceipt>
									<xsl:value-of select="DepartureDockReceipt/text()" />
								</DepartureDockReceipt>
								<DepartureEstimatedPickup>
									<xsl:value-of select="DepartureEstimatedPickup/text()" />
								</DepartureEstimatedPickup>
								<DepartureSlotDateTime>
									<xsl:value-of select="DepartureSlotDateTime/text()" />
								</DepartureSlotDateTime>
								<DepartureSlotReference>
									<xsl:value-of select="DepartureSlotReference/text()" />
								</DepartureSlotReference>
								<DepartureTruckWaitTime>
									<xsl:value-of select="DepartureTruckWaitTime/text()" />
								</DepartureTruckWaitTime>
								<DunnageWeight>
									<xsl:value-of select="DunnageWeight/text()" />
								</DunnageWeight>
								<EmptyReadyForReturn>
									<xsl:value-of select="EmptyReadyForReturn/text()" />
								</EmptyReadyForReturn>
								<EmptyRequired>
									<xsl:value-of select="EmptyRequired/text()" />
								</EmptyRequired>
								<EmptyReturnedBy>
									<xsl:value-of select="EmptyRequired/text()" />
								</EmptyReturnedBy>
								<EmptyReturnRef>
										<xsl:value-of select="EmptyReturnRef/text()" />
								</EmptyReturnRef>
								<ExportDepotCustomsReference>
									<xsl:value-of select="EmptyReturnRef/text()" />
								</ExportDepotCustomsReference>
								<FCL_LCL_AIR>
									<Code>
										<xsl:value-of select="FCL_LCL_AIR/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="FCL_LCL_AIR/Description/text()" />
									</Description>
								</FCL_LCL_AIR>
								<FCLAvailable>
									<xsl:value-of select="FCLAvailable/text()" />
								</FCLAvailable>
								<FCLHeldInTransitStaging>
									<xsl:value-of select="FCLHeldInTransitStaging/text()" />
								</FCLHeldInTransitStaging>
								<FCLOnBoardVessel>
									<xsl:value-of select="FCLOnBoardVessel/text()" />
								</FCLOnBoardVessel>
								<FCLStorageArrivedUnderbond>
									<xsl:value-of select="FCLStorageArrivedUnderbond/text()" />
								</FCLStorageArrivedUnderbond>
								<FCLStorageCommences>
									<xsl:value-of select="FCLStorageCommences/text()" />
								</FCLStorageCommences>
								<FCLStorageModuleOnlyMaster>
									<xsl:value-of select="FCLStorageModuleOnlyMaster/text()" />
								</FCLStorageModuleOnlyMaster>
								<FCLStorageUnderbondCleared>
									<xsl:value-of select="FCLStorageUnderbondCleared/text()" />
								</FCLStorageUnderbondCleared>
								<FCLUnloadFromVessel>
									<xsl:value-of select="FCLUnloadFromVessel/text()" />
								</FCLUnloadFromVessel>
								<FCLWharfGateIn>
									<xsl:value-of select="FCLWharfGateIn/text()" />
								</FCLWharfGateIn>
								<FCLWharfGateOut>
									<xsl:value-of select="FCLWharfGateOut/text()" />
								</FCLWharfGateOut>
								<GoodsValue>
									<xsl:value-of select="GoodsValue/text()" />
								</GoodsValue>
								<GoodsValueCurrency>
									<Code>
										<xsl:value-of select="GoodsValueCurrency/Code/text()" />
									</Code>
								</GoodsValueCurrency>
								<GoodsWeight>
									<xsl:value-of select="GoodsWeight/text()" />
								</GoodsWeight>
								<GrossWeight>
									<xsl:value-of select="GrossWeight/text()" />
								</GrossWeight>
								<GrossWeightVerificationType>
									<Code>
										<xsl:value-of select="GrossWeightVerificationType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="GrossWeightVerificationType/Description/text()" />
									</Description>
								</GrossWeightVerificationType>
								<HumidityPercent>
									<xsl:value-of select="HumidityPercent/text()" />
								</HumidityPercent>
								<ImportDepotCustomsReference>
										<xsl:value-of select="ImportDepotCustomsReference/text()" />
								</ImportDepotCustomsReference>
								<IsCFSRegistered>
									<xsl:value-of select="IsCFSRegistered/text()" />
								</IsCFSRegistered>
								<IsControlledAtmosphere>
									<xsl:value-of select="IsControlledAtmosphere/text()" />
								</IsControlledAtmosphere>
								<IsDamaged>
									<xsl:value-of select="IsDamaged/text()" />
								</IsDamaged>
								<IsEmptyContainer>
									<xsl:value-of select="IsEmptyContainer/text()" />
								</IsEmptyContainer>
								<IsSealOk>
									<xsl:value-of select="IsSealOk/text()" />
								</IsSealOk>
								<IsShipperOwned>
									<xsl:value-of select="IsShipperOwned/text()" />
								</IsShipperOwned>
								<LCLAvailable>
									<xsl:value-of select="LCLAvailable/text()" />
								</LCLAvailable>
								<LCLStorageCommences>
									<xsl:value-of select="LCLStorageCommences/text()" />
								</LCLStorageCommences>
								<LCLUnpack>
									<xsl:value-of select="LCLUnpack/text()" />
								</LCLUnpack>
								<LengthUnit>
									<Code>
										<xsl:value-of select="LengthUnit/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="LengthUnit/Description/text()" />
									</Description>
								</LengthUnit>
								<Link>
									<xsl:value-of select="Link/text()" />
								</Link>
								<OverhangBack>
									<xsl:value-of select="OverhangBack/text()" />
								</OverhangBack>
								<OverhangFront>
									<xsl:value-of select="OverhangFront/text()" />
								</OverhangFront>
								<OverhangHeight>
									<xsl:value-of select="OverhangHeight/text()" />
								</OverhangHeight>
								<OverhangLeft>
									<xsl:value-of select="OverhangLeft/text()" />
								</OverhangLeft>
								<OverhangRight>
									<xsl:value-of select="OverhangRight/text()" />
								</OverhangRight>
								<OverrideFCLAvailableStorage>
									<xsl:value-of select="OverrideFCLAvailableStorage/text()" />
								</OverrideFCLAvailableStorage>
								<OverrideLCLAvailableStorage>
									<xsl:value-of select="OverrideLCLAvailableStorage/text()" />
								</OverrideLCLAvailableStorage>
								<PackDate>
									<xsl:value-of select="PackDate/text()" />
								</PackDate>
								<RefrigGeneratorID>
									<xsl:value-of select="RefrigGeneratorID/text()" />
								</RefrigGeneratorID>
								<ReleaseNum>
									<xsl:value-of select="ReleaseNum/text()" />
								</ReleaseNum>
								<Seal>
									<xsl:value-of select="Seal/text()" />
								</Seal>
								<SealPartyType>
									<Code>
										<xsl:value-of select="SealPartyType/Code/text()" />
									</Code>
								</SealPartyType>
								<SecondSeal>
									<xsl:value-of select="SecondSeal/text()" />
								</SecondSeal>
								<SecondSealPartyType>
									<Code>
										<xsl:value-of select="SecondSealPartyType/Code/text()" />
									</Code>
								</SecondSealPartyType>
								<SetPointTemp>
									<xsl:value-of select="SetPointTemp/text()" />
								</SetPointTemp>
								<SetPointTempUnit>
									<xsl:value-of select="SetPointTempUnit/text()" />
								</SetPointTempUnit>
								<StowagePosition>
									<xsl:value-of select="StowagePosition/text()" />
								</StowagePosition>
								<TareWeight>
									<xsl:value-of select="TareWeight/text()" />
								</TareWeight>
								<TempRecorderSerialNo>
									<xsl:value-of select="TempRecorderSerialNo/text()" />
								</TempRecorderSerialNo>
								<ThirdSeal>
									<xsl:value-of select="ThirdSeal/text()" />
								</ThirdSeal>
								<ThirdSealPartyType>
									<Code>
										<xsl:value-of select="ThirdSealPartyType/Code/text()" />
									</Code>
								</ThirdSealPartyType>
								<TotalHeight>
									<xsl:value-of select="TotalHeight/text()" />
								</TotalHeight>
								<TotalLength>
									<xsl:value-of select="TotalLength/text()" />
								</TotalLength>
								<TotalWidth>
									<xsl:value-of select="TotalWidth/text()" />
								</TotalWidth>
								<TrainWagonNumber>
									<xsl:value-of select="TrainWagonNumber/text()" />
								</TrainWagonNumber>
								<UnpackGang>
									<xsl:value-of select="UnpackGang/text()" />
								</UnpackGang>
								<UnpackShed>
									<xsl:value-of select="UnpackShed/text()" />
								</UnpackShed>
								<VolumeCapacity>
									<xsl:value-of select="VolumeCapacity/text()" />
								</VolumeCapacity>
								<VolumeUnit>
									<Code>
										<xsl:value-of select="VolumeUnit/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="VolumeUnit/Description/text()" />
									</Description>
								</VolumeUnit>
								<WeightCapacity>
									<xsl:value-of select="VolumeCapacity/text()" />
								</WeightCapacity>
								<WeightUnit>
									<Code>
										<xsl:value-of select="WeightUnit/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="WeightUnit/Description/text()" />
									</Description>
								</WeightUnit>
							</Container>
						</xsl:for-each>
					</ContainerCollection>
					<CustomizedFieldCollection>
						<xsl:for-each select="Body/UniversalShipment/Shipment/CustomizedFieldCollection/CustomizedField">
							<CustomizedField>
								<DataType>
									<xsl:value-of select="DataType/text()" />
								</DataType>
								<Key>
									<xsl:value-of select="Key/text()" />
								</Key>
								<Value>
									<xsl:value-of select="Value/text()" />
								</Value>
							</CustomizedField>
						</xsl:for-each>
					</CustomizedFieldCollection>
					<DateCollection>
						<xsl:for-each select="Body/UniversalShipment/Shipment/DateCollection/Date">
							<Date>
								<Type>
									<xsl:value-of select="Type/text()" />
								</Type>
								<IsEstimate>
									<xsl:value-of select="IsEstimate/text()" />
								</IsEstimate>
								<Value>
									<xsl:value-of select="Value/text()" />
								</Value>
							</Date>
						</xsl:for-each>
					</DateCollection>
					<MilestoneCollection>
						<xsl:for-each select="Body/UniversalShipment/Shipment/MilestoneCollection/Milestone">
							<Milestone>
								<Description>
									<xsl:value-of select="Description/text()" />
								</Description>
								<EventCode>
									<xsl:value-of select="EventCode/text()" />
								</EventCode>
								<Sequence>
									<xsl:value-of select="Sequence/text()" />
								</Sequence>
								<ActualDate>
									<xsl:value-of select="ActualDate/text()" />
								</ActualDate>
								<ConditionReference>
									<xsl:value-of select="ConditionReference/text()" />
								</ConditionReference>
								<ConditionType>
									<xsl:value-of select="ConditionType/text()" />
								</ConditionType>
								<EstimatedDate>
									<xsl:value-of select="EstimatedDate/text()" />
								</EstimatedDate>
							</Milestone>
						</xsl:for-each>
					</MilestoneCollection>
					<OrganizationAddressCollection>
						<xsl:for-each select="Body/UniversalShipment/Shipment/OrganizationAddressCollection/OrganizationAddress">
							<OrganizationAddress>
								<AddressType>
									<xsl:value-of select="AddressType/text()" />
								</AddressType>
								<Address1>
									<xsl:value-of select="Address1/text()" />
								</Address1>
								<Address2>
									<xsl:value-of select="Address2/text()" />
								</Address2>
								<AddressOverride>
									<xsl:value-of select="AddressOverride/text()" />
								</AddressOverride>
								<AddressShortCode>
									<xsl:value-of select="AddressShortCode/text()" />
								</AddressShortCode>
								<City>
									<xsl:value-of select="City/text()" />
								</City>
								<CompanyName>
									<xsl:value-of select="CompanyName/text()" />
								</CompanyName>
								<Country>
									<Code>
										<xsl:value-of select="Country/Code/text()" />
									</Code>
									<Name>
										<xsl:value-of select="Country/Name/text()" />
									</Name>
								</Country>
								<Email>
									<xsl:value-of select="Email/text()" />
								</Email>
								<Fax>
									<xsl:value-of select="Fax/text()" />
								</Fax>
								<GovRegNum>
									<xsl:value-of select="GovRegNum/text()" />
								</GovRegNum>
								<GovRegNumType>
									<Code>
										<xsl:value-of select="GovRegNumType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="GovRegNumType/Description/text()" />
									</Description>
								</GovRegNumType>
								<OrganizationCode>
									<xsl:value-of select="OrganizationCode/text()" />
								</OrganizationCode>
								<Phone>
									<xsl:value-of select="Phone/text()" />
								</Phone>
								<Port>
									<Code>
										<xsl:value-of select="Port/Code/text()" />
									</Code>
									<Name>
										<xsl:value-of select="Port/Name/text()" />
									</Name>
								</Port>
								<Postcode>
									<xsl:value-of select="Postcode/text()" />
								</Postcode>
								<ScreeningStatus>
									<Code>
										<xsl:value-of select="ScreeningStatus/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="ScreeningStatus/Description/text()" />
									</Description>
								</ScreeningStatus>
								<State>
									<xsl:attribute name="Description">
										<xsl:value-of select="State/@Description"/>
									</xsl:attribute>
									<xsl:value-of select="State/text()"/>
								</State>
								<RegistrationNumberCollection>
									<xsl:for-each select="RegistrationNumberCollection/RegistrationNumber">
										<RegistrationNumber>
											<Type>
												<Code>
													<xsl:value-of select="Type/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="Type/Description/text()" />
												</Description>
											</Type>
											<CountryOfIssue>
												<Code>
													<xsl:value-of select="CountryOfIssue/Code/text()" />
												</Code>
												<Name>
													<xsl:value-of select="CountryOfIssue/Name/text()" />
												</Name>
											</CountryOfIssue>
											<Value>
												<xsl:value-of select="Value/text()" />
											</Value>
										</RegistrationNumber>
									</xsl:for-each>
								</RegistrationNumberCollection>
							</OrganizationAddress>
						</xsl:for-each>
					</OrganizationAddressCollection>
					<SubShipmentCollection>
						<xsl:for-each select="Body/UniversalShipment/Shipment/SubShipmentCollection/SubShipment">
							<SubShipment>
								<DataContext>
									<DataTargetCollection>
										<xsl:for-each select="DataContext/DataSourceCollection/DataSource">
											<DataTarget>
												<Type>
													<xsl:value-of select="Type/text()" />
												</Type>
											</DataTarget>
										</xsl:for-each>
									</DataTargetCollection>
								</DataContext>
								<ActualChargeable>
									<xsl:value-of select="ActualChargeable/text()" />
								</ActualChargeable>
								<AdditionalTerms>
										<xsl:value-of select="AdditionalTerms/text()" />
								</AdditionalTerms>
								<AgentsReference>
									<xsl:value-of select="AgentsReference/text()" />
								</AgentsReference>
								<BookingConfirmationReference>
									<xsl:value-of select="BookingConfirmationReference/text()" />
								</BookingConfirmationReference>
								<Branch>
									<Code>
										<xsl:value-of select="Branch/Code/text()" />
									</Code>
									<Name>
										<xsl:value-of select="Branch/Name/text()" />
									</Name>
								</Branch>
								<CartageWaybillNumber>
									<xsl:value-of select="CartageWaybillNumber/text()" />
								</CartageWaybillNumber>
								<CFSReference>
									<xsl:value-of select="CFSReference/text()" />
								</CFSReference>
								<CommercialInfo>
									<Name>
										<xsl:value-of select="CommercialInfo/Name/text()" />
									</Name>
									<AddInfoCollection>
										<xsl:for-each select="CommercialInfo/AddInfoCollection/AddInfo">
											<AddInfo>
												<Key>
													<xsl:value-of select="Key/text()" />
												</Key>
												<Value>
													<xsl:value-of select="Value/text()" />
												</Value>
											</AddInfo>
										</xsl:for-each>
									</AddInfoCollection>
									<CommercialChargeCollection>
										<xsl:for-each select="CommercialInfo/CommercialChargeCollection/CommercialCharge">
											<CommercialCharge>
												<ChargeType>
													<Code>
														<xsl:value-of select="ChargeType/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="ChargeType/Description/text()" />
													</Description>
												</ChargeType>
												<AdjustedCharge>
													<xsl:value-of select="AdjustedCharge/text()" />
												</AdjustedCharge>
												<AgreedExchangeRate>
													<xsl:value-of select="AgreedExchangeRate/text()" />
												</AgreedExchangeRate>
												<Amount>
													<xsl:value-of select="Amount/text()" />
												</Amount>
												<ApportionmentType>
													<Code>
														<xsl:value-of select="ApportionmentType/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="ApportionmentType/Description/text()" />
													</Description>
												</ApportionmentType>
												<Currency>
													<Code>
														<xsl:value-of select="Currency/Code/text()" />
													</Code>
												</Currency>
												<DistributeBy>
													<Code>
														<xsl:value-of select="DistributeBy/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="DistributeBy/Description/text()" />
													</Description>
												</DistributeBy>
												<ExchangeRateType>
													<Code>
														<xsl:value-of select="ExchangeRateType/Code/text()" />
													</Code>
												</ExchangeRateType>
												<IsApportionedCharge>
													<xsl:value-of select="IsApportionedCharge/text()" />
												</IsApportionedCharge>
												<IsDutiable>
													<xsl:value-of select="IsDutiable/text()" />
												</IsDutiable>
												<IsGSTApplicable>
													<xsl:value-of select="IsGSTApplicable/text()" />
												</IsGSTApplicable>
												<IsIncludedInITOT>
													<xsl:value-of select="IsIncludedInITOT/text()" />
												</IsIncludedInITOT>
												<IsNotIncludedInInvoice>
													<xsl:value-of select="IsNotIncludedInInvoice/text()" />
												</IsNotIncludedInInvoice>
												<IsStatisticalValueApplicable>
													<xsl:value-of select="IsStatisticalValueApplicable/text()" />
												</IsStatisticalValueApplicable>
												<PercentageOfLinePrice>
													<xsl:value-of select="PercentageOfLinePrice/text()" />
												</PercentageOfLinePrice>
												<PrepaidCollect>
													<Code>
														<xsl:value-of select="PrepaidCollect/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="PrepaidCollect/Description/text()" />
													</Description>
												</PrepaidCollect>
											</CommercialCharge>
										</xsl:for-each>
									</CommercialChargeCollection>
									<CommercialInvoiceCollection>
										<xsl:attribute name="Content">
											<xsl:value-of select="CommercialInfo/CommercialInvoiceCollection/@Content"/>
										</xsl:attribute>
											<xsl:for-each select="CommercialInfo/CommercialInvoiceCollection/CommercialInvoice">
												<CommercialInvoice>
													<InvoiceNumber>
														<xsl:value-of select="InvoiceNumber/text()" />
													</InvoiceNumber>
													<AdditionalTerms>
														<xsl:value-of select="AdditionalTerms/text()" />
													</AdditionalTerms>
													<AgreedExchangeRate>
														<xsl:value-of select="AgreedExchangeRate/text()" />
													</AgreedExchangeRate>
													<BillNumber>
														<xsl:value-of select="BillNumber/text()" />
													</BillNumber>
													<ExchangeRateType>
														<Code>
															<xsl:value-of select="ExchangeRateType/Code/text()" />
														</Code>
													</ExchangeRateType>
													<IncoTerm>
														<Code>
															<xsl:value-of select="IncoTerm/Code/text()" />
														</Code>
														<Description>
															<xsl:value-of select="IncoTerm/Description/text()" />
														</Description>
													</IncoTerm>
													<InvoiceAmount>
														<xsl:value-of select="InvoiceAmount/text()" />
													</InvoiceAmount>
													<InvoiceCurrency>
														<Code>
															<xsl:value-of select="InvoiceCurrency/Code/text()" />
														</Code>
														<Description>
															<xsl:value-of select="InvoiceCurrency/Description/text()" />
														</Description>
													</InvoiceCurrency>
													<InvoiceDate>
														<xsl:value-of select="InvoiceDate/text()" />
													</InvoiceDate>
													<LandedCostExchangeRate>
														<xsl:value-of select="LandedCostExchangeRate/text()" />
													</LandedCostExchangeRate>
													<MessageStatus>
														<Code>
															<xsl:value-of select="MessageStatus/Code/text()" />
														</Code>
													</MessageStatus>
													<NetWeight>
														<xsl:value-of select="NetWeight/text()" />
													</NetWeight>
													<NetWeightUQ>
														<Code>
															<xsl:value-of select="NetWeightUQ/Code/text()" />
														</Code>
														<Description>
															<xsl:value-of select="NetWeightUQ/Description/text()" />
														</Description>
													</NetWeightUQ>
													<NoOfPacks>
														<xsl:value-of select="NoOfPacks/text()" />
													</NoOfPacks>
													<PaymentAmount>
														<xsl:value-of select="PaymentAmount/text()" />
													</PaymentAmount>
													<PaymentDate>
														<xsl:value-of select="PaymentDate/text()" />
													</PaymentDate>
													<PaymentExchangeRate>
														<xsl:value-of select="PaymentExchangeRate/text()" />
													</PaymentExchangeRate>
													<PaymentNumber>
														<xsl:value-of select="PaymentNumber/text()" />
													</PaymentNumber>
													<RelatedIndicator>
														<Code>
															<xsl:value-of select="RelatedIndicator/Code/text()" />
														</Code>
													</RelatedIndicator>
													<Supplier>
														<AddressType>
															<xsl:value-of select="Supplier/AddressType/text()" />
														</AddressType>
														<Address1>
															<xsl:value-of select="Supplier/Address1/text()" />
														</Address1>
														<Address2>
															<xsl:value-of select="Supplier/Address2/text()" />
														</Address2>
														<AddressOverride>
															<xsl:value-of select="Supplier/AddressOverride/text()" />
														</AddressOverride>
														<AddressShortCode>
															<xsl:value-of select="Supplier/AddressShortCode/text()" />
														</AddressShortCode>
														<City>
															<xsl:value-of select="Supplier/City/text()" />
														</City>
														<CompanyName>
															<xsl:value-of select="Supplier/CompanyName/text()" />
														</CompanyName>
														<Country>
															<Code>
																<xsl:value-of select="Supplier/Country/Code/text()" />
															</Code>
															<Name>
																<xsl:value-of select="Supplier/Country/Name/text()" />
															</Name>
														</Country>
														<Email>
															<xsl:value-of select="Supplier/Email/text()" />
														</Email>
														<Fax>
															<xsl:value-of select="Supplier/Fax/text()" />
														</Fax>
														<GovRegNum>
															<xsl:value-of select="Supplier/GovRegNum/text()" />
														</GovRegNum>
														<GovRegNumType>
															<Code>
																<xsl:value-of select="Supplier/GovRegNumType/Code/text()" />
															</Code>
															<Description>
																<xsl:value-of select="Supplier/GovRegNumType/Description/text()" />
															</Description>
														</GovRegNumType>
														<OrganizationCode>
															<xsl:value-of select="Supplier/OrganizationCode/text()" />
														</OrganizationCode>
														<Phone>
															<xsl:value-of select="Supplier/Phone/text()" />
														</Phone>
														<Port>
															<Code>
																<xsl:value-of select="Supplier/Port/Code/text()" />
															</Code>
															<Name>
																<xsl:value-of select="Supplier/Port/Name/text()" />
															</Name>
														</Port>
														<Postcode>
															<xsl:value-of select="Supplier/Postcode/text()" />
														</Postcode>
														<ScreeningStatus>
															<Code>
																<xsl:value-of select="Supplier/ScreeningStatus/Code/text()" />
															</Code>
															<Description>
																<xsl:value-of select="Supplier/ScreeningStatus/Description/text()" />
															</Description>
														</ScreeningStatus>
														<State>
															<xsl:attribute name="Description">
																<xsl:value-of select="Supplier/State/@Description"/>
															</xsl:attribute>
																<xsl:value-of select="Supplier/State/text()"/>
														</State>
														<RegistrationNumberCollection>
															<xsl:for-each select="Supplier/RegistrationNumberCollection/RegistrationNumber">
																<RegistrationNumber>
																	<Type>
																		<Code>
																			<xsl:value-of select="Type/Code/text()" />
																		</Code>
																		<Description>
																			<xsl:value-of select="Type/Description/text()" />
																		</Description>
																	</Type>
																	<CountryOfIssue>
																		<Code>
																			<xsl:value-of select="CountryOfIssue/Code/text()" />
																		</Code>
																		<Name>
																			<xsl:value-of select="CountryOfIssue/Name/text()" />
																		</Name>
																	</CountryOfIssue>
																	<Value>
																		<xsl:value-of select="Value/text()" />
																	</Value>
																</RegistrationNumber>
															</xsl:for-each>
														</RegistrationNumberCollection>
													</Supplier>
													<ValuationCode>
														<Code>
															<xsl:value-of select="ValuationCode/Code/text()" />
														</Code>
													</ValuationCode>
													<ValuationDateOverride>
														<xsl:value-of select="ValuationDateOverride/text()" />
													</ValuationDateOverride>
													<Volume>
														<xsl:value-of select="Volume/text()" />
													</Volume>
													<VolumeUnit>
														<Code>
															<xsl:value-of select="VolumeUnit/Code/text()" />
														</Code>
													</VolumeUnit>
													<Weight>
														<xsl:value-of select="Weight/text()" />
													</Weight>
													<WeightUnit>
														<Code>
															<xsl:value-of select="WeightUnit/Code/text()" />
														</Code>
														<Description>
															<xsl:value-of select="WeightUnit/Description/text()" />
														</Description>
													</WeightUnit>
													<AddInfoCollection>
														<xsl:for-each select="AddInfoCollection/AddInfo">
															<AddInfo>
																<Key>
																	<xsl:value-of select="Key/text()" />
																</Key>
																<Value>
																	<xsl:value-of select="Value/text()" />
																</Value>
															</AddInfo>
														</xsl:for-each>
													</AddInfoCollection>
													<AddInfoGroupCollection>
													</AddInfoGroupCollection>
													<CommercialChargeCollection>
														<xsl:for-each select="CommercialChargeCollection/CommercialCharge">
															<CommercialCharge>
																<ChargeType>
																	<Code>
																		<xsl:value-of select="ChargeType/Code/text()" />
																	</Code>
																	<Description>
																		<xsl:value-of select="ChargeType/Description/text()" />
																	</Description>
																</ChargeType>
																<AdjustedCharge>
																	<xsl:value-of select="AdjustedCharge/text()" />
																</AdjustedCharge>
																<AgreedExchangeRate>
																	<xsl:value-of select="AgreedExchangeRate/text()" />
																</AgreedExchangeRate>
																<Amount>
																	<xsl:value-of select="Amount/text()" />
																</Amount>
																<ApportionmentType>
																	<Code>
																		<xsl:value-of select="ApportionmentType/Code/text()" />
																	</Code>
																	<Description>
																		<xsl:value-of select="ApportionmentType/Description/text()" />
																	</Description>
																</ApportionmentType>
																<Currency>
																	<Code>
																		<xsl:value-of select="Currency/Code/text()" />
																	</Code>
																</Currency>
																<DistributeBy>
																	<Code>
																		<xsl:value-of select="DistributeBy/Code/text()" />
																	</Code>
																	<Description>
																		<xsl:value-of select="DistributeBy/Description/text()" />
																	</Description>
																</DistributeBy>
																<ExchangeRateType>
																	<Code>
																		<xsl:value-of select="ExchangeRateType/Code/text()" />
																	</Code>
																</ExchangeRateType>
																<IsApportionedCharge>
																	<xsl:value-of select="IsApportionedCharge/text()" />
																</IsApportionedCharge>
																<IsDutiable>
																	<xsl:value-of select="IsDutiable/text()" />
																</IsDutiable>
																<IsGSTApplicable>
																	<xsl:value-of select="IsGSTApplicable/text()" />
																</IsGSTApplicable>
																<IsIncludedInITOT>
																	<xsl:value-of select="IsIncludedInITOT/text()" />
																</IsIncludedInITOT>	
																<IsNotIncludedInInvoice>
																	<xsl:value-of select="IsNotIncludedInInvoice/text()" />
																</IsNotIncludedInInvoice>
																<IsStatisticalValueApplicable>
																	<xsl:value-of select="IsStatisticalValueApplicable/text()" />
																</IsStatisticalValueApplicable>
																<PercentageOfLinePrice>
																	<xsl:value-of select="PercentageOfLinePrice/text()" />
																</PercentageOfLinePrice>
																<PrepaidCollect>
																	<Code>
																		<xsl:value-of select="PrepaidCollect/Code/text()" />
																	</Code>
																	<Description>
																		<xsl:value-of select="PrepaidCollect/Description/text()" />
																	</Description>
																</PrepaidCollect>
															</CommercialCharge>
														</xsl:for-each>
													</CommercialChargeCollection>
													
													<CommercialInvoiceLineCollection>
														<xsl:for-each select="CommercialInvoiceLineCollection/CommercialInvoiceLine">
															<CommercialInvoiceLine>
																<LineNo>
																	<xsl:value-of select="LineNo/text()" />
																</LineNo>
																<BondedWarehouseQuantity>
																	<xsl:value-of select="BondedWarehouseQuantity/text()" />
																</BondedWarehouseQuantity>
																<BondedWarehouseQuantityUnit>
																	<Code>
																		<xsl:value-of select="BondedWarehouseQuantityUnit/Code/text()" />
																	</Code>
																</BondedWarehouseQuantityUnit>
																<BrandName>
																	<xsl:value-of select="BrandName/text()" />
																</BrandName>
																<ClassificationCode>
																	<xsl:value-of select="ClassificationCode/text()" />
																</ClassificationCode>
																<ClassUsageComment>
																	<xsl:value-of select="ClassUsageComment/text()" />
																</ClassUsageComment>
																<Commodity>
																	<Code>
																		<xsl:value-of select="Commodity/Code/text()" />
																	</Code>
																</Commodity>
																<ConcessionOrder>
																	<xsl:value-of select="ConcessionOrder/text()" />
																</ConcessionOrder>
																<ContainerMode>
																	<Code>
																		<xsl:value-of select="ContainerMode/Code/text()" />
																	</Code>
																</ContainerMode>
																<CountryOfExport>
																	<Code>
																		<xsl:value-of select="CountryOfExport/Code/text()" />
																	</Code>
																</CountryOfExport>
																<CountryOfOrigin>
																	<Code>
																		<xsl:value-of select="CountryOfOrigin/Code/text()" />
																	</Code>
																	<Name>
																		<xsl:value-of select="CountryOfOrigin/Name/text()" />
																	</Name>
																</CountryOfOrigin>
																<CustomsQuantity>
																	<xsl:value-of select="CustomsQuantity/text()" />
																</CustomsQuantity>
																<CustomsQuantityUnit>
																	<Code>
																		<xsl:value-of select="CustomsQuantityUnit/Code/text()" />
																	</Code>
																</CustomsQuantityUnit>
																<CustomsSecondQuantity>
																	<xsl:value-of select="CustomsSecondQuantity/text()" />
																</CustomsSecondQuantity>
																<CustomsSecondQuantityUnit>
																	<Code>
																		<xsl:value-of select="CustomsSecondQuantityUnit/Code/text()" />
																	</Code>
																</CustomsSecondQuantityUnit>
																<CustomsThirdQuantity>
																	<xsl:value-of select="CustomsThirdQuantity/text()" />
																</CustomsThirdQuantity>
																<CustomsThirdQuantityUnit>
																	<Code>
																		<xsl:value-of select="CustomsThirdQuantityUnit/Code/text()" />
																	</Code>
																</CustomsThirdQuantityUnit>
																<CustomsValue>
																	<xsl:value-of select="CustomsValue/text()" />
																</CustomsValue>
																<DataImportMatchingKey>
																	<xsl:value-of select="DataImportMatchingKey/text()" />
																</DataImportMatchingKey>
																<Description>
																	<xsl:value-of select="Description/text()" />
																</Description>
																<HarmonisedCode>
																	<xsl:value-of select="HarmonisedCode/text()" />
																</HarmonisedCode>
																<HazardousMaterial>
																	<Code>
																		<xsl:value-of select="HazardousMaterial/Code/text()" />
																	</Code>
																	<CodeType>
																		<Code>
																			<xsl:value-of select="HazardousMaterial/CodeType/Code/text()" />
																		</Code>
																	</CodeType>
																</HazardousMaterial>
																<InvoiceQuantity>
																	<xsl:value-of select="InvoiceQuantity/text()" />
																</InvoiceQuantity>
																<InvoiceQuantityUnit>
																	<Code>
																		<xsl:value-of select="InvoiceQuantityUnit/Code/text()" />
																	</Code>
																	<Description>
																		<xsl:value-of select="InvoiceQuantityUnit/Description/text()" />
																	</Description>
																</InvoiceQuantityUnit>
																<LinePrice>
																	<xsl:value-of select="LinePrice/text()" />
																</LinePrice>
																<Link>
																	<xsl:value-of select="Link/text()" />
																</Link>
																<LocalDescription>
																	<xsl:value-of select="LocalDescription/text()" />
																</LocalDescription>
																<Model>
																	<xsl:value-of select="Model/text()" />
																</Model>
																<NetWeight>
																	<xsl:value-of select="NetWeight/text()" />
																</NetWeight>
																<NetWeightUnit>
																	<Code>
																		<xsl:value-of select="NetWeightUnit/Code/text()" />
																	</Code>
																	<Description>
																		<xsl:value-of select="NetWeightUnit/Description/text()" />
																	</Description>
																</NetWeightUnit>
																<OrderLineLink>
																	<xsl:value-of select="OrderLineLink/text()" />
																</OrderLineLink>
																<OrderNumber>
																	<xsl:value-of select="OrderNumber/text()" />
																</OrderNumber>
																<ParentLineNo>
																	<xsl:value-of select="ParentLineNo/text()" />
																</ParentLineNo>
																<PartNo>
																	<xsl:value-of select="PartNo/text()" />
																</PartNo>
																<PreviousEntryLineNumber>
																	<xsl:value-of select="PreviousEntryLineNumber/text()" />
																</PreviousEntryLineNumber>
																<PreviousEntryNumber>
																	<xsl:value-of select="PreviousEntryNumber/text()" />
																</PreviousEntryNumber>
																<PrimaryPreference>
																	<xsl:value-of select="PrimaryPreference/text()" />
																</PrimaryPreference>
																<Procedure>
																	<xsl:value-of select="Procedure/text()" />
																</Procedure>
																<RelatedIndicator>
																	<Code>
																		<xsl:value-of select="RelatedIndicator/Code/text()" />
																	</Code>
																</RelatedIndicator>
																<SecondaryPreference>
																	<xsl:value-of select="SecondaryPreference/text()" />
																</SecondaryPreference>
																<StateOfOrigin>
																	<Code>
																		<xsl:value-of select="StateOfOrigin/Code/text()" />
																	</Code>
																</StateOfOrigin>
																<TaxType>
																	<Code>
																		<xsl:value-of select="TaxType/Code/text()" />
																	</Code>
																</TaxType>
																<UnitPrice>
																	<xsl:value-of select="UnitPrice/text()" />
																</UnitPrice>
																<ValuationCode>
																	<Code>
																		<xsl:value-of select="ValuationCode/Code/text()" />
																	</Code>
																</ValuationCode>
																<ValuationMarkup>
																	<xsl:value-of select="ValuationMarkup/text()" />
																</ValuationMarkup>
																<Volume>
																	<xsl:value-of select="Volume/text()" />
																</Volume>
																<VolumeUnit>
																	<Code>
																		<xsl:value-of select="VolumeUnit/Code/text()" />
																	</Code>
																	<Description>
																		<xsl:value-of select="VolumeUnit/Description/text()" />
																	</Description>
																</VolumeUnit>
																<Weight>
																	<xsl:value-of select="Weight/text()" />
																</Weight>
																<WeightUnit>
																	<Code>
																		<xsl:value-of select="WeightUnit/Code/text()" />
																	</Code>
																	<Description>
																		<xsl:value-of select="WeightUnit/Description/text()" />
																	</Description>
																</WeightUnit>
																<AddInfoCollection>
																	<xsl:for-each select="AddInfoCollection/AddInfo">
																		<AddInfo>
																			<Key>
																				<xsl:value-of select="Key/text()" />
																			</Key>
																			<Value>
																				<xsl:value-of select="Value/text()" />
																			</Value>
																		</AddInfo>
																	</xsl:for-each>
																</AddInfoCollection>
																 <AddInfoGroupCollection>
																</AddInfoGroupCollection>
																
															</CommercialInvoiceLine>
														</xsl:for-each>
													</CommercialInvoiceLineCollection>
												</CommercialInvoice>
											</xsl:for-each>		
									</CommercialInvoiceCollection>
								</CommercialInfo>
								<CommunityTransitStatus>
									<Code>
										<xsl:value-of select="CommunityTransitStatus/Code/text()" />
									</Code>
								</CommunityTransitStatus>
								<ConsolidatedCargoStatus>
									<Code>
										<xsl:value-of select="ConsolidatedCargoStatus/Code/text()" />
									</Code>
								</ConsolidatedCargoStatus>
								<ContainerCount>
									<xsl:value-of select="ContainerCount/text()" />
								</ContainerCount>
								<ContainerMode>
									<Code>
										<xsl:value-of select="ContainerMode/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="ContainerMode/Description/text()" />
									</Description>
								</ContainerMode>
								<CustomsBroker>
									<Code>
										<xsl:value-of select="CustomsBroker/Code/text()" />
									</Code>
									<Name>
										<xsl:value-of select="CustomsBroker/Name/text()" />
									</Name>
								</CustomsBroker>
								<CustomsContainerMode>
									<Code>
										<xsl:value-of select="CustomsContainerMode/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="CustomsContainerMode/Description/text()" />
									</Description>
								</CustomsContainerMode>
								<CustomsOffice>
									<Code>
										<xsl:value-of select="CustomsOffice/Code/text()" />
									</Code>
								</CustomsOffice>
								<CustomsProfileIdentifier>
									<Type>
										<xsl:value-of select="CustomsProfileIdentifier/Type/text()" />
									</Type>
									<Value>
										<xsl:value-of select="CustomsProfileIdentifier/Value/text()" />
									</Value>
								</CustomsProfileIdentifier>
								<CustomsValuationPort>
									<Code>
										<xsl:value-of select="CustomsValuationPort/Code/text()" />
									</Code>
								</CustomsValuationPort>
								<DeclarantType>
									<Code>
										<xsl:value-of select="DeclarantType/Code/text()" />
									</Code>
								</DeclarantType>
								<DefermentAccountNumber>
									<xsl:value-of select="DefermentAccountNumber/text()" />
								</DefermentAccountNumber>
								<DocumentedChargeable>
									<xsl:value-of select="DocumentedChargeable/text()" />
								</DocumentedChargeable>
								<DocumentedVolume>
									<xsl:value-of select="DocumentedVolume/text()" />
								</DocumentedVolume>
								<DocumentedWeight>
									<xsl:value-of select="DocumentedWeight/text()" />
								</DocumentedWeight>
								<EFTMode>
									<Code>
										<xsl:value-of select="EFTMode/Code/text()" />
									</Code>
								</EFTMode>
								<EntryStatus>
									<Code>
										<xsl:value-of select="EntryStatus/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="EntryStatus/Description/text()" />
									</Description>
								</EntryStatus>
								<ExportGoodsType>
									<Code>
										<xsl:value-of select="ExportGoodsType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="ExportGoodsType/Description/text()" />
									</Description>
								</ExportGoodsType>
								<Folio>
									<xsl:value-of select="Folio/text()" />
								</Folio>
								<FreightRate>
									<xsl:value-of select="FreightRate/text()" />
								</FreightRate>
								<FreightRateCurrency>
									<Code>
										<xsl:value-of select="FreightRateCurrency/Code/text()" />
									</Code>
								</FreightRateCurrency>
								<GoodsDescription>
									<xsl:value-of select="GoodsDescription/text()" />
								</GoodsDescription>
								<GoodsOrigin>
									<Code>
										<xsl:value-of select="GoodsOrigin/Code/text()" />
									</Code>
								</GoodsOrigin>
								<GoodsValue>
									<xsl:value-of select="GoodsValue/text()" />
								</GoodsValue>
								<GoodsValueCurrency>
									<Code>
										<xsl:value-of select="GoodsValueCurrency/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="GoodsValueCurrency/Description/text()" />
									</Description>
								</GoodsValueCurrency>
								<HBLAWBChargesDisplay>
									<Code>
										<xsl:value-of select="HBLAWBChargesDisplay/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="HBLAWBChargesDisplay/Description/text()" />
									</Description>
								</HBLAWBChargesDisplay>
								<HBLContainerPackModeOverride>
									<xsl:value-of select="HBLContainerPackModeOverride/text()" />
								</HBLContainerPackModeOverride>
								<HouseBillOfLadingType>
									<Code>
										<xsl:value-of select="HouseBillOfLadingType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="HouseBillOfLadingType/Description/text()" />
									</Description>
								</HouseBillOfLadingType>
								<InsuranceValue>
									<xsl:value-of select="InsuranceValue/text()" />
								</InsuranceValue>
								<InsuranceValueCurrency>
									<Code>
										<xsl:value-of select="InsuranceValueCurrency/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="InsuranceValueCurrency/Description/text()" />
									</Description>
								</InsuranceValueCurrency>
								<InterimReceiptNumber>
									<xsl:value-of select="InterimReceiptNumber/text()" />
								</InterimReceiptNumber>
								<IsBooking>
									<xsl:value-of select="IsBooking/text()" />
								</IsBooking>
								<IsCancelled>
									<xsl:value-of select="IsCancelled/text()" />
								</IsCancelled>
								<IsCFSRegistered>
									<xsl:value-of select="IsCFSRegistered/text()" />
								</IsCFSRegistered>
								<IsDirectBooking>
									<xsl:value-of select="IsDirectBooking/text()" />
								</IsDirectBooking>
								<IsForwardRegistered>
									<xsl:value-of select="IsForwardRegistered/text()" />
								</IsForwardRegistered>
								<IsHighRisk>
									<xsl:value-of select="IsHighRisk/text()" />
								</IsHighRisk>
								<IsNeutralMaster>
									<xsl:value-of select="IsNeutralMaster/text()" />
								</IsNeutralMaster>
								<IsPersonalEffects>
									<xsl:value-of select="IsPersonalEffects/text()" />
								</IsPersonalEffects>
								<IsShipping>
									<xsl:value-of select="IsShipping/text()" />
								</IsShipping>
								<IsSplitShipment>
									<xsl:value-of select="IsSplitShipment/text()" />
								</IsSplitShipment>
								<LloydsIMO>
									<xsl:value-of select="LloydsIMO/text()" />
								</LloydsIMO>
								<LocationAtClearance>
									<Code>
										<xsl:value-of select="LocationAtClearance/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="LocationAtClearance/Description/text()" />
									</Description>
								</LocationAtClearance>
								<ManifestedChargeable>
									<xsl:value-of select="ManifestedChargeable/text()" />
								</ManifestedChargeable>
								<ManifestedVolume>
									<xsl:value-of select="ManifestedVolume/text()" />
								</ManifestedVolume>
								<ManifestedWeight>
									<xsl:value-of select="ManifestedWeight/text()" />
								</ManifestedWeight>
								<MergeBy>
									<Code>
										<xsl:value-of select="MergeBy/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="MergeBy/Description/text()" />
									</Description>
								</MergeBy>
								<MessageStatus>
									<Code>
										<xsl:value-of select="MessageStatus/Code/text()" />
									</Code>
								</MessageStatus>
								<MessageSubType>
									<Code>
										<xsl:value-of select="MessageSubType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="MessageSubType/Description/text()" />
									</Description>
								</MessageSubType>
								<MessageType>
									<Code>
										<xsl:value-of select="MessageType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="MessageType/Description/text()" />
									</Description>
								</MessageType>
								<NoCopyBills>
									<xsl:value-of select="NoCopyBills/text()" />
								</NoCopyBills>
								<NoOriginalBills>
									<xsl:value-of select="NoOriginalBills/text()" />
								</NoOriginalBills>
								<OperationalStatus>
									<Code>
										<xsl:value-of select="OperationalStatus/Code/text()" />
									</Code>
								</OperationalStatus>
								<OuterPacks>
									<xsl:value-of select="OuterPacks/text()" />
								</OuterPacks>
								<OuterPacksPackageType>
									<Code>
										<xsl:value-of select="OuterPacksPackageType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="OuterPacksPackageType/Description/text()" />
									</Description>
								</OuterPacksPackageType>
								<OwnerRef>
									<xsl:value-of select="OwnerRef/text()" />
								</OwnerRef>
								<PackingOrder>
									<xsl:value-of select="PackingOrder/text()" />
								</PackingOrder>
								<PaidBy>
									<Code>
										<xsl:value-of select="PaidBy/Code/text()" />
									</Code>
								</PaidBy>
								<PaymentMethod>
									<Code>
										<xsl:value-of select="PaymentMethod/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="PaymentMethod/Description/text()" />
									</Description>
								</PaymentMethod>
								<PortOfDestination>
									<Code>
										<xsl:value-of select="PortOfDestination/Code/text()" />
									</Code>
									<Name>
										<xsl:value-of select="PortOfDestination/Name/text()" />
									</Name>
								</PortOfDestination>
								<PortOfDischarge>
									<Code>
										<xsl:value-of select="PortOfDischarge/Code/text()" />
									</Code>
									<Name>
										<xsl:value-of select="PortOfDischarge/Name/text()" />
									</Name>
								</PortOfDischarge>
								<PortOfFirstArrival>
									<Code>
										<xsl:value-of select="PortOfFirstArrival/Code/text()" />
									</Code>
								</PortOfFirstArrival>
								<PortOfLoading>
									<Code>
										<xsl:value-of select="PortOfLoading/Code/text()" />
									</Code>
									<Name>
										<xsl:value-of select="PortOfLoading/Name/text()" />
									</Name>
								</PortOfLoading>
								<PortOfOrigin>
									<Code>
										<xsl:value-of select="PortOfOrigin/Code/text()" />
									</Code>
									<Name>
										<xsl:value-of select="PortOfOrigin/Name/text()" />
									</Name>
								</PortOfOrigin>
								<ReleaseType>
									<Code>
										<xsl:value-of select="ReleaseType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="ReleaseType/Description/text()" />
									</Description>
								</ReleaseType>
								<ScreeningStatus>
									<Code>
										<xsl:value-of select="ScreeningStatus/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="ScreeningStatus/Description/text()" />
									</Description>
								</ScreeningStatus>
								<ServiceLevel>
									<Code>
										<xsl:value-of select="ServiceLevel/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="ServiceLevel/Description/text()" />
									</Description>
								</ServiceLevel>
								<ShipmentIncoTerm>
									<Code>
										<xsl:value-of select="ShipmentIncoTerm/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="ShipmentIncoTerm/Description/text()" />
									</Description>
								</ShipmentIncoTerm>
								<ShipmentType>
									<Code>
										<xsl:value-of select="ShipmentType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="ShipmentType/Description/text()" />
									</Description>
								</ShipmentType>
								<ShippedOnBoard>
									<Code>
										<xsl:value-of select="ShippedOnBoard/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="ShippedOnBoard/Description/text()" />
									</Description>
								</ShippedOnBoard>
								<ShipperCODAmount>
									<xsl:value-of select="ShipperCODAmount/text()" />
								</ShipperCODAmount>
								<ShipperCODPayMethod>
									<Code>
										<xsl:value-of select="ShipperCODPayMethod/Code/text()" />
									</Code>
								</ShipperCODPayMethod>
								<SubLocationAtClearance>
									<Code>
										<xsl:value-of select="SubLocationAtClearance/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="SubLocationAtClearance/Description/text()" />
									</Description>
								</SubLocationAtClearance>
								<TotalNoOfPacks>
									<xsl:value-of select="TotalNoOfPacks/text()" />
								</TotalNoOfPacks>
								<TotalNoOfPacksDecimal>
									<xsl:value-of select="TotalNoOfPacksDecimal/text()" />
								</TotalNoOfPacksDecimal>
								<TotalNoOfPacksPackageType>
									<Code>
										<xsl:value-of select="TotalNoOfPacksPackageType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="TotalNoOfPacksPackageType/Description/text()" />
									</Description>
								</TotalNoOfPacksPackageType>
								<TotalNoOfPieces>
									<xsl:value-of select="TotalNoOfPieces/text()" />
								</TotalNoOfPieces>
								<TotalNoOfPiecesLanded>
									<xsl:value-of select="TotalNoOfPiecesLanded/text()" />
								</TotalNoOfPiecesLanded>
								<TotalVolume>
									<xsl:value-of select="TotalVolume/text()" />
								</TotalVolume>
								<TotalVolumeUnit>
									<Code>
										<xsl:value-of select="TotalVolumeUnit/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="TotalVolumeUnit/Description/text()" />
									</Description>
								</TotalVolumeUnit>
								<TotalWeight>
									<xsl:value-of select="TotalWeight/text()" />
								</TotalWeight>
								<TotalWeightUnit>
									<Code>
										<xsl:value-of select="TotalWeightUnit/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="TotalWeightUnit/Description/text()" />
									</Description>
								</TotalWeightUnit>
								<TranshipToOtherCFS>
									<xsl:value-of select="TranshipToOtherCFS/text()" />
								</TranshipToOtherCFS>
								<TransportMode>
									<Code>
										<xsl:value-of select="TransportMode/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="TransportMode/Description/text()" />
									</Description>
								</TransportMode>
								<TransportNationality>
									<Code>
										<xsl:value-of select="TransportNationality/Code/text()" />
									</Code>
									<Name>
										<xsl:value-of select="TransportNationality/Name/text()" />
									</Name>
								</TransportNationality>
								<VesselName>
									<xsl:value-of select="VesselName/text()" />
								</VesselName>
								<VoyageFlightNo>
									<xsl:value-of select="VoyageFlightNo/text()" />
								</VoyageFlightNo>
								<WarehouseLocation>
									<xsl:value-of select="WarehouseLocation/text()" />
								</WarehouseLocation>
								<WarehouseReleaseStatus>
									<Code>
										<xsl:value-of select="WarehouseReleaseStatus/Code/text()" />
									</Code>
								</WarehouseReleaseStatus>
								<WayBillNumber>
									<xsl:value-of select="WayBillNumber/text()" />
								</WayBillNumber>
								<WayBillType>
									<Code>
										<xsl:value-of select="WayBillType/Code/text()" />
									</Code>
									<Description>
										<xsl:value-of select="WayBillType/Description/text()" />
									</Description>
								</WayBillType>
								<LocalProcessing>
									<ArrivalCartageRef>
										<xsl:value-of select="LocalProcessing/ArrivalCartageRef/text()" />
									</ArrivalCartageRef>
									<DeliveryCartageAdvised>
										<xsl:value-of select="LocalProcessing/DeliveryCartageAdvised/text()" />
									</DeliveryCartageAdvised>
									<DeliveryCartageCompleted>
										<xsl:value-of select="LocalProcessing/DeliveryCartageCompleted/text()" />
									</DeliveryCartageCompleted>
									<DeliveryLabourCharge>
										<xsl:value-of select="LocalProcessing/DeliveryLabourCharge/text()" />
									</DeliveryLabourCharge>
									<DeliveryLabourTime>
										<xsl:value-of select="LocalProcessing/DeliveryLabourTime/text()" />
									</DeliveryLabourTime>
									<DeliveryRequiredBy>
										<xsl:value-of select="LocalProcessing/DeliveryRequiredBy/text()" />
									</DeliveryRequiredBy>
									<DeliveryRequiredFrom>
										<xsl:value-of select="LocalProcessing/DeliveryRequiredFrom/text()" />
									</DeliveryRequiredFrom>
									<DeliveryTruckWaitCharge>
										<xsl:value-of select="LocalProcessing/DeliveryTruckWaitCharge/text()" />
									</DeliveryTruckWaitCharge>
									<DeliveryTruckWaitTime>
										<xsl:value-of select="LocalProcessing/DeliveryTruckWaitTime/text()" />
									</DeliveryTruckWaitTime>
									<DemurrageOnDeliveryCharge>
										<xsl:value-of select="LocalProcessing/DemurrageOnDeliveryCharge/text()" />
									</DemurrageOnDeliveryCharge>
									<DemurrageOnDeliveryTime>
										<xsl:value-of select="LocalProcessing/DemurrageOnDeliveryTime/text()" />
									</DemurrageOnDeliveryTime>
									<DemurrageOnPickupCharge>
										<xsl:value-of select="LocalProcessing/DemurrageOnPickupCharge/text()" />
									</DemurrageOnPickupCharge>
									<DemurrageOnPickupTime>
										<xsl:value-of select="LocalProcessing/DemurrageOnPickupTime/text()" />
									</DemurrageOnPickupTime>
									<EstimatedDelivery>
										<xsl:value-of select="LocalProcessing/EstimatedDelivery/text()" />
									</EstimatedDelivery>
									<EstimatedPickup>
										<xsl:value-of select="LocalProcessing/EstimatedPickup/text()" />
									</EstimatedPickup>
									<ExportStatement>
										<Code>
											<xsl:value-of select="LocalProcessing/ExportStatement/Code/text()" />
										</Code>
									</ExportStatement>
									<FCLAvailable>
										<xsl:value-of select="LocalProcessing/FCLAvailable/text()" />
									</FCLAvailable>
									<FCLDeliveryDetentionCharge>
										<xsl:value-of select="LocalProcessing/FCLDeliveryDetentionCharge/text()" />
									</FCLDeliveryDetentionCharge>
									<FCLDeliveryDetentionDays>
										<xsl:value-of select="LocalProcessing/FCLDeliveryDetentionDays/text()" />
									</FCLDeliveryDetentionDays>
									<FCLDeliveryDetentionFreeDays>
										<xsl:value-of select="LocalProcessing/FCLDeliveryDetentionFreeDays/text()" />
									</FCLDeliveryDetentionFreeDays>
									<FCLDeliveryEquipmentNeeded>
										<Code>
											<xsl:value-of select="LocalProcessing/FCLDeliveryEquipmentNeeded/Code/text()" />
										</Code>
										<Description>
											<xsl:value-of select="LocalProcessing/FCLDeliveryEquipmentNeeded/Description/text()" />
										</Description>
									</FCLDeliveryEquipmentNeeded>
									<FCLPickupDetentionCharge>
										<xsl:value-of select="LocalProcessing/FCLPickupDetentionCharge/text()" />
									</FCLPickupDetentionCharge>
									<FCLPickupDetentionDays>
										<xsl:value-of select="LocalProcessing/FCLPickupDetentionDays/text()" />
									</FCLPickupDetentionDays>
									<FCLPickupDetentionFreeDays>
										<xsl:value-of select="LocalProcessing/FCLPickupDetentionFreeDays/text()" />
									</FCLPickupDetentionFreeDays>
									<FCLPickupEquipmentNeeded>
										<Code>
											<xsl:value-of select="LocalProcessing/FCLPickupEquipmentNeeded/Code/text()" />
										</Code>
										<Description>
											<xsl:value-of select="LocalProcessing/FCLPickupEquipmentNeeded/Description/text()" />
										</Description>
									</FCLPickupEquipmentNeeded>
									<FCLStorageCommences>
										<xsl:value-of select="LocalProcessing/FCLStorageCommences/text()" />
									</FCLStorageCommences>
									<HasProhibitedPackaging>
										<xsl:value-of select="LocalProcessing/HasProhibitedPackaging/text()" />
									</HasProhibitedPackaging>
									<InsuranceRequired>
										<xsl:value-of select="LocalProcessing/InsuranceRequired/text()" />
									</InsuranceRequired>
									<IsContingencyRelease>
										<xsl:value-of select="LocalProcessing/IsContingencyRelease/text()" />
									</IsContingencyRelease>
									<LCLAirStorageCharge>
										<xsl:value-of select="LocalProcessing/LCLAirStorageCharge/text()" />
									</LCLAirStorageCharge>
									<LCLAirStorageDaysOrHours>
										<xsl:value-of select="LocalProcessing/LCLAirStorageDaysOrHours/text()" />
									</LCLAirStorageDaysOrHours>
									<LCLAvailable>
										<xsl:value-of select="LocalProcessing/LCLAvailable/text()" />
									</LCLAvailable>
									<LCLDatesOverrideConsol>
										<xsl:value-of select="LocalProcessing/LCLDatesOverrideConsol/text()" />
									</LCLDatesOverrideConsol>
									<LCLStorageCommences>
										<xsl:value-of select="LocalProcessing/LCLStorageCommences/text()" />
									</LCLStorageCommences>
									<PickupCartageAdvised>
										<xsl:value-of select="LocalProcessing/PickupCartageAdvised/text()" />
									</PickupCartageAdvised>
									<PickupCartageCompleted>
										<xsl:value-of select="LocalProcessing/PickupCartageCompleted/text()" />
									</PickupCartageCompleted>
									<PickupLabourCharge>
										<xsl:value-of select="LocalProcessing/PickupLabourCharge/text()" />
									</PickupLabourCharge>
									<PickupLabourTime>
										<xsl:value-of select="LocalProcessing/PickupLabourTime/text()" />
									</PickupLabourTime>
									<PickupRequiredBy>
										<xsl:value-of select="LocalProcessing/PickupRequiredBy/text()" />
									</PickupRequiredBy>
									<PickupRequiredFrom>
										<xsl:value-of select="LocalProcessing/PickupRequiredFrom/text()" />
									</PickupRequiredFrom>
									<PickupTruckWaitCharge>
										<xsl:value-of select="LocalProcessing/PickupTruckWaitCharge/text()" />
									</PickupTruckWaitCharge>
									<PickupTruckWaitTime>
										<xsl:value-of select="LocalProcessing/PickupTruckWaitTime/text()" />
									</PickupTruckWaitTime>
									<PrintOptionForPackagesOnAWB>
										<Code>
											<xsl:value-of select="LocalProcessing/PrintOptionForPackagesOnAWB/Code/text()" />
										</Code>
										<Description>
											<xsl:value-of select="LocalProcessing/PrintOptionForPackagesOnAWB/Description/text()" />
										</Description>
									</PrintOptionForPackagesOnAWB>
								</LocalProcessing>
								<AddInfoCollection>
									<xsl:for-each select="AddInfoCollection/AddInfo">
										<AddInfo>
											<Key>
												<xsl:value-of select="Key/text()" />
											</Key>
											<Value>
												<xsl:value-of select="Value/text()" />
											</Value>
										</AddInfo>
									</xsl:for-each>
								</AddInfoCollection>
								<AdditionalBillCollection>
									<xsl:for-each select="AdditionalBillCollection/AdditionalBill">
										<AdditionalBill>
											<BillNumber>
												<xsl:value-of select="BillNumber/text()" />
											</BillNumber>
											<BillType>
												<Code>
													<xsl:value-of select="BillType/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="BillType/Description/text()" />
												</Description>
											</BillType>
											<IssueDate>
												<xsl:value-of select="IssueDate/text()" />
											</IssueDate>
											<MessageStatus>
												<Code>
													<xsl:value-of select="MessageStatus/Code/text()" />
												</Code>
											</MessageStatus>
											<NoOfPacks>
												<xsl:value-of select="NoOfPacks/text()" />
											</NoOfPacks>
											<PackType>
												<Code>
													<xsl:value-of select="PackType/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="PackType/Description/text()" />
												</Description>
											</PackType>
											<ParentBillNumber>
												<xsl:value-of select="ParentBillNumber/text()" />
											</ParentBillNumber>
										</AdditionalBill>
									</xsl:for-each>
								</AdditionalBillCollection>
								<AdditionalReferenceCollection>
								</AdditionalReferenceCollection>
								<ContainerCollection>
									<xsl:attribute name="Content">
										<xsl:value-of select="ContainerCollection/@Content"/>
									</xsl:attribute>
									<xsl:for-each select="ContainerCollection/Container">
										<Container>
											<AirVentFlow>
												<xsl:value-of select="AirVentFlow/text()" />
											</AirVentFlow>
											<AirVentFlowRateUnit>
												<Code>
													<xsl:value-of select="PackType/Code/text()" />
												</Code>
											</AirVentFlowRateUnit>
											<ArrivalCartageAdvised>
												<xsl:value-of select="ArrivalCartageAdvised/text()" />
											</ArrivalCartageAdvised>
											<ArrivalCartageComplete>
												<xsl:value-of select="ArrivalCartageComplete/text()" />
											</ArrivalCartageComplete>
											<ArrivalCartageDemurrageTime>
												<xsl:value-of select="ArrivalCartageDemurrageTime/text()" />
											</ArrivalCartageDemurrageTime>
											<ArrivalCartageRef>
												<xsl:value-of select="ArrivalCartageRef/text()" />
											</ArrivalCartageRef>
											<ArrivalCTOStorageStartDate>
												<xsl:value-of select="ArrivalCTOStorageStartDate/text()" />
											</ArrivalCTOStorageStartDate>
											<ArrivalDeliveryRequiredBy>
												<xsl:value-of select="ArrivalDeliveryRequiredBy/text()" />
											</ArrivalDeliveryRequiredBy>
											<ArrivalEstimatedDelivery>
												<xsl:value-of select="ArrivalEstimatedDelivery/text()" />
											</ArrivalEstimatedDelivery>
											<ArrivalPickupByRail>
												<xsl:value-of select="ArrivalPickupByRail/text()" />
											</ArrivalPickupByRail>
											<ArrivalSlotDateTime>
												<xsl:value-of select="ArrivalSlotDateTime/text()" />
											</ArrivalSlotDateTime>
											<ArrivalSlotReference>
												<xsl:value-of select="ArrivalSlotReference/text()" />
											</ArrivalSlotReference>
											<ArrivalTruckWaitTime>
												<xsl:value-of select="ArrivalTruckWaitTime/text()" />
											</ArrivalTruckWaitTime>
											<Commodity>
												<Code>
													<xsl:value-of select="Commodity/Code/text()" />
												</Code>
											</Commodity>
											<ContainerCount>
												<xsl:value-of select="ContainerCount/text()" />
											</ContainerCount>
											<ContainerImportDORelease>
												<xsl:value-of select="ContainerImportDORelease/text()" />
											</ContainerImportDORelease>
											<ContainerNumber>
												<xsl:value-of select="ContainerNumber/text()" />
											</ContainerNumber>
											<ContainerParkEmptyPickupGateOut>
												<xsl:value-of select="ContainerParkEmptyPickupGateOut/text()" />
											</ContainerParkEmptyPickupGateOut>
											<ContainerParkEmptyReturnGateIn>
												<xsl:value-of select="ContainerParkEmptyReturnGateIn/text()" />
											</ContainerParkEmptyReturnGateIn>
											<ContainerQuality>
												<Code>
													<xsl:value-of select="ContainerQuality/Code/text()" />
												</Code>
											</ContainerQuality>
											<ContainerStatus>
												<Code>
													<xsl:value-of select="ContainerStatus/Code/text()" />
												</Code>
											</ContainerStatus>
											<ContainerType>
												<Code>
													<xsl:value-of select="ContainerType/Code/text()" />
												</Code>
												<Category>
													<Code>
														<xsl:value-of select="ContainerType/Category/Code/text()" />
													</Code>
													<Description>
															<xsl:value-of select="ContainerType/Category/Description/text()" />
													</Description>
												</Category>
												<Description>
													<xsl:value-of select="ContainerType/Description/text()" />
												</Description>
												<ISOCode>
													<xsl:value-of select="ContainerType/ISOCode/text()" />
												</ISOCode>
											</ContainerType>
											<DeliveryMode>
												<xsl:value-of select="DeliveryMode/text()" />
											</DeliveryMode>
											<DeliverySequence>
												<xsl:value-of select="DeliverySequence/text()" />
											</DeliverySequence>
											<DepartureCartageAdvised>
												<xsl:value-of select="DepartureCartageAdvised/text()" />
											</DepartureCartageAdvised>
											<DepartureCartageComplete>
												<xsl:value-of select="DepartureCartageAdvised/text()" />
											</DepartureCartageComplete>
											<DepartureCartageDemurrageTime>
												<xsl:value-of select="DepartureCartageDemurrageTime/text()" />
											</DepartureCartageDemurrageTime>
											<DepartureCartageRef>
												<xsl:value-of select="DepartureCartageRef/text()" />
											</DepartureCartageRef>
											<DepartureDeliveryByRail>
												<xsl:value-of select="DepartureDeliveryByRail/text()" />
											</DepartureDeliveryByRail>
											<DepartureDockReceipt>
												<xsl:value-of select="DepartureDockReceipt/text()" />
											</DepartureDockReceipt>
											<DepartureEstimatedPickup>
												<xsl:value-of select="DepartureEstimatedPickup/text()" />
											</DepartureEstimatedPickup>
											<DepartureSlotDateTime>
												<xsl:value-of select="DepartureSlotDateTime/text()" />
											</DepartureSlotDateTime>
											<DepartureSlotReference>
												<xsl:value-of select="DepartureSlotReference/text()" />
											</DepartureSlotReference>
											<DepartureTruckWaitTime>
												<xsl:value-of select="DepartureTruckWaitTime/text()" />
											</DepartureTruckWaitTime>
											<DunnageWeight>
												<xsl:value-of select="DunnageWeight/text()" />
											</DunnageWeight>
											<EmptyReadyForReturn>
												<xsl:value-of select="EmptyReadyForReturn/text()" />
											</EmptyReadyForReturn>
											<EmptyRequired>
												<xsl:value-of select="EmptyRequired/text()" />
											</EmptyRequired>
											<EmptyReturnedBy>
												<xsl:value-of select="EmptyReturnedBy/text()" />
											</EmptyReturnedBy>
											<EmptyReturnRef>
												<xsl:value-of select="EmptyReturnRef/text()" />
											</EmptyReturnRef>
											<ExportDepotCustomsReference>
												<xsl:value-of select="ExportDepotCustomsReference/text()" />
											</ExportDepotCustomsReference>
											<FCL_LCL_AIR>
												<Code>
													<xsl:value-of select="FCL_LCL_AIR/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="FCL_LCL_AIR/Description/text()" />
												</Description>
											</FCL_LCL_AIR>
											<FCLAvailable>
												<xsl:value-of select="FCLAvailable/text()" />
											</FCLAvailable>
											<FCLHeldInTransitStaging>
												<xsl:value-of select="FCLHeldInTransitStaging/text()" />
											</FCLHeldInTransitStaging>
											<FCLOnBoardVessel>
												<xsl:value-of select="FCLOnBoardVessel/text()" />
											</FCLOnBoardVessel>
											<FCLStorageArrivedUnderbond>
												<xsl:value-of select="FCLStorageArrivedUnderbond/text()" />
											</FCLStorageArrivedUnderbond>
											<FCLStorageCommences>
												<xsl:value-of select="FCLStorageCommences/text()" />
											</FCLStorageCommences>
											<FCLStorageModuleOnlyMaster>
												<xsl:value-of select="FCLStorageModuleOnlyMaster/text()" />
											</FCLStorageModuleOnlyMaster>
											<FCLStorageUnderbondCleared>
												<xsl:value-of select="FCLStorageUnderbondCleared/text()" />
											</FCLStorageUnderbondCleared>
											<FCLUnloadFromVessel>
												<xsl:value-of select="FCLUnloadFromVessel/text()" />
											</FCLUnloadFromVessel>
											<FCLWharfGateIn>
												<xsl:value-of select="FCLWharfGateIn/text()" />
											</FCLWharfGateIn>
											<FCLWharfGateOut>
												<xsl:value-of select="FCLWharfGateOut/text()" />
											</FCLWharfGateOut>
											<GoodsValue>
												<xsl:value-of select="GoodsValue/text()" />
											</GoodsValue>
											<GoodsValueCurrency>
												<Code>
													<xsl:value-of select="GoodsValueCurrency/Code/text()" />
												</Code>
											</GoodsValueCurrency>
											<GoodsWeight>
												<xsl:value-of select="GoodsWeight/text()" />
											</GoodsWeight>
											<GrossWeight>
												<xsl:value-of select="GrossWeight/text()" />
											</GrossWeight>
											<GrossWeightVerificationType>
												<Code>
													<xsl:value-of select="GrossWeightVerificationType/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="GrossWeightVerificationType/Description/text()" />
												</Description>
											</GrossWeightVerificationType>
											<HumidityPercent>
												<xsl:value-of select="HumidityPercent/text()" />
											</HumidityPercent>
											<ImportDepotCustomsReference>
												<xsl:value-of select="ImportDepotCustomsReference/text()" />
											</ImportDepotCustomsReference>
											<IsCFSRegistered>
												<xsl:value-of select="IsCFSRegistered/text()" />
											</IsCFSRegistered>
											<IsControlledAtmosphere>
												<xsl:value-of select="IsControlledAtmosphere/text()" />
											</IsControlledAtmosphere>
											<IsDamaged>
												<xsl:value-of select="IsDamaged/text()" />
											</IsDamaged>
											<IsEmptyContainer>
												<xsl:value-of select="IsEmptyContainer/text()" />
											</IsEmptyContainer>
											<IsSealOk>
												<xsl:value-of select="IsSealOk/text()" />
											</IsSealOk>
											<IsShipperOwned>
												<xsl:value-of select="IsShipperOwned/text()" />
											</IsShipperOwned>
											<LCLAvailable>
												<xsl:value-of select="LCLAvailable/text()" />
											</LCLAvailable>
											<LCLStorageCommences>
												<xsl:value-of select="LCLStorageCommences/text()" />
											</LCLStorageCommences>
											<LCLUnpack>
												<xsl:value-of select="LCLUnpack/text()" />
											</LCLUnpack>
											<LengthUnit>
												<Code>
													<xsl:value-of select="LengthUnit/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="LengthUnit/Description/text()" />
												</Description>
											</LengthUnit>
											<OverhangBack>
												<xsl:value-of select="OverhangBack/text()" />
											</OverhangBack>
											<OverhangFront>
												<xsl:value-of select="OverhangFront/text()" />
											</OverhangFront>
											<OverhangHeight>
												<xsl:value-of select="OverhangHeight/text()" />
											</OverhangHeight>
											<OverhangLeft>
												<xsl:value-of select="OverhangLeft/text()" />
											</OverhangLeft>
											<OverhangRight>
												<xsl:value-of select="OverhangRight/text()" />
											</OverhangRight>
											<OverrideFCLAvailableStorage>
												<xsl:value-of select="OverrideFCLAvailableStorage/text()" />
											</OverrideFCLAvailableStorage>
											<OverrideLCLAvailableStorage>
												<xsl:value-of select="OverrideLCLAvailableStorage/text()" />
											</OverrideLCLAvailableStorage>
											<PackDate>
												<xsl:value-of select="PackDate/text()" />
											</PackDate>
											<RefrigGeneratorID>
												<xsl:value-of select="RefrigGeneratorID/text()" />
											</RefrigGeneratorID>
											<ReleaseNum>
												<xsl:value-of select="ReleaseNum/text()" />
											</ReleaseNum>
											<Seal>
												<xsl:value-of select="Seal/text()" />
											</Seal>
											<SealPartyType>
												<Code>
													<xsl:value-of select="SealPartyType/Code/text()" />
												</Code>
											</SealPartyType>
											<SecondSeal>
												<xsl:value-of select="SecondSeal/text()" />
											</SecondSeal>
											<SecondSealPartyType>
												<Code>
													<xsl:value-of select="SecondSealPartyType/Code/text()" />
												</Code>
											</SecondSealPartyType>
											<SetPointTemp>
												<xsl:value-of select="SetPointTemp/text()" />
											</SetPointTemp>
											<SetPointTempUnit>
												<xsl:value-of select="SetPointTempUnit/text()" />
											</SetPointTempUnit>
											<StowagePosition>
												<xsl:value-of select="StowagePosition/text()" />
											</StowagePosition>
											<TareWeight>
												<xsl:value-of select="TareWeight/text()" />
											</TareWeight>
											<TempRecorderSerialNo>
												<xsl:value-of select="TempRecorderSerialNo/text()" />
											</TempRecorderSerialNo>
											<ThirdSeal>
												<xsl:value-of select="ThirdSeal/text()" />
											</ThirdSeal>
											<ThirdSealPartyType>
												<Code>
													<xsl:value-of select="ThirdSealPartyType/Code/text()" />
												</Code>
											</ThirdSealPartyType>
											<TotalHeight>
												<xsl:value-of select="TotalHeight/text()" />
											</TotalHeight>
											<TotalWidth>
												<xsl:value-of select="TotalWidth/text()" />
											</TotalWidth>
											<TrainWagonNumber>
												<xsl:value-of select="TrainWagonNumber/text()" />
											</TrainWagonNumber>
											<UnpackGang>
												<xsl:value-of select="UnpackGang/text()" />
											</UnpackGang>
											<UnpackShed>
												<xsl:value-of select="UnpackShed/text()" />
											</UnpackShed>
											<VolumeCapacity>
												<xsl:value-of select="VolumeCapacity/text()" />
											</VolumeCapacity>
											<VolumeUnit>
												<Code>
													<xsl:value-of select="VolumeUnit/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="VolumeUnit/Description/text()" />
												</Description>
											</VolumeUnit>
											<WeightCapacity>
												<xsl:value-of select="WeightCapacity/text()" />
											</WeightCapacity>
											<WeightUnit>
												<Code>
													<xsl:value-of select="WeightUnit/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="WeightUnit/Description/text()" />
												</Description>
											</WeightUnit>
										</Container>
									</xsl:for-each>
								</ContainerCollection>
								<CustomizedFieldCollection>
									<xsl:for-each select="CustomizedFieldCollection/CustomizedField">
										<CustomizedField>
											<DataType>
												<xsl:value-of select="DataType/text()" />
											</DataType>
											<Key>
												<xsl:value-of select="Key/text()" />
											</Key>
											<Value>
												<xsl:value-of select="Value/text()" />
											</Value>
										</CustomizedField>
									</xsl:for-each>
								</CustomizedFieldCollection>
								<DateCollection>
									<xsl:for-each select="DateCollection/Date">
										 <Date>
											<Type>
												<xsl:value-of select="Type/text()" />
											</Type>
											<IsEstimate>
												<xsl:value-of select="IsEstimate/text()" />
											</IsEstimate>
											<Value>
												<xsl:value-of select="Value/text()" />
											</Value>
										</Date>
									</xsl:for-each>
								</DateCollection>
								<EntryNumberCollection>
									<xsl:for-each select="EntryNumberCollection/EntryNumber">
										 <EntryNumber>
											<Number>
												<xsl:value-of select="Number/text()" />
											</Number>
											<Type>
												<Code>
													<xsl:value-of select="Type/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="Type/Description/text()" />
												</Description>
											</Type>
											<CountryOfIssue>
												<Code>
													<xsl:value-of select="CountryOfIssue/Code/text()" />
												</Code>
												<Name>
													<xsl:value-of select="CountryOfIssue/Name/text()" />
												</Name>
											</CountryOfIssue>
											<EntryIsSystemGenerated>
												<xsl:value-of select="EntryIsSystemGenerated/text()" />
											</EntryIsSystemGenerated>
											<IssueDate>
												<xsl:value-of select="IssueDate/text()" />
											</IssueDate>
										</EntryNumber>
									</xsl:for-each>
								</EntryNumberCollection>
								<MilestoneCollection>
									<xsl:for-each select="MilestoneCollection/Milestone">
										<Milestone>
											<Description>
												<xsl:value-of select="Description/text()" />
											</Description>
											<EventCode>
												<xsl:value-of select="EventCode/text()" />
											</EventCode>
											<Sequence>
												<xsl:value-of select="Sequence/text()" />
											</Sequence>
											<ActualDate>
												<xsl:value-of select="ActualDate/text()" />
											</ActualDate>
											<ConditionReference>
												<xsl:value-of select="ConditionReference/text()" />
											</ConditionReference>
											<ConditionType>
												<xsl:value-of select="ConditionType/text()" />
											</ConditionType>
											<EstimatedDate>
												<xsl:value-of select="EstimatedDate/text()" />
											</EstimatedDate>
										</Milestone>
									</xsl:for-each>
								</MilestoneCollection>
								<NoteCollection>
									<xsl:attribute name="Content">
										<xsl:value-of select="NoteCollection/@Content"/>
									</xsl:attribute>
										<xsl:for-each select="NoteCollection/Note">
											<Note>
												<Description>
													<xsl:value-of select="Description/text()" />
												</Description>
												<IsCustomDescription>
													<xsl:value-of select="IsCustomDescription/text()" />
												</IsCustomDescription>
												<NoteText>
													<xsl:value-of select="NoteText/text()" />
												</NoteText>
												<NoteContext>
													<Code>
														<xsl:value-of select="NoteContext/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="NoteContext/Description/text()" />
													</Description>
												</NoteContext>
												<Visibility>
													<Code>
														<xsl:value-of select="Visibility/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="Visibility/Description/text()" />
													</Description>
												</Visibility>
												</Note>
										</xsl:for-each>
								</NoteCollection>
								<OrganizationAddressCollection>
									<xsl:for-each select="OrganizationAddressCollection/OrganizationAddress">
										<OrganizationAddress>
											<AddressType>
												<xsl:value-of select="AddressType/text()" />
											</AddressType>
											<Address1>
												<xsl:value-of select="Address1/text()" />
											</Address1>
											<Address2>
												<xsl:value-of select="Address2/text()" />
											</Address2>
											<AddressOverride>
												<xsl:value-of select="AddressOverride/text()" />
											</AddressOverride>
											<AddressShortCode>
												<xsl:value-of select="AddressShortCode/text()" />
											</AddressShortCode>
											<City>
												<xsl:value-of select="City/text()" />
											</City>
											<CompanyName>
												<xsl:value-of select="CompanyName/text()" />
											</CompanyName>
											<Country>
												<Code>
													<xsl:value-of select="Country/Code/text()" />
												</Code>
												<Name>
													<xsl:value-of select="Country/Name/text()" />
												</Name>
											</Country>
											<Email>
												<xsl:value-of select="Email/text()" />
											</Email>
											<Fax>
												<xsl:value-of select="Fax/text()" />
											</Fax>
											<GovRegNum>
												<xsl:value-of select="GovRegNum/text()" />
											</GovRegNum>
											<GovRegNumType>
												<Code>
													<xsl:value-of select="GovRegNumType/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="GovRegNumType/Description/text()" />
												</Description>
											</GovRegNumType>
											<OrganizationCode>
												<xsl:value-of select="OrganizationCode/text()" />
											</OrganizationCode>
											<Phone>
												<xsl:value-of select="Phone/text()" />
											</Phone>
											<Port>
												<Code>
													<xsl:value-of select="Port/Code/text()" />
												</Code>
												<Name>
													<xsl:value-of select="Port/Name/text()" />
												</Name>
											</Port>
											<Postcode>
												<xsl:value-of select="Postcode/text()" />
											</Postcode>
											<ScreeningStatus>
												<Code>
													<xsl:value-of select="ScreeningStatus/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="ScreeningStatus/Description/text()" />
												</Description>
											</ScreeningStatus>
											<State>
												<xsl:attribute name="Description">
													<xsl:value-of select="State/@Description"/>
												</xsl:attribute>
												<xsl:value-of select="State/text()" />
											</State>
											<RegistrationNumberCollection>
												<xsl:for-each select="RegistrationNumberCollection/RegistrationNumber">
													<RegistrationNumber>
														<Type>
															<Code>
																<xsl:value-of select="Type/Code/text()" />
															</Code>
															<Description>
																<xsl:value-of select="Type/Description/text()" />
															</Description>
														</Type>
														<CountryOfIssue>
															<Code>
																<xsl:value-of select="CountryOfIssue/Code/text()" />
															</Code>
															<Name>
																<xsl:value-of select="CountryOfIssue/Name/text()" />
															</Name>
														</CountryOfIssue>
														<Value>
															<xsl:value-of select="Value/text()" />
														</Value>
													</RegistrationNumber>
												</xsl:for-each>
											</RegistrationNumberCollection>
										</OrganizationAddress>
									</xsl:for-each>
								</OrganizationAddressCollection>
								<PackingLineCollection>
									<xsl:attribute name="Content">
										<xsl:value-of select="PackingLineCollection/@Content"/>
									</xsl:attribute>
										<xsl:for-each select="PackingLineCollection/PackingLine">
											 <PackingLine>
												<Commodity>
													<Code>
														<xsl:value-of select="Commodity/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="Commodity/Description/text()" />
													</Description>
												</Commodity>
												<ContainerLink>
													<xsl:value-of select="ContainerLink/text()" />
												</ContainerLink>
												<ContainerNumber>
													<xsl:value-of select="ContainerNumber/text()" />
												</ContainerNumber>
												<ContainerPackingOrder>
													<xsl:value-of select="ContainerPackingOrder/text()" />
												</ContainerPackingOrder>
												<CountryOfOrigin>
													<Code>
														<xsl:value-of select="CountryOfOrigin/Code/text()" />
													</Code>
												</CountryOfOrigin>
												<DetailedDescription>
													<xsl:value-of select="DetailedDescription/text()" />
												</DetailedDescription>
												<EndItemNo>
													<xsl:value-of select="EndItemNo/text()" />
												</EndItemNo>
												<ExportReferenceNumber>
													<xsl:value-of select="ExportReferenceNumber/text()" />
												</ExportReferenceNumber>
												<GoodsDescription>
													<xsl:value-of select="GoodsDescription/text()" />
												</GoodsDescription>
												<HarmonisedCode>
													<xsl:value-of select="HarmonisedCode/text()" />
												</HarmonisedCode>
												<Height>
													<xsl:value-of select="Height/text()" />
												</Height>
												<ImportReferenceNumber>
													<xsl:value-of select="ImportReferenceNumber/text()" />
												</ImportReferenceNumber>
												<ItemNo>
													<xsl:value-of select="ItemNo/text()" />
												</ItemNo>
												<Length>
													<xsl:value-of select="Length/text()" />
												</Length>
												<LengthUnit>
													<Code>
														<xsl:value-of select="LengthUnit/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="LengthUnit/Description/text()" />
													</Description>
												</LengthUnit>
												<LinePrice>
													<xsl:value-of select="LinePrice/text()" />
												</LinePrice>
												<Link>
													<xsl:value-of select="Link/text()" />
												</Link>
												<LoadingMeters>
													<xsl:value-of select="LoadingMeters/text()" />
												</LoadingMeters>
												<MarksAndNos>
													<xsl:value-of select="MarksAndNos/text()" />
												</MarksAndNos>
												<OutturnComment>
													<xsl:value-of select="OutturnComment/text()" />
												</OutturnComment>
												<OutturnDamagedQty>
													<xsl:value-of select="OutturnDamagedQty/text()" />
												</OutturnDamagedQty>
												<OutturnedHeight>
													<xsl:value-of select="OutturnedHeight/text()" />
												</OutturnedHeight>
												<OutturnedLength>
													<xsl:value-of select="OutturnedLength/text()" />
												</OutturnedLength>
												<OutturnedVolume>
													<xsl:value-of select="OutturnedVolume/text()" />
												</OutturnedVolume>
												<OutturnedWeight>
													<xsl:value-of select="OutturnedWeight/text()" />
												</OutturnedWeight>
												<OutturnedWidth>
													<xsl:value-of select="OutturnedWidth/text()" />
												</OutturnedWidth>
												<OutturnPillagedQty>
													<xsl:value-of select="OutturnPillagedQty/text()" />
												</OutturnPillagedQty>
												<OutturnQty>
													<xsl:value-of select="OutturnQty/text()" />
												</OutturnQty>
												<PackingLineID>
													<xsl:value-of select="PackingLineID/text()" />
												</PackingLineID>
												<PackQty>
													<xsl:value-of select="PackQty/text()" />
												</PackQty>
												<PackType>
													<Code>
														<xsl:value-of select="PackType/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="PackType/Description/text()" />
													</Description>
												</PackType>
												<ReferenceNumber>
													<xsl:value-of select="ReferenceNumber/text()" />
												</ReferenceNumber>
												<RequiresTemperatureControl>
													<xsl:value-of select="RequiresTemperatureControl/text()" />
												</RequiresTemperatureControl>
												<Volume>
													<xsl:value-of select="Volume/text()" />
												</Volume>
												<VolumeUnit>
													<Code>
														<xsl:value-of select="VolumeUnit/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="VolumeUnit/Description/text()" />
													</Description>
												</VolumeUnit>
												<Weight>
													<xsl:value-of select="Weight/text()" />
												</Weight>
												<WeightUnit>
													<Code>
														<xsl:value-of select="WeightUnit/Code/text()" />
													</Code>
													<Description>
														<xsl:value-of select="WeightUnit/Description/text()" />
													</Description>
												</WeightUnit>
												<Width>
													<xsl:value-of select="Width/text()" />
												</Width>
												<PackedItemCollection>
												</PackedItemCollection>
											</PackingLine>
										</xsl:for-each>
								</PackingLineCollection>
								<PreCarriageShipmentCollection>
									<xsl:for-each select="PreCarriageShipmentCollection/PreCarriageShipment">
										<PreCarriageShipment>
											<InstructionCollection>
												<xsl:for-each select="InstructionCollection/Instruction">
													<Instruction>
														<DropMode>
															<Code>
																<xsl:value-of select="DropMode/Code/text()" />
															</Code>
															<Description>
																<xsl:value-of select="DropMode/Description/text()" />
															</Description>
														</DropMode>
														<Equipment>
															<xsl:value-of select="Equipment/text()" />
														</Equipment>
														<ServiceInstruction>
															<xsl:value-of select="ServiceInstruction/text()" />
														</ServiceInstruction>
														<Type>
															<Code>
																<xsl:value-of select="Type/Code/text()" />
															</Code>
															<Description>
																<xsl:value-of select="Type/Description/text()" />
															</Description>
														</Type>
													
														<InstructionPackingLineLinkCollection>
															<xsl:for-each select="InstructionPackingLineLinkCollection/InstructionPackingLineLink">
																<InstructionPackingLineLink>
																	<PackingLineLink>
																		<xsl:value-of select="PackingLineLink/text()" />
																	</PackingLineLink>
																	<Quantity>
																		<xsl:value-of select="Quantity/text()" />
																	</Quantity>
																	<ConfirmationCollection>
																		<xsl:for-each select="ConfirmationCollection/Confirmation">
																			<Confirmation>
																				<ActualDate>
																					<xsl:value-of select="ActualDate/text()" />
																				</ActualDate>
																				<DateDescription>
																					<xsl:value-of select="DateDescription/text()" />
																				</DateDescription>
																				<Distance>
																					<xsl:value-of select="Distance/text()" />
																				</Distance>
																				<DistanceUnit>
																					<Code>
																						<xsl:value-of select="DistanceUnit/Code/text()" />
																					</Code>
																					<Description>
																						<xsl:value-of select="DistanceUnit/Description/text()" />
																					</Description>
																				</DistanceUnit>
																				<EstimatedDate>
																					<xsl:value-of select="EstimatedDate/text()" />
																				</EstimatedDate>
																				<ReceivedBy>
																					<xsl:value-of select="ReceivedBy/text()" />
																				</ReceivedBy>
																				<RequiredToDate>
																					<xsl:value-of select="RequiredToDate/text()" />
																				</RequiredToDate>
																			</Confirmation>
																		</xsl:for-each>
																	</ConfirmationCollection>
																</InstructionPackingLineLink>	
															</xsl:for-each>
														</InstructionPackingLineLinkCollection>
													</Instruction>
												</xsl:for-each>
											</InstructionCollection>
										</PreCarriageShipment>
									</xsl:for-each>
								</PreCarriageShipmentCollection>
							</SubShipment>
						</xsl:for-each>
					</SubShipmentCollection>
					<TransportLegCollection>
						<xsl:attribute name="Content">
							<xsl:value-of select="Body/UniversalShipment/Shipment/TransportLegCollection/@Content"/>
						</xsl:attribute>
							<xsl:for-each select="Body/UniversalShipment/Shipment/TransportLegCollection/TransportLeg">
								<TransportLeg>
									<PortOfDischarge>
										<Code>
											<xsl:value-of select="PortOfDischarge/Code/text()" />
										</Code>
										<Name>
											<xsl:value-of select="PortOfDischarge/Name/text()" />
										</Name>
									</PortOfDischarge>
									<PortOfLoading>
										<Code>
											<xsl:value-of select="PortOfLoading/Code/text()" />
										</Code>
										<Name>
											<xsl:value-of select="PortOfLoading/Name/text()" />
										</Name>
									</PortOfLoading>
									<LegOrder>
										<xsl:value-of select="LegOrder/text()" />
									</LegOrder>
									<ActualArrival>
										<xsl:value-of select="ActualArrival/Name/text()" />
									</ActualArrival>
									<ActualArrivalInPortOfLoading>
										<xsl:value-of select="ActualArrivalInPortOfLoading/Name/text()" />
									</ActualArrivalInPortOfLoading>
									<ActualDeparture>
										<xsl:value-of select="ActualDeparture/text()" />
									</ActualDeparture>
									<AircraftType>
										<Code>
											<xsl:value-of select="AircraftType/Code/text()" />
										</Code>
									</AircraftType>
									<ArrivalBerth>
										<xsl:value-of select="ArrivalBerth/text()" />
									</ArrivalBerth>
									<ArrivalReference>
										<xsl:value-of select="ArrivalReference/text()" />
									</ArrivalReference>
									<BookingStatus>
										<Code>
											<xsl:value-of select="BookingStatus/Code/text()" />
										</Code>
										<Description>
											<xsl:value-of select="Description/Code/text()" />
										</Description>
									</BookingStatus>
									<xsl:if test="position() = 1">
										<Carrier>
											<AddressType>
												<xsl:value-of select="Carrier/AddressType/text()" />
											</AddressType>
											<Address1>
												<xsl:value-of select="Carrier/Address1/text()" />
											</Address1>
											<Address2>
												<xsl:value-of select="Carrier/Address2/text()" />
											</Address2>
											<AddressOverride>
												<xsl:value-of select="Carrier/AddressOverride/text()" />
											</AddressOverride>
											<AddressShortCode>
												<xsl:value-of select="Carrier/AddressShortCode/text()" />
											</AddressShortCode>
											<City>
												<xsl:value-of select="Carrier/City/text()" />
											</City>
											<CompanyName>
												<xsl:value-of select="Carrier/CompanyName/text()" />
											</CompanyName>
											<Country>
												<Code>
													<xsl:value-of select="Carrier/Country/Code/text()" />
												</Code>
												<Name>
													<xsl:value-of select="Carrier/Country/Name/text()" />
												</Name>
											</Country>
											<Email>
												<xsl:value-of select="Carrier/Email/text()" />
											</Email>
											<Fax>
												<xsl:value-of select="Carrier/Fax/text()" />
											</Fax>
											<GovRegNum>
												<xsl:value-of select="Carrier/GovRegNum/text()" />
											</GovRegNum>
											<GovRegNumType>
												<Code>
													<xsl:value-of select="Carrier/GovRegNumType/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="Carrier/GovRegNumType/Description/text()" />
												</Description>
											</GovRegNumType>
											<OrganizationCode>
												<xsl:value-of select="Carrier/OrganizationCode/text()" />
											</OrganizationCode>
											<Phone>
												<xsl:value-of select="Carrier/Phone/text()" />
											</Phone>
											<Port>
												<Code>
													<xsl:value-of select="Carrier/Port/Code/text()" />
												</Code>
												<Name>
													<xsl:value-of select="Carrier/Port/Name/text()" />
												</Name>
											</Port>
											<Postcode>
												<xsl:value-of select="Carrier/Postcode/text()" />
											</Postcode>
											<ScreeningStatus>
												<Code>
													<xsl:value-of select="Carrier/ScreeningStatus/Code/text()" />
												</Code>
												<Description>
													<xsl:value-of select="Carrier/ScreeningStatus/Description/text()" />
												</Description>
											</ScreeningStatus>
											<State>
												<xsl:attribute name="Description">
													<xsl:value-of select="Carrier/State/@Description"/>
												</xsl:attribute>
												<xsl:value-of select="Carrier/State/text()"/>
											</State>
											<RegistrationNumberCollection>
												<xsl:for-each select="Carrier/RegistrationNumberCollection/RegistrationNumber">
													<RegistrationNumber>
														<Type>
															<Code>
																<xsl:value-of select="Type/Code/text()" />
															</Code>
															<Description>
																<xsl:value-of select="Type/Description/text()" />
															</Description>
														</Type>
														<CountryOfIssue>
															<Code>
																<xsl:value-of select="CountryOfIssue/Code/text()" />
															</Code>
															<Name>
																<xsl:value-of select="CountryOfIssue/Name/text()" />
															</Name>
														</CountryOfIssue>
														<Value>
															<xsl:value-of select="Value/text()" />
														</Value>
														</RegistrationNumber>
												</xsl:for-each>
											</RegistrationNumberCollection>
											</Carrier>
										 </xsl:if>
										<CarrierBookingReference>
											<xsl:value-of select="CarrierBookingReference/text()" />
										</CarrierBookingReference>
										<CarrierServiceLevel>
											<Code>
												<xsl:value-of select="CarrierServiceLevel/Code/text()" />
											</Code>
										</CarrierServiceLevel>
										<DepartureBerth>
											<xsl:value-of select="DepartureBerth/text()" />
										</DepartureBerth>
										<DepartureReference>
											<xsl:value-of select="DepartureReference/text()" />
										</DepartureReference>
										<DocumentCutOff>
											<xsl:value-of select="DocumentCutOff/text()" />
										</DocumentCutOff>
										<EstimatedArrival>
											<xsl:value-of select="EstimatedArrival/text()" />
										</EstimatedArrival>
										<EstimatedArrivalInPortOfLoading>
											<xsl:value-of select="EstimatedArrivalInPortOfLoading/text()" />
										</EstimatedArrivalInPortOfLoading>
										<EstimatedDeparture>
											<xsl:value-of select="EstimatedDeparture/text()" />
										</EstimatedDeparture>
										<FCLAvailability>
											<xsl:value-of select="FCLAvailability/text()" />
										</FCLAvailability>
										<FCLCutOff>
											<xsl:value-of select="FCLCutOff/text()" />
										</FCLCutOff>
										<FCLReceivalCommences>
											<xsl:value-of select="FCLReceivalCommences/text()" />
										</FCLReceivalCommences>
										<FCLStorage>
											<xsl:value-of select="FCLStorage/text()" />
										</FCLStorage>
										<HazzardCutOffDate>
											<xsl:value-of select="HazzardCutOffDate/text()" />
										</HazzardCutOffDate>
										<HazzardReceivalCommences>
											<xsl:value-of select="HazzardReceivalCommences/text()" />
										</HazzardReceivalCommences>
										<IsCargoOnly>
											<xsl:value-of select="IsCargoOnly/text()" />
										</IsCargoOnly>
										<LCLAvailability>
											<xsl:value-of select="LCLAvailability/text()" />
										</LCLAvailability>
										<LCLCutOff>
											<xsl:value-of select="LCLCutOff/text()" />
										</LCLCutOff>
										<LCLReceivalCommences>
											<xsl:value-of select="LCLReceivalCommences/text()" />
										</LCLReceivalCommences>
										<LCLStorageDate>
											<xsl:value-of select="LCLStorageDate/text()" />
										</LCLStorageDate>
										<LegNotes>
											<xsl:value-of select="LegNotes/text()" />
										</LegNotes>
										<LegType>
											<xsl:value-of select="LegType/text()" />
										</LegType>
										<TransportMode>
											<xsl:value-of select="TransportMode/text()" />
										</TransportMode>
										<VesselLloydsIMO>
											<xsl:value-of select="VesselLloydsIMO/text()" />
										</VesselLloydsIMO>
										<VesselName>
											<xsl:value-of select="VesselName/text()" />
										</VesselName>
										<VGMCutOff>
											<xsl:value-of select="VGMCutOff/text()" />
										</VGMCutOff>
										<VoyageFlightNo>
											<xsl:value-of select="VoyageFlightNo/text()" />
										</VoyageFlightNo>
									</TransportLeg>
							</xsl:for-each>
					</TransportLegCollection>
				</Shipment>
			</UniversalShipment>
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