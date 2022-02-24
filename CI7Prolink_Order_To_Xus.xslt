<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://CI7Order_FF" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0"/>
	<xsl:key name="groups" match="CI7Orders_Order" use="OrderNumber"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:CI7Orders"/>
	</xsl:template>
	<xsl:template match="/s0:CI7Orders">
		<UniversalShipments>
			<xsl:for-each select="CI7Orders_Order[generate-id(.)=generate-id(key('groups',OrderNumber))]">
				<UniversalShipment>
					<Shipment>
						<DataContext>
							<DataTargetCollection>
								<DataTarget>
									<Type>
										<xsl:value-of select="string('WarehouseOrder')"/>
									</Type>
								</DataTarget>
							</DataTargetCollection>
						</DataContext>
						<LocalProcessing>
							<DeliveryRequiredBy>
								<xsl:value-of select="userCSharp:ConvertDateRequiredValue(DeliveryStartDate/text())"/>
							</DeliveryRequiredBy>
						</LocalProcessing>
						<Order>
							<OrderNumber>
								<xsl:value-of select="OrderNumber/text()"/>
							</OrderNumber>
							<ClientReference>
								<xsl:value-of select="RetailersOrderNumber/text()"/>
							</ClientReference>
							<Warehouse>
								<Code>
									<xsl:value-of select="string('AKL')"/>
								</Code>
							</Warehouse>
							<OrderLineCollection>
								<xsl:for-each select="key('groups',OrderNumber)">
									<OrderLine>
										<OrderedQty>
											<xsl:value-of select="OrderedQnty/text()"/>
										</OrderedQty>
										<Product>
											<Code>
												<xsl:value-of select="ProductCode/text()"/>
											</Code>
										</Product>
										<UnitPriceAfterDiscount>
											<xsl:value-of select="RetailPrice/text()"/>
										</UnitPriceAfterDiscount>
									</OrderLine>
								</xsl:for-each>
							</OrderLineCollection>
						</Order>
						<OrganizationAddressCollection>
							<xsl:variable name="var:v3" select="userCSharp:StringConcat(&quot;ConsigneeAddress&quot;)"/>
							<OrganizationAddress>
								<AddressType>
									<xsl:value-of select="$var:v3"/>
								</AddressType>
								<AddressOverride>
									<xsl:value-of select="string('true')"/>
								</AddressOverride>
								<SuppressAddressValidationError>
									<xsl:value-of select="string('true')"/>
								</SuppressAddressValidationError>
								<Address1>
									<xsl:value-of select="ShipToAdd1/text()"/>
								</Address1>
								<Address2>
									<xsl:value-of select="ShipToAdd2/text()"/>
								</Address2>
								<City>
									<xsl:value-of select="ShipToCity/text()"/>
								</City>
								<CompanyName>
									<xsl:value-of select="ShipToName/text()"/>
								</CompanyName>
								<Country>
									<Code>
										<xsl:value-of select="ShipToCountry/text()"/>
									</Code>
								</Country>
								<Postcode>
									<xsl:value-of select="ShipToPostalCode/text()"/>
								</Postcode>
								<State>
									<xsl:value-of select="ShipToState/text()"/>
								</State>
							</OrganizationAddress>
							<OrganizationAddress>
								<AddressType>
									<xsl:value-of select="string('SendersLocalClient')"/>
								</AddressType>
								<OrganizationCode>PROLINAKL</OrganizationCode>
							</OrganizationAddress>
							<OrganizationAddress>
								<AddressType>
									<xsl:value-of select="string('ConsignorDocumentaryAddress')"/>
								</AddressType>
								<OrganizationCode>PROLINAKL</OrganizationCode>
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

 public static string ConvertDateRequiredValue(string inputDateString)
              {
                string outDateString;
                System.DateTime dt = DateTime.ParseExact(inputDateString, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  



]]></msxsl:script>
</xsl:stylesheet>