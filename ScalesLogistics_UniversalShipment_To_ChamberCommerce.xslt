<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 json userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp" xmlns:json='http://james.newtonking.com/projects/json'>
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalInterchange" />
  </xsl:template>
  <xsl:template match="/s0:UniversalInterchange">
    <xsl:for-each select="s0:Body/s0:UniversalShipment">
      <xsl:variable name="vPortOfDestination" select="userCSharp:getAgreementType(substring(s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PortOfDestination/s0:Code/text(),1,2))" />

      <xsl:choose>
        <xsl:when test="$vPortOfDestination='AANZFTA'">
          <ChamberCommerce_AANZFTA>
            <consignee>
              <buildingOrStreetNumber>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:Address1"/>
              </buildingOrStreetNumber>
              <city>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:City"/>
              </city>
              <countryIsoCode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:Country/s0:Code"/>
              </countryIsoCode>
              <name>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:CompanyName"/>
              </name>
              <postcode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:PostCode"/>
              </postcode>
              <streetAddress>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:Address1"/>
              </streetAddress>
              <suburb>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:Address2"/>
              </suburb>
            </consignee>
            <eCertifyCompanyReference>
              <!-- <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key"/> -->
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC eCertifyCompanyReference']/s0:Value"/>
            </eCertifyCompanyReference>
            <exporter>
              <buildingOrStreetNumber>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
              </buildingOrStreetNumber>
              <city>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:City"/>
              </city>
              <countryIsoCode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Code"/>
              </countryIsoCode>
              <name>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:CompanyName"/>
              </name>
              <postcode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:PostCode"/>
              </postcode>
              <streetAddress>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
              </streetAddress>
              <suburb>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address2"/>
              </suburb>
            </exporter>

            <isDraft>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Draft']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Draft']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>
            </isDraft>
         <xsl:for-each select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine">
            <items json:Array='true'>
                <goodsDescription>
                  <xsl:value-of select="s0:Description"/>
                </goodsDescription>
                <grossWeight>
                  <xsl:value-of select="s0:Weight"/>
                </grossWeight>
                <hsCode>
                  <xsl:value-of select="substring(normalize-space(userCSharp:stringReplace(normalize-space(s0:HarmonisedCode))),1,6)"/>
                </hsCode>
                <invoiceCurrencyIsoCode>
                  <xsl:value-of select="../../s0:InvoiceCurrency/s0:Code"/>
                </invoiceCurrencyIsoCode>
                <invoiceDate>
                  <xsl:value-of select="../../s0:InvoiceDate"/>
                </invoiceDate>
                <invoiceNumber>
                  <xsl:value-of select="../../s0:InvoiceNumber"/>
                </invoiceNumber>
                <invoiceValue>
                  <xsl:value-of select="s0:LinePrice"/>
                </invoiceValue>
                <originCriterionName>
                  <xsl:value-of select="../../../../../s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Origin Criterion Name']/s0:Value"/>
                </originCriterionName>
                <packageMarkings>
                  <xsl:value-of select="s0:Weight"/>
                </packageMarkings>
                <quantity>
                  <xsl:value-of select="s0:InvoiceQuantity"/>
                </quantity>
                <quantityUnitName>
                  <xsl:value-of select="'Number of Packs'"/>
                </quantityUnitName>
                <weightUnitName>
                  <xsl:value-of select="s0:WeightUnit/s0:Description"/>
                </weightUnitName>
            </items>
            </xsl:for-each>
            <remarks>
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Remarks']/s0:Value"/>
            </remarks>
            <signatoryEmail>
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Signatory Email']/s0:Value"/>
            </signatoryEmail>
            <retroactive>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC  Is Retroactive']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC  Is Retroactive']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>              
            </retroactive>
            <backToBack>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Back to Back']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Back to Back']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>              
            </backToBack>
            <backToBackIntermediaryCountryIsoCode>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Back to Back Intermediary']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Back to Back Intermediary']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>
              </backToBackIntermediaryCountryIsoCode>
            <thirdParty>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Third Party']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Third Party']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>            
            </thirdParty>
            <thirdPartyInvoicingCompany>
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Third Party Inv Company']/s0:Value"/>
            </thirdPartyInvoicingCompany>
            <deMinimis>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC deMinimis']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC deMinimis']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>              
            </deMinimis>
            <accumulation>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Accumulation']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Accumulation']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>              
            </accumulation>

            <specialInstructions>
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Special Instructions']/s0:Value"/>
            </specialInstructions>
            <transport>
              <modeOfTransport>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:TransportMode"/>
              </modeOfTransport>
              <portOfDischargeCode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfDischarge/s0:Code"/>
              </portOfDischargeCode>
              <portOfLoadingCode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfLoading/s0:Code"/>
              </portOfLoadingCode>
              <shipmentDate>
                <xsl:choose>
                  <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:ActualDeparture/text()">
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:ActualDeparture"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:EstimatedDeparture"/>
                  </xsl:otherwise>
                </xsl:choose>
              </shipmentDate>
              <countryOfDischargeIsoCode>
                <xsl:value-of select="substring(s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfDischarge/s0:Code,1,2)"/>
              </countryOfDischargeIsoCode>
              <enRoutePorts>true</enRoutePorts>
              <vesselName>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:VesselName"/>
              </vesselName>
            </transport>
          </ChamberCommerce_AANZFTA>
        </xsl:when>
        <xsl:when test="$vPortOfDestination='NZCFTA'">
          <ChamberCommerce_NZCFTA>
            <consignee>
              <buildingOrStreetNumber>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:Address1"/>
              </buildingOrStreetNumber>
              <city>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:City"/>
              </city>
              <countryIsoCode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:Country/s0:Code"/>
              </countryIsoCode>
              <name>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:CompanyName"/>
              </name>
              <postcode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:PostCode"/>
              </postcode>
              <streetAddress>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:Address1"/>
              </streetAddress>
              <suburb>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']/s0:Address2"/>
              </suburb>
            </consignee>
            <eCertifyCompanyReference>
              <!-- <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key"/> -->
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC eCertifyCompanyReference']/s0:Value"/>
            </eCertifyCompanyReference>
            <exporter>
              <buildingOrStreetNumber>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
              </buildingOrStreetNumber>
              <city>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:City"/>
              </city>
              <countryIsoCode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Code"/>
              </countryIsoCode>
              <name>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:CompanyName"/>
              </name>
              <postcode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:PostCode"/>
              </postcode>
              <streetAddress>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
              </streetAddress>
              <suburb>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address2"/>
              </suburb>
            </exporter>
            <xsl:if test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC First Producer Criteria']/s0:Value/text()='Details' and s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Draft']/s0:Value/text()='false'">
            <firstProducer>
              <buildingOrStreetNumber>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
              </buildingOrStreetNumber>
              <city>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:City"/>
              </city>
              <countryIsoCode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Country/s0:Code"/>
              </countryIsoCode>
              <name>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:CompanyName"/>
              </name>
              <postcode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:PostCode"/>
              </postcode>
              <streetAddress>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address1"/>
              </streetAddress>
              <suburb>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']/s0:Address2"/>
              </suburb>
            </firstProducer>
            </xsl:if>
            <xsl:if test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC First Producer Criteria']/s0:Value/text()">
              <firstProducerCriteria>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC First Producer Criteria']/s0:Value"/>
              </firstProducerCriteria>
            </xsl:if>
            <isDraft>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Draft']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Draft']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>
            </isDraft>
            
            <xsl:for-each select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine">
            <items json:Array='true'>
                <goodsDescription>
                  <xsl:value-of select="s0:Description"/>
                </goodsDescription>
                <grossWeight>
                  <xsl:value-of select="s0:Weight"/>
                </grossWeight>
                <hsCode>
                  <xsl:value-of select="substring(normalize-space(userCSharp:stringReplace(normalize-space(s0:HarmonisedCode))),1,6)"/>
                </hsCode>
                <invoiceCurrencyIsoCode>
                  <xsl:value-of select="../../s0:InvoiceCurrency/s0:Code"/>
                </invoiceCurrencyIsoCode>
                <invoiceDate>
                  <xsl:value-of select="../../s0:InvoiceDate"/>
                </invoiceDate>
                <invoiceNumber>
                  <xsl:value-of select="../../s0:InvoiceNumber"/>
                </invoiceNumber>
                <invoiceValue>
                  <xsl:value-of select="s0:LinePrice"/>
                </invoiceValue>
                <originCriterionName>
                  <xsl:value-of select="../../../../../s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Origin Criterion Name']/s0:Value"/>
                </originCriterionName>
                <packageMarkings>
                  <xsl:value-of select="s0:Weight"/>
                </packageMarkings>
                <quantity>
                  <xsl:value-of select="s0:InvoiceQuantity"/>
                </quantity>
                <quantityUnitName>
                  <xsl:value-of select="'Number of Packs'"/>
                </quantityUnitName>
                <weightUnitName>
                  <xsl:value-of select="s0:WeightUnit/s0:Description"/>
                </weightUnitName>
            </items>
            </xsl:for-each>
            <remarks>
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Remarks']/s0:Value"/>
            </remarks>
            <signatoryEmail>
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Signatory Email']/s0:Value"/>
            </signatoryEmail>
            <retroactive>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC  Is Retroactive']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC  Is Retroactive']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>
            </retroactive>
            <backToBack>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Back to Back']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Back to Back']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>
            </backToBack>
            <backToBackIntermediaryCountryIsoCode>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Back to Back Intermediary']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Back to Back Intermediary']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>
            </backToBackIntermediaryCountryIsoCode>
            <thirdParty>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Third Party']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Third Party']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>
            </thirdParty>
            <thirdPartyInvoicingCompany>
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Third Party Inv Company']/s0:Value"/>
            </thirdPartyInvoicingCompany>
            <deMinimis>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC deMinimis']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC deMinimis']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>
            </deMinimis>
            <accumulation>
              <xsl:choose>
                <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Accumulation']/s0:Value/text()">
                  <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Accumulation']/s0:Value"/>
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
              </xsl:choose>
            </accumulation>

            <specialInstructions>
              <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='NZCC Special Instructions']/s0:Value"/>
            </specialInstructions>
            <transport>
              <modeOfTransport>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:TransportMode"/>
              </modeOfTransport>
              <portOfDischargeCode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfDischarge/s0:Code"/>
              </portOfDischargeCode>
              <portOfLoadingCode>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfLoading/s0:Code"/>
              </portOfLoadingCode>
              <shipmentDate>
                <xsl:choose>
                  <xsl:when test="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:ActualDeparture/text()">
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:ActualDeparture"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:EstimatedDeparture"/>
                  </xsl:otherwise>
                </xsl:choose>
              </shipmentDate>
              <countryOfDischargeIsoCode>
                <xsl:value-of select="substring(s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:PortOfDischarge/s0:Code,1,2)"/>
              </countryOfDischargeIsoCode>
              <enRoutePorts>true</enRoutePorts>
              <vesselName>
                <xsl:value-of select="s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TransportLegCollection/s0:TransportLeg/s0:VesselName"/>
              </vesselName>
            </transport>
          </ChamberCommerce_NZCFTA>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string stringReplace(string param0)
{
 
   return param0.Replace(".","");
}

public static string getAgreementType(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> AgreementType=new System.Collections.Generic.Dictionary<string,string>();
     
AgreementType.Add("AU","AANZFTA");
AgreementType.Add("BN","AANZFTA");
AgreementType.Add("KH","AANZFTA");
AgreementType.Add("ID","AANZFTA");
AgreementType.Add("LA","AANZFTA");
AgreementType.Add("MY","AANZFTA");
AgreementType.Add("MM","AANZFTA");
AgreementType.Add("PH","AANZFTA");
AgreementType.Add("SG","AANZFTA");
AgreementType.Add("TH","AANZFTA");
AgreementType.Add("VN","AANZFTA");
AgreementType.Add("CN","NZCFTA");


  if (AgreementType.ContainsKey(inputDataString))
       outDataString = AgreementType[inputDataString];
     return outDataString;
 }


]]>
  </msxsl:script>
</xsl:stylesheet>
