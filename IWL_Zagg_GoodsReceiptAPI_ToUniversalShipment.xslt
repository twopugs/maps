<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/GoodsReceipt"/>
	</xsl:template>
	<xsl:template match="/GoodsReceipt">
		<UniversalShipments>
			<xsl:for-each select="WarehouseOrder">
				<UniversalShipment>
					<Shipment>
						<DataContext>
							<DataTargetCollection>
								<DataTarget>
									<Type>
										<xsl:value-of select="'WarehouseReceive'"/>
									</Type>
								</DataTarget>
							</DataTargetCollection>
						</DataContext>
						<LocalProcessing>
							<DeliveryRequiredBy>
								<xsl:value-of select="concat(po_date/text(),'T00:00:00')"/>
							</DeliveryRequiredBy>
						</LocalProcessing>
						<Order>
							<Warehouse>
								<Code>
									<xsl:value-of select="'BNE'"/>
								</Code>
							</Warehouse>
              <OrderNumber></OrderNumber>
              <ClientReference>
								<xsl:value-of select="po_number/text()"/>
							</ClientReference>
							<DateCollection>
								<Date>
									<Value>
										<xsl:value-of select="eta_date/text()"/>
									</Value>
									<Type>Arrival</Type>
									<IsEstimate>true</IsEstimate>
								</Date>
							</DateCollection>
							<OrderLineCollection>
								<xsl:for-each select="lineitems">
									<OrderLine>
										<LineNumber>
											<xsl:value-of select="line_number/text()"/>
										</LineNumber>
										<OrderedQty>
											<xsl:value-of select="quantity/text()"/>
										</OrderedQty>
										<PackageQtyUnit>
											<Code>
												<xsl:value-of select="uom/text()"/>
											</Code>
										</PackageQtyUnit>
										<xsl:if test="lot_number">
											<PartAttribute1>
												<xsl:value-of select="lot_number/text()"/>
											</PartAttribute1>
										</xsl:if>
										<Product>
											<Code>
												<xsl:value-of select="item_number/text()"/>
											</Code>
											<Description>
												<xsl:value-of select="item_description/text()"/>
											</Description>
										</Product>
									</OrderLine>
								</xsl:for-each>
							</OrderLineCollection>
						</Order>
						<CustomizedFieldCollection>
							<CustomizedField>
								<Value>
									<xsl:value-of select="organization_id/text()"/>
								</Value>
								<DataType>String</DataType>
								<Key>Organisation ID</Key>
							</CustomizedField>
							<CustomizedField>
								<Value>
									<xsl:value-of select="origin_id/text()"/>
								</Value>
								<DataType>String</DataType>
								<Key>Origin ID</Key>
							</CustomizedField>
							<CustomizedField>
								<Value>
									<xsl:value-of select="po_type_id/text()"/>
								</Value>
								<DataType>String</DataType>
								<Key>PO Type ID</Key>
							</CustomizedField>
							<CustomizedField>
								<Value>
									<xsl:value-of select="ship_method/text()"/>
								</Value>
								<DataType>String</DataType>
								<Key>Shipment Method</Key>
							</CustomizedField>
							<CustomizedField>
								<Value>
									<xsl:value-of select="location_id/text()"/>
								</Value>
								<DataType>String</DataType>
								<Key>Location ID</Key>
							</CustomizedField>
							<CustomizedField>
								<Value>
									<xsl:value-of select="transfer_from_site/text()"/>
								</Value>
								<DataType>String</DataType>
								<Key>Transfer From Site</Key>
							</CustomizedField>
							<CustomizedField>
								<Value>
									<xsl:value-of select="transfer_to_site/text()"/>
								</Value>
								<DataType>String</DataType>
								<Key>Transfer To Site</Key>
							</CustomizedField>
							<CustomizedField>
								<Value>
									<xsl:value-of select="vendor_id/text()"/>
								</Value>
								<DataType>String</DataType>
								<Key>Vendor ID</Key>
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
						</OrganizationAddressCollection>
					</Shipment>
				</UniversalShipment>
			</xsl:for-each>
		</UniversalShipments>
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