<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:key use="InvoiceNumber" match="Root/Detail" name="groups"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/Root" />
	</xsl:template>
	<xsl:template match="/Root">
		<UniversalShipment>
			<xsl:for-each select ="Detail[generate-id(.)=generate-id(key('groups',InvoiceNumber))]">
				<Shipment>
					<DataContext>
						<DataTargetCollection>
							<DataTarget>
								<Type>WarehouseOrder</Type>
							</DataTarget>
						</DataTargetCollection>
					</DataContext>
					<Order>
						<OrderNumber>
							<xsl:value-of select="InvoiceNumber/text()" />
						</OrderNumber>
						<ClientReference>
							<xsl:value-of select="Reference/text()" />
						</ClientReference>
						<Warehouse>
							<Code>AKL</Code>
						</Warehouse>
						<OrderLineCollection>
							<xsl:for-each select="key('groups',InvoiceNumber)">
								<OrderLine>
									<Product>
										<Code>
											<xsl:value-of select="InventoryItemCode/text()" />
										</Code>
									</Product>
									<OrderedQty>
										<xsl:value-of select="Quantity/text()" />
									</OrderedQty>
                <PartAttribute1>Xero</PartAttribute1>
								</OrderLine>
							</xsl:for-each>  
						</OrderLineCollection>
					</Order>
					<OrganizationAddressCollection>
						<OrganizationAddress>
							<AddressType>ConsignorDocumentaryAddress</AddressType>
							<OrganizationCode>SUPHUBAKL</OrganizationCode>
						</OrganizationAddress>
						<OrganizationAddress>
							<AddressType>ConsigneeAddress</AddressType>
							<SuppressAddressValidationError>true</SuppressAddressValidationError>
							 <AddressOverride>true</AddressOverride>
                <CompanyName>
								<xsl:value-of select="ContactName/text()" />
							</CompanyName>
							<Contact>
								<xsl:value-of select="Attention/text()" />
							</Contact>
							<Address1>
								<xsl:value-of select="SAAddressLine1/text()" />
							</Address1>
							<Address2>
								<xsl:value-of select="SAAddressLine2/text()" />
							</Address2>
							<xsl:if test="SACity/text()!=''">
								<City>
									<xsl:value-of select="SACity/text()" />
								</City>
							</xsl:if>
							<xsl:if test="SACity/text()=''">
								<City>
									<xsl:value-of select="SARegion/text()" />
								</City>
							</xsl:if>
							<Postcode>
								<xsl:value-of select="SAPostalCode/text()" />
							</Postcode>
               <State></State>
							<Country>
								<Name>
									<xsl:value-of select="SACountry/text()" />
								</Name>
								<Code>NZ</Code>
							</Country>
						</OrganizationAddress>
					</OrganizationAddressCollection>
				</Shipment>
			</xsl:for-each>  
		</UniversalShipment>
	</xsl:template>

	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[
///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/



 public string Add(string OrderedQnty,string QuantityMetFromCW, string param2, string param3)
        {
            int param5 = 0;
            int QuantityMet = 0;
            int QuantityMetFromST = 0;

            if (param2.Length == 0)
            {
                QuantityMetFromST = 0;
            }
            else
            {
                QuantityMetFromST = Convert.ToInt32(param2);
            }
            if (param3 == "YES")
            {
                param5 = Convert.ToInt32(OrderedQnty);
            }
            else if (param3 == "")
            {
             QuantityMet = Convert.ToInt32(OrderedQnty);
                param5 = QuantityMet;
            }
            else
            {
             QuantityMet = Convert.ToInt32(QuantityMetFromCW);
                param5 = QuantityMet + QuantityMetFromST;
            }
            return param5.ToString();
        }

]]>
	</msxsl:script>
</xsl:stylesheet>