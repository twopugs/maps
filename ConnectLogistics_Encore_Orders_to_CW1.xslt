<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/orderMessage" />
	</xsl:template>
	<xsl:template match="/orderMessage">
		<UniversalShipment>
				<Shipment>
					<DataContext>
						<DataTargetCollection>
							<DataTarget>
								<Type>WarehouseOrder</Type>
							</DataTarget>
						</DataTargetCollection>
						<Company>
							<Code>MLL</Code>
							<Country>
								<Code>ZA</Code>
							</Country>
						</Company>
						<DataProvider>Encore</DataProvider>
						<EnterpriseID>OGS</EnterpriseID>
						<ServerID>PRD</ServerID>
						<EventBranch>
							<Code>MLL</Code>
						</EventBranch>
					</DataContext>
					<LocalProcessing>
							<DeliveryRequiredBy>
								<!-- <xsl:value-of select="userCSharp:FormatDateTime(order/orderIdentification/orderDate/text())" /> -->
								<xsl:value-of select="concat(substring(order/orderIdentification/orderDate,1,4),'-', substring(order/orderIdentification/orderDate,5,2), '-', substring(order/orderIdentification/orderDate,7,2))" />
							</DeliveryRequiredBy>
					</LocalProcessing>
					<Order>
						<OrderNumber>
							<xsl:value-of select="order/orderIdentification/orderNo/text()" />
						</OrderNumber>
						<ClientReference>
							<xsl:value-of select="order/orderIdentification/deliveryNumber/text()" />
						</ClientReference>
						<Warehouse>
							<Code>
								<xsl:value-of select="order/warehouse/text()" />
							</Code>
						</Warehouse>
						<OrderLineCollection>
							<xsl:for-each select="order/orderLineItem">
								<OrderLine>
									<LineNumber>
										<xsl:value-of select="lineItemNumber/text()" />
									</LineNumber>
									<Product>
										<Code>
											<xsl:value-of select="transactionalTradeItem/supplierIdentifier/gtin/text()" />
										</Code>
									</Product>
									<OrderedQty>
										<xsl:value-of select="orderdQuantity/text()" />
									</OrderedQty>
									<UnitPriceAfterDiscount>
										<xsl:value-of select="itemPriceExclusive/text()" />
									</UnitPriceAfterDiscount>
								</OrderLine>
							</xsl:for-each>  
						</OrderLineCollection>
					</Order>
					<CustomizedFieldCollection>
						<xsl:if test="order/orderIdentification/deliveryDates/dueDate !=''">
							<CustomizedField>
								<Value>
									<xsl:value-of select="order/orderIdentification/deliveryDates/dueDate/text()" />
								</Value>
								<Key>Due Date</Key>
								<DataType>DateTime</DataType>
							</CustomizedField>
						</xsl:if>
						<xsl:if test="order/orderIdentification/deliveryDates/latestDate !=''">
							<CustomizedField>
								<Value>
									<xsl:value-of select="order/orderIdentification/deliveryDates/latestDate/text()" />
								</Value>
								<Key>Latest Date</Key>
								<DataType>DateTime</DataType>
							</CustomizedField>
						</xsl:if>
						<xsl:if test="order/orderIdentification/deliveryDates/earliestDate !=''">
							<CustomizedField>
								<Value>
									<xsl:value-of select="order/orderIdentification/deliveryDates/earliestDate/text()" />
								</Value>
								<Key>Earliest Date</Key>
								<DataType>DateTime</DataType>
							</CustomizedField>
						</xsl:if>
						<xsl:if test="order/orderIdentification/dcCode !=''">
							<CustomizedField>
								<Value>
									<xsl:value-of select="order/orderIdentification/dcCode/text()" />
								</Value>
								<Key>DC Code</Key>
								<DataType>DateTime</DataType>
							</CustomizedField>
						</xsl:if>
						<xsl:if test="order/orderIdentification/representatives !=''">
							<CustomizedField>
								<Value>
									<xsl:value-of select="order/orderIdentification/representatives/text()" />
								</Value>
								<Key>Representative</Key>
								<DataType>String</DataType>
							</CustomizedField>
						</xsl:if>
						<xsl:if test="standardBusinessDocumentHeader/receiver/gln !=''">
							<CustomizedField>
								<Value>
									<xsl:value-of select="standardBusinessDocumentHeader/receiver/gln/text()" />
								</Value>
								<Key>Receiver</Key>
								<DataType>String</DataType>
							</CustomizedField>
						</xsl:if>
						<xsl:if test="standardBusinessDocumentHeader/sender/gln !=''">
							<CustomizedField>
								<Value>
									<xsl:value-of select="standardBusinessDocumentHeader/sender/gln/text()" />
								</Value>
								<Key>Sender</Key>
								<DataType>String</DataType>
							</CustomizedField>
						</xsl:if>
					</CustomizedFieldCollection>
					<OrganizationAddressCollection>
						<OrganizationAddress>
							<AddressType>ConsignorDocumentaryAddress</AddressType>
							<OrganizationCode>SPAENCDUR</OrganizationCode>
						</OrganizationAddress>
						<OrganizationAddress>
							<AddressType>LocalClient</AddressType>
							<OrganizationCode>SPAENCDUR</OrganizationCode>
						</OrganizationAddress>
						
						<xsl:choose>
							<xsl:when test="order/customer/deliveryPoint/consignee != ''"> 
								<OrganizationAddress>
									<OrganizationCode>
										<xsl:value-of select="order/customer/deliveryPoint/consignee/text()" />
									</OrganizationCode>
									<AddressType>ConsigneeAddress</AddressType>
								</OrganizationAddress>
							</xsl:when>
							<xsl:when test="order/customer/deliveryPoint/deliveryPointName != ''"> 
								<OrganizationAddress>
									<CompanyName>
										<xsl:value-of select="order/customer/deliveryPoint/deliveryPointName/text()" />
									</CompanyName>
									<AddressType>ConsigneeAddress</AddressType>
								</OrganizationAddress>
							</xsl:when>
							<xsl:otherwise>
							</xsl:otherwise>
						</xsl:choose>
					</OrganizationAddressCollection>
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