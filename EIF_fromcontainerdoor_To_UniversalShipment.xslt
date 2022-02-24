<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
              	xmlns:msxsl="urn:schemas-microsoft-com:xslt"
              	xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var"
              	exclude-result-prefixes="msxsl var userCSharp"
              	version="1.0"
              	xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11"
              	xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes"
          		method="xml"
          		version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/ORDER" />
	</xsl:template>
	<xsl:template match="/ORDER">
		<xsl:variable name="var:v1"
            			select="userCSharp:StringConcat(&quot;DebtorID&quot;)" />
		<xsl:variable name="var:v2"
            			select="userCSharp:StringConcat(&quot;CustomerID&quot;)" />
		<xsl:variable name="var:v3"
            			select="userCSharp:StringConcat(&quot;string&quot;)" />
		<xsl:variable name="var:v4"
            			select="userCSharp:StringConcat(&quot;Special Instructions&quot;)" />
		<xsl:variable name="var:v5"
            			select="userCSharp:StringConcat(&quot;ConsigneeAddress&quot;)" />
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
						<xsl:choose>
							<xsl:when test="string-length(SOH/RequiredDate/text())>0">
								<xsl:value-of select="userCSharp:ConvertDateValue(SOH/RequiredDate/text())" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="userCSharp:ConvertDateValue(SOH/ETA/text())" />
							</xsl:otherwise>
						</xsl:choose>
					</DeliveryRequiredBy>
				</LocalProcessing>
				<Order>
					<OrderNumber>
						<xsl:value-of select="SOH/OrderID/text()" />
					</OrderNumber>
					<ClientReference>
						<xsl:value-of select="SOH/CustRef/text()" />
					</ClientReference>
					<OrderLineCollection>
						<xsl:for-each select="SOL/Line">
							<OrderLine>
								<LineNumber>
									<xsl:value-of select="LineNo/text()" />
								</LineNumber>
								<OrderedQty>
									<xsl:value-of select="Quantity/text()" />
								</OrderedQty>
								<Product>
									<Code>
										<xsl:value-of select="WhsStockCode/text()" />
									</Code>
								</Product>
							</OrderLine>
						</xsl:for-each>
					</OrderLineCollection>
					<Warehouse>
						<Code>
							<xsl:value-of select="string('AKL')" />
						</Code>
					</Warehouse>
				</Order>
				<CustomizedFieldCollection>
					<CustomizedField>
						<Key>
							<xsl:value-of select="$var:v1" />
						</Key>
						<DataType>
							<xsl:value-of select="$var:v3" />
						</DataType>
						<Value>
							<xsl:value-of select="SOH/DebtorID/text()" />
						</Value>
					</CustomizedField>
					<CustomizedField>
						<Key>
							<xsl:value-of select="$var:v2" />
						</Key>
						<DataType>
							<xsl:value-of select="$var:v3" />
						</DataType>
						<Value>
							<xsl:value-of select="SOH/CustomerID/text()" />
						</Value>
					</CustomizedField>
				</CustomizedFieldCollection>
				<xsl:if test='SOH/SpecialInstructions/text()'>
					<NoteCollection>
						<Note>
							<Description>
								<xsl:value-of select="$var:v4" />
							</Description>
							<NoteText>
								<xsl:value-of select="SOH/SpecialInstructions/text()" />
							</NoteText>
							<IsCustomDescription>false</IsCustomDescription>
						</Note>
					</NoteCollection>
				</xsl:if>
				<OrganizationAddressCollection>
					<OrganizationAddress>
						<AddressType>
							<xsl:value-of select="$var:v5" />
						</AddressType>
						<Address1>
							<xsl:value-of select="SOH/DebtorAdd1/text()" />
						</Address1>
						<Address2>
							<xsl:value-of select="SOH/DebtorSuburb/text()" />
						</Address2>
						<AddressOverride>
							<xsl:value-of select="string('true')" />
						</AddressOverride>
						<City>
							<xsl:value-of select="SOH/DebtorCity/text()" />
						</City>
						<CompanyName>
							<xsl:value-of select="SOH/DebtorName/text()" />
						</CompanyName>
						<Country>
							<Name>
								<xsl:value-of select="SOH/DebtorCountry/text()" />
							</Name>
							<Code/>
						</Country>
						<Email>
							<xsl:value-of select="SOH/VIPEmail/text()" />
						</Email>
						<Phone>
							<xsl:value-of select="SOH/DebtorPhone/text()" />
						</Phone>
						<Postcode>
							<xsl:value-of select="SOH/DebtorPostCode/text()" />
						</Postcode>
						<State>
							<xsl:value-of select="SOH/DebtorState/text()" />
						</State>
					</OrganizationAddress>
					<OrganizationAddress>
						<AddressType>
							<xsl:value-of select="string('ConsignorDocumentaryAddress')" />
						</AddressType>
						<OrganizationCode>
							<xsl:value-of select="string('CONDOOAKL')" />
						</OrganizationCode>
					</OrganizationAddress>
					<OrganizationAddress>
						<AddressType>
							<xsl:value-of select="string('TransportCompanyDocumentaryAddress')" />
						</AddressType>
						<OrganizationCode>
							<xsl:choose>
								<xsl:when test="SOH/Carrier/text()='FLIWAY'">
									<xsl:value-of select="string('FLIINTAKL')" />
								</xsl:when>
								<xsl:when test="SOH/Carrier/text()='MAINFREIGHT'">
									<xsl:value-of select="string('MAIINTAKL')" />
								</xsl:when>
								<xsl:when test="SOH/Carrier/text()='ONSEND'">
									<xsl:value-of select="string('ONSENDAKL')" />
								</xsl:when>
							</xsl:choose>
						</OrganizationCode>
					</OrganizationAddress>
				</OrganizationAddressCollection>
			</Shipment>
		</UniversalShipment>
	</xsl:template>
	<msxsl:script language="C#"
            		implements-prefix="userCSharp">
		<![CDATA[
public string StringConcat(string param0)
{
   return param0;
}

  public static string ConvertDateValue(string inputDateString)
              {
			  string outDateString;
              if(inputDateString.Length != 0)
{			  
                System.DateTime dt = DateTime.ParseExact(inputDateString, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");
}
else{
             outDateString = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");

}
                return outDateString;
              }  

]]></msxsl:script>
</xsl:stylesheet>