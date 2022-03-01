<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <xsl:for-each select="s0:Body/s0:UniversalShipment">
      <ShipmentDto>
        <Shipments>
          <ShipmentInfo>
            <CargoDetails>
                <CargoDetailDto>

                  <Commodity>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:DetailedDescription/text()" />
                  </Commodity>
                  <CommodityType>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:Commodity/s0:Code/text()" />
                  </CommodityType>
                  <ContainerNumber>
                    <xsl:value-of select="s0:Shipment/s0:ContainerCollection/s0:Container[s0:Link=s0:ContainerLink]/s0:ContainerNumber/text()" />
                  </ContainerNumber>
                  <Dimensions>
                    <xsl:for-each select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine">

                      <CargoDimensionDto>
                        <Height>
                          <xsl:value-of select="s0:Height/text()" />
                        </Height>
                        <Length>
                          <xsl:value-of select="s0:Length/text()" />
                        </Length>
                        <PCS>
                          <xsl:value-of select="s0:PackQty/text()" />
                        </PCS>
                        <Unit>
                          <xsl:value-of select="'CMS'" />
                        </Unit>
                        <Width>
                          <xsl:value-of select="s0:Width/text()" />
                        </Width>
                      </CargoDimensionDto>
                    </xsl:for-each>
                  </Dimensions>
                  <GoodsDescription>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:DetailedDescription/text()" />
                  </GoodsDescription>
                  <GrossWeight>
                    <Unit>
                     <xsl:choose>
                        <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:WeightUnit/s0:Description/text()='Kilograms'">
                          <xsl:value-of select="'KGS'" />
                        </xsl:when>
                        <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:WeightUnit/s0:Description/text()='Pound'">
                          <xsl:value-of select="'LBS'" />
                        </xsl:when>
                      </xsl:choose>
                    </Unit>
                    <Weight>
                      <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:Weight/text()" />
                    </Weight>
                  </GrossWeight>
                  <HSCode>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:HarmonisedCode/text()" />
                  </HSCode>
                  <NoOfPackages>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:PackQty/text()" />
                  </NoOfPackages>
                  <PackageType>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:PackType/s0:Code/text()" />
                  </PackageType>

                  <Volume>
                    <Unit>
                      <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:VolumneUnit/s0:Code/text()" />
                    </Unit>
                    <Volume>
                      <xsl:choose>
                        <xsl:when test="string-length(s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:Volumne/text())>0">
                          <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:Volumne/text()" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="'0'" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </Volume>
                  </Volume>
                </CargoDetailDto>
            </CargoDetails>
            <Containers>
              <xsl:if test="s0:Shipment/s0:TransportMode/s0:Code='SEA' or s0:Shipment/s0:TransportMode/s0:Code='Sea'">
                <xsl:for-each select="s0:Shipment/s0:ContainerCollection/s0:Container">
                  <ContainerInfoDto>
                    <xsl:if test="s0:ContainerNumber">
                      <ContainerNumber>
                        <xsl:value-of select="s0:ContainerNumber/text()" />
                      </ContainerNumber>
                    </xsl:if>
                    <xsl:if test="s0:ContainerType/s0:ISOCode">
                      <ContainerSize>
                        <xsl:value-of select="s0:ContainerType/s0:ISOCode/text()" />
                      </ContainerSize>
                    </xsl:if>
                    <ContainerType>
                      <xsl:value-of select="s0:ContainerType/s0:Code/text()" />
                    </ContainerType>
                    <xsl:if test="s0:Seal">
                      <Seal1>
                        <xsl:value-of select="s0:Seal/text()" />
                      </Seal1>
                    </xsl:if>
                    <xsl:if test="s0:SecondSeal">
                      <Seal2>
                        <xsl:value-of select="s0:SecondSeal/text()" />
                      </Seal2>
                    </xsl:if>
                    <CargoGrossWeight>
                      <xsl:if test="s0:GrossWeight">
                        <Weight>
                          <xsl:value-of select="s0:GrossWeight/text()" />
                        </Weight>
                      </xsl:if>
                      <Unit>
                        <xsl:value-of select="s0:WeightUnit/s0:Code/text()" />
                      </Unit>
                    </CargoGrossWeight>
                  </ContainerInfoDto>
                </xsl:for-each>
              </xsl:if>
            </Containers>

            <Flights>
              <xsl:if test="s0:Shipment/s0:TransportMode/s0:Code='AIR' or s0:Shipment/s0:TransportMode/s0:Code='Air'">
                <FlightInfoDto>
                  <AirlineCode>
                    <xsl:value-of select="substring(s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:VoyageFlightNo/text(),1,2)"/>
                  </AirlineCode>
                  <ArrivalAirport>
                    <xsl:value-of select="substring(s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfLoading/s0:Code/text(),3,3)"/>
                  </ArrivalAirport>
                  <DepartureAirport>
                    <xsl:value-of select="substring(s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfDischarge/s0:Code/text(),3,3)"/>
                  </DepartureAirport>
                  <ETA>
                    <xsl:value-of select="userCSharp:ConvertDateRequiredValue(s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:EstimatedArrival)"/>
                  </ETA>
                  <ETD>
                    <xsl:value-of select="userCSharp:ConvertDateRequiredValue(s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:EstimatedDeparture)"/>
                  </ETD>
                  <FlightNumber>
                    <xsl:value-of select="s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:VoyageFlightNo/text()"/>
                  </FlightNumber>
                </FlightInfoDto>
              </xsl:if>
            </Flights>

            <General>
              <DocNo>
                <xsl:value-of select="s0:Shipment/s0:WayBillNumber/text()" />
              </DocNo>
              <DocType>
                <xsl:value-of select="'Master'" />
              </DocType>
              <Mode>
                <xsl:choose>
                  <xsl:when test="s0:Shipment/s0:TransportMode/s0:Code/text()='SEA' or s0:Shipment/s0:TransportMode/s0:Code='Sea'">
                    <xsl:value-of select="'Sea'" />
                  </xsl:when>
                  <xsl:when test="s0:Shipment/s0:TransportMode/s0:Code/text()='AIR' or s0:Shipment/s0:TransportMode/s0:Code='Air'">
                    <xsl:value-of select="'Air'" />
                  </xsl:when>
                </xsl:choose>
              </Mode>
              <Status>SHARED</Status>
              <SystemRefNo>
                <xsl:value-of select="s0:Shipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource[s0:Type='ForwardingConsol']/s0:Key/text()" />
              </SystemRefNo>
                <xsl:choose>
                  <xsl:when test="s0:Shipment/s0:TransportMode/s0:Code='SEA'  or s0:Shipment/s0:TransportMode/s0:Code='Sea'">
                    <ShipmentType>
                      <xsl:value-of select="s0:Shipment/s0:ContainerMode/s0:Code/text()" />
                    </ShipmentType>
                  </xsl:when>
                </xsl:choose>
            </General>
            <MasterInfos>
              <xsl:if test="s0:Shipment/s0:TransportMode/s0:Code='AIR' or s0:Shipment/s0:TransportMode/s0:Code='Air'">
<xsl:if test="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Address1">

                <DestinationAgent>
                  <Address>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Address1"/>
                  </Address>
                  <City>
                    <Code>
                      <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Port/s0:Code"/>
                    </Code>
                    <Name>
                      <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Port/s0:Name"/>
                    </Name>
                  </City>
                  <Country>
                    <Code>
                      <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Country/s0:Code"/>
                    </Code>
                    <Name>
                      <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Country/s0:Name"/>
                    </Name>
                  </Country>
                  <Email>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Email"/>
                  </Email>
                  <Fax>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Fax"/>
                  </Fax>
                  <Mobile>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Phone"/>
                  </Mobile>
                  <Name>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:CompanyName"/>
                  </Name>
                  <ReferenceInformations>
                    <ReferencesDto>
                      <ReferenceInformation>
                        <xsl:value-of select="s0:Shipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource[s0:Type='ForwardingConsol']/s0:Key/text()" />
                      </ReferenceInformation>
                      <Type>FreightForwarderRefNo</Type>
                    </ReferencesDto>
                  </ReferenceInformations>
                  <Website></Website>
                  <ZipCode>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Postcode"/>
                  </ZipCode>

                </DestinationAgent>
           </xsl:if>   </xsl:if>
              <xsl:if test="(s0:Shipment/s0:TransportMode/s0:Code='AIR' or s0:Shipment/s0:TransportMode/s0:Code='Air')">
<xsl:if test="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Address1">
			   <OriginAgent>
                  <Address>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Address1"/>
                  </Address>
                  <City>
                    <Code>
                      <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Port/s0:Code"/>
                    </Code>
                    <Name>
                      <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Port/s0:Name"/>
                    </Name>
                  </City>
                  <Country>
                    <Code>
                      <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Country/s0:Code"/>
                    </Code>
                    <Name>
                      <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Country/s0:Name"/>
                    </Name>
                  </Country>
                  <Email>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Email"/>
                  </Email>
                  <Fax>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Fax"/>
                  </Fax>
                  <Mobile>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Phone"/>
                  </Mobile>
                  <Name>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:CompanyName"/>
                  </Name>
                  <ReferenceInformations>
                    <ReferencesDto>
                      <ReferenceInformation>
                        <xsl:value-of select="s0:Shipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource[s0:Type='ForwardingConsol']/s0:Key/text()" />
                      </ReferenceInformation>
                      <Type>FreightForwarderRefNo</Type>
                    </ReferencesDto>
                  </ReferenceInformations>
                  <Website></Website>
                  <ZipCode>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendingForwarderAddress']/s0:Postcode"/>
                  </ZipCode>
                </OriginAgent>
             </xsl:if>               
			 </xsl:if>
             <xsl:if test="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ReceivingForwarderAddress']/s0:RegistrationNumberCollection/s0:RegistrationNumber[s0:Type/s0:Code='LSC']/s0:Value/text()">
			 <Receiver>
                <ReceiverInfo>
                  <ReceiverID>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ReceivingForwarderAddress']/s0:RegistrationNumberCollection/s0:RegistrationNumber[s0:Type/s0:Code='LSC']/s0:Value/text()"/>
                  </ReceiverID>
                </ReceiverInfo>
              </Receiver>
</xsl:if>          
		  </MasterInfos>
            <Parties>
              <PartyInfo>
                <Address>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
                </Address>
                <City>
                  <Code>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Port/s0:Code"/>
                  </Code>
                  <Name>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Port/s0:Name"/>
                  </Name>
                </City>
                <Country>
                  <Code>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Code"/>
                  </Code>
                  <Name>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Name"/>
                  </Name>
                </Country>
                <Email>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Email"/>
                </Email>
                <Fax>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Fax"/>
                </Fax>
                <Mobile>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Phone"/>
                </Mobile>
                <Name>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:CompanyName"/>
                </Name>
                <ZipCode>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Postcode"/>
                </ZipCode>
                <PartyType>Shipper</PartyType>
                <SystemID></SystemID>
              </PartyInfo>
              <PartyInfo>
                <Address>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
                </Address>
                <City>
                  <Code>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Port/s0:Code"/>
                  </Code>
                  <Name>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Port/s0:Name"/>
                  </Name>
                </City>
                <Country>
                  <Code>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Code"/>
                  </Code>
                  <Name>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Name"/>
                  </Name>
                </Country>
                <Email>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Email"/>
                </Email>
                <Fax>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Fax"/>
                </Fax>
                <Mobile>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Phone"/>
                </Mobile>
                <Name>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:CompanyName"/>
                </Name>
                <ZipCode>
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Postcode"/>
                </ZipCode>
                <PartyType>Consignee</PartyType>
                <SystemID></SystemID>
              </PartyInfo>
            </Parties>
            <TransportationDetail>
              <DeclaredValueCarrier>
                <xsl:value-of select="s0:Shipment/s0:ContainerCollection/s0:Container/s0:GoodsValue/text()"/>
              </DeclaredValueCarrier>
              <DeclaredValueCustoms>
                <xsl:value-of select="s0:Shipment/s0:ContainerCollection/s0:Container/s0:GoodsValue/text()"/>
              </DeclaredValueCustoms>
              <DeliveryAddress>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneePickupDeliveryAddress']/s0:City/text()"/>
              </DeliveryAddress>
              <PickupAddress>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorPickupDeliveryAddress']/s0:City/text()"/>
              </PickupAddress>
              <PlaceOfDelivery>
                <xsl:value-of select="s0:Shipment/s0:PlaceOfDelivery/s0:Name/text()"/>
              </PlaceOfDelivery>
              <PlaceOfReceipt>
                <xsl:value-of select="s0:Shipment/s0:PlaceOfReceipt/s0:Name/text()"/>
              </PlaceOfReceipt>
              <PortOfDischarge>
              <xsl:value-of select="substring(s0:Shipment/s0:PortOfDischarge/s0:Code/text(),3,3)"/>
              </PortOfDischarge>
              <PortOfLoading>
                 <xsl:value-of select="substring(s0:Shipment/s0:PortOfLoading/s0:Code/text(),3,3)"/>
              </PortOfLoading>
              <xsl:if test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:LocalProcessing/s0:OrderNumberCollection/s0:OrderNumber/s0:OrderReference">
                <ReferenceNumbers>
                  <ReferenceNumberDto>
                    <ReferenceNumber>
                      <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:LocalProcessing/s0:OrderNumberCollection/s0:OrderNumber/s0:OrderReference/text()"/>
                    </ReferenceNumber>
                    <Type>PurchaseOrderNo</Type>
                  </ReferenceNumberDto>
                </ReferenceNumbers>
              </xsl:if>
                 <xsl:if test="s0:Shipment/s0:AdditionalReferenceCollection/s0:AdditionalReference/s0:Type/s0:Code/text()='LCR'">
                <ReferenceNumbers>
                  <ReferenceNumberDto>
                    <ReferenceNumber>
                      <xsl:value-of select="s0:Shipment/s0:AdditionalReferenceCollection/s0:AdditionalReference[s0:Type/s0:Code='LCR']/s0:ReferenceNumber/text()"/>
                    </ReferenceNumber>
                    <Type>LCNumber</Type>
                  </ReferenceNumberDto>
                </ReferenceNumbers>
              </xsl:if>           
              <ShippingTerms>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:ShipmentIncoTerm/s0:Code/text()"/>
              </ShippingTerms>
            </TransportationDetail>

            <VesselInfo>
              <xsl:if test="s0:Shipment/s0:TransportMode/s0:Code='SEA'  or s0:Shipment/s0:TransportMode/s0:Code='Sea'">
                <VesselInfoDto>
                  <Vessel>
                    <xsl:value-of select="s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:VesselName"/>
                  </Vessel>
                  <VoyageNumber>
                    <xsl:value-of select="s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:VoyageFlightNo"/>
                  </VoyageNumber>
                  <CarrierSCAC>
                    <xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ShippingLineAddress']/s0:RegistrationNumberCollection/s0:RegistrationNumber[s0:Type/s0:Code='CCC' and s0:CountryOfIssue/s0:Code='US']/s0:Value"/>
                  </CarrierSCAC>
                  <LloydsNumber>
                    <xsl:value-of select="s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:VesselLloydsIMO"/>
                  </LloydsNumber>
                  <VesselFlag />
                  <IMO>
                    <xsl:value-of select="s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:VesselLloydsIMO"/>
                  </IMO>
                  <DeparturePort>
                    <xsl:value-of select="s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfDischarge/s0:Code"/>
                  </DeparturePort>
                  <ArrivalPort>
                    <xsl:value-of select="s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfLoading/s0:Code"/>
                  </ArrivalPort>
                  <ETD>
                    <xsl:value-of select="s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:EstimatedDeparture"/>
                  </ETD>
                  <ETA>
                    <xsl:value-of select="s0:Shipment/s0:TransportLegCollection/s0:TransportLeg/s0:EstimatedArrival"/>
                  </ETA>
                </VesselInfoDto>
              </xsl:if>
            </VesselInfo>
          </ShipmentInfo>
          <xsl:for-each select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment">
            <ShipmentInfo>
              <CargoDetails>
                  <CargoDetailDto>
                    <ChargeableWeight>
                      <Unit>KGS</Unit>
                      <Weight>218</Weight>
                    </ChargeableWeight>
                    <Commodity>
                      <xsl:value-of select="s0:PackingLineCollection/s0:PackingLine/s0:DetailedDescription/text()" />
                    </Commodity>
                    <CommodityType>
                      <xsl:value-of select="s0:PackingLineCollection/s0:PackingLine/s0:Commodity/s0:Code/text()" />
                    </CommodityType>
                    <ContainerNumber>
                      <xsl:value-of select="../../s0:ContainerCollection/s0:Container[s0:Link=s0:ContainerLink]/s0:ContainerNumber/text()" />
                    </ContainerNumber>
                    <Dimensions>
                      <xsl:for-each select="s0:PackingLineCollection/s0:PackingLine">

                        <CargoDimensionDto>
                          <Height>
                            <xsl:value-of select="s0:Height/text()" />
                          </Height>
                          <Length>
                            <xsl:value-of select="s0:Length/text()" />
                          </Length>
                          <PCS>
                            <xsl:value-of select="s0:PackQty/text()" />
                          </PCS>
                          <Unit>
                            <xsl:value-of select="'CMS'" />
                          </Unit>
                          <Width>
                            <xsl:value-of select="s0:Width/text()" />
                          </Width>
                        </CargoDimensionDto>
                      </xsl:for-each>
                    </Dimensions>
                    <GoodsDescription>
                      <xsl:value-of select="s0:PackingLineCollection/s0:PackingLine/s0:DetailedDescription/text()" />
                    </GoodsDescription>
                    <GrossWeight>
                      <Unit>
                        <xsl:choose>
                          <xsl:when test="s0:PackingLineCollection/s0:PackingLine/s0:WeightUnit/s0:Description/text()='Kilograms'">
                            <xsl:value-of select="'KGS'" />
                          </xsl:when>
                            <xsl:when test="s0:PackingLineCollection/s0:PackingLine/s0:WeightUnit/s0:Description/text()='Pound'">
                            <xsl:value-of select="'LBS'" />
                          </xsl:when>
                        </xsl:choose>
                      </Unit>
                      <Weight>
                        <xsl:value-of select="s0:PackingLineCollection/s0:PackingLine/s0:Weight/text()" />
                      </Weight>
                    </GrossWeight>
                    <HSCode>
                      <xsl:value-of select="s0:PackingLineCollection/s0:PackingLine/s0:HarmonisedCode/text()" />
                    </HSCode>
                    <NoOfPackages>
                      <xsl:value-of select="s0:PackingLineCollection/s0:PackingLine/s0:PackQty/text()" />
                    </NoOfPackages>
                    <PackageType>
                      <xsl:value-of select="s0:PackingLineCollection/s0:PackingLine/s0:PackType/s0:Code/text()" />
                    </PackageType>


                    <Volume>
                      <Unit>
                        <xsl:value-of select="s0:PackingLineCollection/s0:PackingLine/s0:VolumneUnit/s0:Code/text()" />
                      </Unit>
                      <Volume>
                        <xsl:choose>
                          <xsl:when test="string-length(s0:PackingLineCollection/s0:PackingLine/s0:Volumne/text())>0">
                            <xsl:value-of select="s0:PackingLineCollection/s0:PackingLine/s0:Volumne/text()" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="'0'" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </Volume>
                    </Volume>
                  </CargoDetailDto>
              </CargoDetails>
              <Containers>
                <xsl:if test="s0:TransportMode/s0:Code='SEA'  or s0:Shipment/s0:TransportMode/s0:Code='Sea'">
                  <xsl:for-each select="s0:ContainerCollection/s0:Container">
                    <ContainerInfoDto>
                      <xsl:if test="s0:ContainerNumber">
                        <ContainerNumber>
                          <xsl:value-of select="s0:ContainerNumber/text()" />
                        </ContainerNumber>
                      </xsl:if>
                      <xsl:if test="s0:ContainerType/s0:ISOCode">
                        <ContainerSize>
                          <xsl:value-of select="s0:ContainerType/s0:ISOCode/text()" />
                        </ContainerSize>
                      </xsl:if>
                      <ContainerType>
                        <xsl:value-of select="s0:ContainerType/s0:Code/text()" />
                      </ContainerType>
                <xsl:if test="s0:Seal">
                        <Seal1>
                          <xsl:value-of select="s0:Seal/text()" />
                        </Seal1>
                      </xsl:if>
                      <xsl:if test="s0:SecondSeal">
                        <Seal2>
                          <xsl:value-of select="s0:SecondSeal/text()" />
                        </Seal2>
                      </xsl:if>
                      <CargoGrossWeight>
                        <xsl:if test="s0:GrossWeight">
                          <Weight>
                            <xsl:value-of select="s0:GrossWeight/text()" />
                          </Weight>
                        </xsl:if>
                        <Unit>
                          <xsl:choose>
                            <xsl:when test="s0:WeightUnit/s0:Description/text()='Kilograms'">
                              <xsl:value-of select="'KGS'" />
                            </xsl:when>
                            <xsl:when test="s0:WeightUnit/s0:Description/text()='Pound'">
                              <xsl:value-of select="'LBS'" />
                            </xsl:when>
                          </xsl:choose>
                        </Unit>
                      </CargoGrossWeight>
                    </ContainerInfoDto>
                  </xsl:for-each>
                </xsl:if>
              </Containers>
                <xsl:if test="s0:TransportMode/s0:Code='AIR' or s0:TransportMode/s0:Code='Air'">

              <Flights>
                <xsl:for-each select="s0:TransportLegCollection/s0:TransportLeg">
                  <FlightInfoDto>
                    <AirlineCode>
                      <xsl:value-of select="substring(s0:VoyageFlightNo/text(),1,2)"/>
                    </AirlineCode>
                    <ArrivalAirport>
                      <xsl:value-of select="substring(s0:PortOfLoading/s0:Code/text(),3,3)"/>
                    </ArrivalAirport>
                    <DepartureAirport>
                      
                      <xsl:value-of select="substring(s0:PortOfDischarge/s0:Code/text(),3,3)"/>
                    </DepartureAirport>
                    <ETA>
                      <xsl:value-of select="userCSharp:ConvertDateRequiredValue(s0:EstimatedArrival)"/>
                    </ETA>
                    <ETD>
                      <xsl:value-of select="userCSharp:ConvertDateRequiredValue(s0:EstimatedDeparture)"/>
                    </ETD>
                    <FlightNumber>
                      <xsl:value-of select="s0:VoyageFlightNo/text()"/>
                    </FlightNumber>
                  </FlightInfoDto>
                </xsl:for-each>
              </Flights>
                </xsl:if>

              <General>
                <DocNo>
                  <xsl:value-of select="s0:WayBillNumber/text()" />
                </DocNo>
                <DocType>
                  <xsl:value-of select="'House'" />
                </DocType>
                <Mode>
                  <xsl:choose>
                    <xsl:when test="s0:TransportMode/s0:Code/text()='SEA' or s0:TransportMode/s0:Code='Sea'">
                      <xsl:value-of select="'Sea'" />
                    </xsl:when>
                    <xsl:when test="s0:TransportMode/s0:Code/text()='AIR' or s0:TransportMode/s0:Code='Air'">
                      <xsl:value-of select="'Air'" />
                    </xsl:when>
                  </xsl:choose>
                </Mode>
                <Status>SHARED</Status>
                <SystemRefNo>
                  <xsl:value-of select="s0:Shipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource[s0:Type='ForwardingShipment']/s0:Key/text()" />
                </SystemRefNo>
                <xsl:choose>
                  <xsl:when test="s0:TransportMode/s0:Code='SEA'">
                    <ShipmentType>
                      <xsl:value-of select="s0:ContainerMode/s0:Code/text()" />
                    </ShipmentType>
                  </xsl:when>
                </xsl:choose>
              </General>

              <Parties>
                <PartyInfo>
                  <Address>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
                  </Address>
                  <City>
                    <Code>
                      <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Port/s0:Code"/>
                    </Code>
                    <Name>
                      <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Port/s0:Name"/>
                    </Name>
                  </City>
                  <Country>
                    <Code>
                      <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Code"/>
                    </Code>
                    <Name>
                      <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Name"/>
                    </Name>
                  </Country>
                  <Email>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Email"/>
                  </Email>
                  <Fax>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Fax"/>
                  </Fax>
                  <Mobile>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Phone"/>
                  </Mobile>
                  <Name>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:CompanyName"/>
                  </Name>
                  <ZipCode>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Postcode"/>
                  </ZipCode>
                  <PartyType>Shipper</PartyType>
                  <SystemID></SystemID>
                </PartyInfo>
                <PartyInfo>
                  <Address>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
                  </Address>
                  <City>
                    <Code>
                      <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Port/s0:Code"/>
                    </Code>
                    <Name>
                      <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Port/s0:Name"/>
                    </Name>
                  </City>
                  <Country>
                    <Code>
                      <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Code"/>
                    </Code>
                    <Name>
                      <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Name"/>
                    </Name>
                  </Country>
                  <Email>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Email"/>
                  </Email>
                  <Fax>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Fax"/>
                  </Fax>
                  <Mobile>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Phone"/>
                  </Mobile>
                  <Name>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:CompanyName"/>
                  </Name>
                  <ZipCode>
                    <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Postcode"/>
                  </ZipCode>
                  <PartyType>Consignee</PartyType>
                  <SystemID></SystemID>
                </PartyInfo>
              </Parties>
              <TransportationDetail>
                <DeclaredValueCarrier>
                  <xsl:value-of select="../../s0:ContainerCollection/s0:Container/s0:GoodsValue/text()"/>
                </DeclaredValueCarrier>
                <DeclaredValueCustoms>
                  <xsl:value-of select="../../s0:ContainerCollection/s0:Container/s0:GoodsValue/text()"/>
                </DeclaredValueCustoms>
                <DeliveryAddress>
                  <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneePickupDeliveryAddress']/s0:City/text()"/>
                </DeliveryAddress>
                <PickupAddress>
                  <xsl:value-of select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorPickupDeliveryAddress']/s0:City/text()"/>
                </PickupAddress>
                <PlaceOfDelivery>
                  <xsl:value-of select="../../s0:PlaceOfDelivery/s0:Name/text()"/>
                </PlaceOfDelivery>
                <PlaceOfReceipt>
                  <xsl:value-of select="../../s0:PlaceOfReceipt/s0:Name/text()"/>
                </PlaceOfReceipt>
                <PortOfDischarge>
                 <xsl:value-of select="substring(../../s0:PortOfDischarge/s0:Code/text(),3,3)"/>
                </PortOfDischarge>
                <PortOfLoading>
                <xsl:value-of select="substring(../../s0:PortOfLoading/s0:Code/text(),3,3)"/>
                </PortOfLoading>
                <xsl:if test="s0:LocalProcessing/s0:OrderNumberCollection/s0:OrderNumber/s0:OrderReference">
                  <ReferenceNumbers>
                    <ReferenceNumberDto>
                      <ReferenceNumber>
                        <xsl:value-of select="s0:LocalProcessing/s0:OrderNumberCollection/s0:OrderNumber/s0:OrderReference/text()"/>
                      </ReferenceNumber>
                      <Type>PurchaseOrderNo</Type>
                    </ReferenceNumberDto>
                  </ReferenceNumbers>
                </xsl:if>
               
                <ShippingTerms>
                  <xsl:value-of select="s0:ShipmentIncoTerm/s0:Code/text()"/>
                </ShippingTerms>
              </TransportationDetail>

              <VesselInfo>
                <xsl:if test="../../s0:TransportMode/s0:Code='SEA' or s0:Shipment/s0:TransportMode/s0:Code='Sea'">
                  <xsl:for-each select="s0:TransportLegCollection/s0:TransportLeg">
                    <VesselInfoDto>
                      <Vessel>
                        <xsl:value-of select="s0:VesselName"/>
                      </Vessel>
                      <VoyageNumber>
                        <xsl:value-of select="s0:VoyageFlightNo"/>
                      </VoyageNumber>
                      <CarrierSCAC>
                        <xsl:value-of select="../../s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ShippingLineAddress']/s0:RegistrationNumberCollection/s0:RegistrationNumber[s0:Type/s0:Code='CCC' and s0:CountryOfIssue/s0:Code='US']/s0:Value"/>
                      </CarrierSCAC>
                      <LloydsNumber>
                        <xsl:value-of select="s0:VesselLloydsIMO"/>
                      </LloydsNumber>
                      <VesselFlag />
                      <IMO>
                        <xsl:value-of select="s0:VesselLloydsIMO"/>
                      </IMO>
                      <DeparturePort>
                        <xsl:value-of select="s0:PortOfDischarge/s0:Code"/>
                      </DeparturePort>
                      <ArrivalPort>
                        <xsl:value-of select="s0:PortOfLoading/s0:Code"/>
                      </ArrivalPort>
                      <ETD>
                        <xsl:value-of select="s0:EstimatedDeparture"/>
                      </ETD>
                      <ETA>
                        <xsl:value-of select="s0:EstimatedArrival"/>
                      </ETA>
                    </VesselInfoDto>
                  </xsl:for-each>
                </xsl:if>

              </VesselInfo>
            </ShipmentInfo>
          </xsl:for-each>
        </Shipments>
      </ShipmentDto>
    </xsl:for-each>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0, string param1)
{
   return param0 + param1;
}


public string StringConcat(string param0)
{
   return param0;
}

 public static string ConvertDateRequiredValue(string inputDateString)
              {
                string outDateString;
                System.DateTime dt = DateTime.ParseExact(inputDateString, "yyyy-MM-ddTHH:mm:ss", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  
              



]]>
  </msxsl:script>
</xsl:stylesheet>