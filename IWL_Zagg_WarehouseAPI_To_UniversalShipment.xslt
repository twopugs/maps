<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/WarehouseOrder"/>
	</xsl:template>
	<xsl:template match="/WarehouseOrder">
		<UniversalShipment>
			<Shipment>
				<DataContext>
					<DataTargetCollection>
						<DataTarget>
							<Type>
								<xsl:value-of select="'WarehouseOrder'"/>
							</Type>
						</DataTarget>
					</DataTargetCollection>
				</DataContext>
				<LocalProcessing>
					<DeliveryRequiredBy>
						<xsl:value-of select="concat(shipByDate/text(),'T00:00:00')"/>
					</DeliveryRequiredBy>
				</LocalProcessing>
				<ShipmentIncoTerm>
					<Code>
						<xsl:value-of select="incoterms/text()"/>
					</Code>
				</ShipmentIncoTerm>
				<xsl:if test="Instructions/text()">
					<NoteCollection>
						<Note>
							<NoteText>
								<xsl:value-of select="Instructions/text()"/>
							</NoteText>
							<Description>Delivery Instruction</Description>
						</Note>
					</NoteCollection>
				</xsl:if>
				<Order>
					<Warehouse>
						<Code>
							<xsl:value-of select="'BNE'"/>
						</Code>
					</Warehouse>
					<OrderNumber>
						<xsl:value-of select="invoice/text()"/>
					</OrderNumber>
					<ClientReference>
						<xsl:value-of select="poNumber/text()"/>
					</ClientReference>
					<OrderLineCollection>
						<xsl:for-each select="items">
							<OrderLine>
								<OrderedQty>
									<xsl:value-of select="qty/text()"/>
								</OrderedQty>
								<OrderedQtyUnit>
									<Code>
										<xsl:value-of select="uom/text()"/>
									</Code>
								</OrderedQtyUnit>
								<Product>
									<Code>
										<xsl:value-of select="sku/text()"/>
									</Code>
								</Product>
                <UnitPriceAfterDiscount>
                  <xsl:value-of select="price/text()"/>
                  </UnitPriceAfterDiscount>
                <CustomizedFieldCollection>
                  <CustomizedField>
                    <Key>LineNumber</Key>
                    <DataType>String</DataType>
                    <Value>
                      <xsl:value-of select="lineNumber/text()"/>
                    </Value>
                  </CustomizedField>
                </CustomizedFieldCollection>
                 
              </OrderLine>
						</xsl:for-each>
					</OrderLineCollection>
				</Order>
        <CustomizedFieldCollection>
          <CustomizedField>
            <Key>Ship Method</Key>
            <DataType>String</DataType>
            <Value>
              <xsl:value-of select="shipMethod/text()"/>
            </Value>
          </CustomizedField>
          <CustomizedField>
            <Key>Customer Number</Key>
            <DataType>String</DataType>
            <Value>
              <xsl:value-of select="customerNumber/text()"/>
            </Value>
          </CustomizedField>
          <CustomizedField>
            <Key>INCO Term</Key>
            <DataType>String</DataType>
            <Value>
              <xsl:value-of select="incoterms/text()"/>
            </Value>
          </CustomizedField>
        </CustomizedFieldCollection>
          <OrganizationAddressCollection>
					<OrganizationAddress>
						<AddressType>
							<xsl:value-of select="'TransportCompanyDocumentaryAddress'"/>
						</AddressType>
						<OrganizationCode>
							<xsl:value-of select="ship_method/text()"/>
						</OrganizationCode>
					</OrganizationAddress>
					<OrganizationAddress>
						<AddressType>
							<xsl:value-of select="'ConsignorDocumentaryAddress'"/>
						</AddressType>
						<OrganizationCode>
							<xsl:value-of select="'ZAGG'"/>
						</OrganizationCode>
					</OrganizationAddress>
					<OrganizationAddress>
						<AddressType>
							<xsl:value-of select="'ConsigneeAddress'"/>
						</AddressType>
						<AddressOverride>true</AddressOverride>
						<CompanyName>
							<xsl:value-of select="shipToCompany/text()"/>
						</CompanyName>
						<Address1>
							<xsl:value-of select="shipToAddress/text()"/>
						</Address1>
						<City>
							<xsl:value-of select="shipToCity/text()"/>
						</City>
						<State>
							<xsl:value-of select="shipToState/text()"/>
						</State>
						<Country>
							<Code>
								<xsl:value-of select="shipToCountry/text()"/>
							</Code>
						</Country>
						<Postcode>
							<xsl:value-of select="shipToPostCode/text()"/>
						</Postcode>
						<Contact>
							<xsl:value-of select="shipToContactName/text()"/>
						</Contact>
						<Phone>
							<xsl:value-of select="shipToPhone/text()"/>
						</Phone>
						<OrganizationCode>
							<xsl:value-of select="ship_method/text()"/>
						</OrganizationCode>
					</OrganizationAddress>
				</OrganizationAddressCollection>
			</Shipment>
		</UniversalShipment>
	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public string DateCurrentDateTime()
{
     string outValue = string.Empty;
            var dateTimeValue = DateTime.Parse(System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("HH:mm"));
            var dayValue = DateTime.Parse(System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString()).DayOfWeek;
            var compareValue = DateTime.Parse("15:30");
            
            if (dateTimeValue <= compareValue)
            {
                 outValue = System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-ddTHH:mm:ss");
            }
            else 
            {
              outValue = System.TimeZoneInfo.ConvertTime(DateTime.Now.AddDays(1), TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-ddTHH:mm:ss");
              if (dayValue == DayOfWeek.Friday)
              {
                    outValue = System.TimeZoneInfo.ConvertTime(DateTime.Now.AddDays(3), TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-ddTHH:mm:ss");
              }  
             }
            
            return outValue;
}



]]></msxsl:script>
</xsl:stylesheet>
