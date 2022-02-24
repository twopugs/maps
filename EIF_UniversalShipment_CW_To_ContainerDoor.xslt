<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:UniversalInterchange"/>
	</xsl:template>
	<xsl:template match="/s0:UniversalInterchange">
		<xsl:for-each select="s0:Body/s0:UniversalShipment">
			<ORDERCONFIRMATION>
				<SCH>
					<OrderID>
						<xsl:value-of select="s0:Shipment/s0:Order/s0:OrderNumber"/>
					</OrderID>
					<PickNo/>
					<ClientRef/>
					<CustRef>
						<xsl:value-of select="s0:Shipment/s0:Order/s0:ClientReference"/>
					</CustRef>
					<DebtorID>
						<xsl:value-of select="s0:Shipment/s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='DebtorID']/s0:Value"/>
					</DebtorID>
					<DebtorName>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:CompanyName"/>
					</DebtorName>
					<DebtorAdd1>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address1"/>
					</DebtorAdd1>
					<DebtorAdd2>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Address2"/>
					</DebtorAdd2>
					<DebtorSuburb/>
					<DebtorPostCode>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:PostCode"/>
					</DebtorPostCode>
					<DebtorCity>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:City"/>
					</DebtorCity>
					<DebtorState>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:State"/>
					</DebtorState>
					<DebtorCountry>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Country/s0:Name"/>
					</DebtorCountry>
					<SpecialInstructions/>
					<InvoiceName/>
					<InvoiceAdd1/>
					<InvoiceAdd2/>
					<InvoiceSuburb/>
					<InvoicePostCode/>
					<InvoiceCity/>
					<InvoiceState/>
					<InvoiceCountry/>
					<InvoiceContact/>
					<WhsID>96</WhsID>
					<RepCode/>
					<RepName/>
					<OrderDate>
						<xsl:value-of select="userCSharp:GetNZDate()"/>
					</OrderDate>
					<RequiredDate>
						<xsl:value-of select="userCSharp:GetDateValue(s0:Shipment/s0:LocalProcessing/s0:DeliveryRequiredBy)"/>
					</RequiredDate>
					<DateDispatched>
						<xsl:value-of select="userCSharp:GetDateValue(s0:Shipment/s0:LocalProcessing/s0:DeliveryRequiredBy)"/>
					</DateDispatched>
					<OrderLineTotal>
						<xsl:value-of select="count(s0:Shipment/s0:Order/s0:OrderLineCollection/s0:OrderLine)"/>
					</OrderLineTotal>
					<MiscCharge>0</MiscCharge>
					<FreightCharge>0</FreightCharge>
					<GST>0</GST>
					<Comment1/>
					<Comment2/>
					<Comment3/>
					<CarrierRef>
						<xsl:value-of select="s0:Shipment/s0:Order/s0:TransportReference"/>
					</CarrierRef>
					<Pallets/>
					<Weight>
						<xsl:value-of select="s0:Shipment/s0:TotalWeight"/>
					</Weight>
					<Volume>
						<xsl:value-of select="s0:Shipment/s0:TotalVolumne"/>
					</Volume>
					<NetInvoice/>
					<xsl:variable name='carrier' select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='TransportCompanyDocumentaryAddress']/s0:OrganizationCode/text()"/>
					<Carrier>
						<xsl:choose>
							<xsl:when test="$carrier='FLIINTAKL'">
								<xsl:value-of select="string('FLIWAY')"/>
							</xsl:when>
							<xsl:when test="$carrier='MAIINTAKL'">
								<xsl:value-of select="string('MAINFREIGHT')"/>
							</xsl:when>
							<xsl:when test="$carrier='ONSENDAKL'">
								<xsl:value-of select="string('ONSEND')"/>
							</xsl:when>
						</xsl:choose>
					</Carrier>
					<ConnoteNo>
						<xsl:value-of select="s0:Shipment/s0:Order/s0:TransportReference"/>
					</ConnoteNo>
					<ETA>
						<xsl:value-of select="userCSharp:GetDateValue(s0:Shipment/s0:LocalProcessing/s0:DeliveryRequiredBy)"/>
					</ETA>
					<ServiceDesc/>
					<ScanPack>N</ScanPack>
					<CustomerID>
						<xsl:value-of select="s0:Shipment/s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine/s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='CustomerID']/s0:Value"/>
					</CustomerID>
					<ASNReference/>
					<Timeslot>0</Timeslot>
					<BookingFromDate/>
					<BookingToDate/>
					<BookingReference/>
					<BookingComment/>
					<DebtorPhone>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Phone"/>
					</DebtorPhone>
					<VIPEmail>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:Email"/>
					</VIPEmail>
					<PackTypeSent>
						<xsl:value-of select="s0:Shipment/s0:TotalNoOfPacks"/>
					</PackTypeSent>
					<OrderType>E</OrderType>
					<HirePallets/>
					<Urgent>0</Urgent>
					<SCACCode>MFGN</SCACCode>
					<SenderName>Container Door</SenderName>
					<SenderAddress1>24b Greenpark Road</SenderAddress1>
					<SenderAddress2/>
					<SenderSuburb>PENROSE</SenderSuburb>
					<SenderPostCode>1061</SenderPostCode>
					<SenderCity>AUCKLAND</SenderCity>
					<SenderState/>
					<SenderStateCode>NI</SenderStateCode>
					<SenderCountry>New Zealand</SenderCountry>
					<DebtorStateCode>
						<xsl:value-of select="s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']/s0:State"/>
					</DebtorStateCode>
					<TransferWhsID>0</TransferWhsID>
					<DutyFree>0</DutyFree>
					<ConsigneeGroupID/>
					<CallRequired>0</CallRequired>
					<SenderCode>CAVDOOR</SenderCode>
					<ChargeCode>CONDOOR14</ChargeCode>
					<ConsigneeDeliveryLocation/>
					<RouteType/>
					<ContainerNo/>
					<ContainerType/>
					<SealNo/>
				</SCH>
				<SCL>
					<xsl:for-each select="s0:Shipment/s0:Order/s0:OrderLineCollection/s0:OrderLine">
						<Line>
							<OrderID>
								<xsl:value-of select="../s0:OrderNumber"/>
							</OrderID>
							<LineNo>
								<xsl:value-of select="s0:LineNumber"/>
							</LineNo>
							<PickNo>0</PickNo>
							<ClientRef/>
							<WhsStockCode>
								<xsl:value-of select="s0:Product/s0:Code"/>
							</WhsStockCode>
							<WhsStockDesc>
								<xsl:value-of select="s0:Product/s0:Description"/>
							</WhsStockDesc>
							<WhsStockDesc2/>
							<Quantity>
								<xsl:value-of select="s0:QuantityMet"/>
							</Quantity>
							<QuantitySent>
								<xsl:value-of select="s0:QuantityMet"/>
							</QuantitySent>
							<QuantityBackOrd>0</QuantityBackOrd>
							<RRP/>
							<DiscountPrice/>
							<CostPrice/>
							<ExtendedPrice/>
							<MiscChargeDesc/>
							<MiscChargeAmount/>
							<Grade1/>
							<Grade2/>
							<Grade3/>
							<OutboundSerial/>
							<CustStockCode/>
							<PackTypeOrd>
								<xsl:value-of select="s0:PackageQtyUnit/s0:Code"/>
							</PackTypeOrd>
							<Weight>0</Weight>
							<Volume>0</Volume>
							<Notes/>
							<ContingencyPrice/>
							<CustStockDesc/>
							<ExpiryDate/>
							<PackingDate/>
							<KitsetCode/>
							<IntoBond/>
							<LineID>
								<xsl:value-of select="s0:LineNumber"/>
							</LineID>
							<WeightCaptured/>
							<EachBarcode/>
							<InnerBarcode/>
							<CartonBarcode/>
						</Line>
					</xsl:for-each>
				</SCL>
				<SCP/>
				<SCCN/>
				<SCHR/>
			</ORDERCONFIRMATION>
		</xsl:for-each>
	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[
        public static string GetNowDateValue()
        {   
          return System.DateTime.Now.ToString("yyyy-MM-dd");         
        }
        public static string GetLineNumber(string inputDateString)
        {   
          string outDateString;
          int x = 0;
          Int32.TryParse(inputDateString, out x);
          if(x!=0){x=x-1;}
          outDateString=x.ToString();
          return outDateString;         
        }
         public static string GetNowTimeValue()
        {   
          return System.DateTime.Now.ToString("HH:mm:ss");         
        }
        public static string GetDateValue(string inputDateString)
        {
            string outDateString;
            System.DateTime dt=System.Convert.ToDateTime(inputDateString);
            outDateString = dt.ToString("dd/MM/yyyy");
            return outDateString;
        }
        public static string GetTimeValue(string inputDateString)
        {
            string outDateString;
            System.DateTime dt=System.Convert.ToDateTime(inputDateString);
            outDateString = dt.ToString("HH:mm:ss");
            return outDateString;
        }
        public static string GetStateCode(string inputDateString)
        {
           inputDateString=inputDateString.Substring(0, 2);
           return inputDateString;
        }  
        public static string ConvertStringToDecimal(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString = number.ToString("0.00");
           return OutDataString;
        } 
        public static string ConvertStringToDecimalWihout(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString = number.ToString("0");
           return OutDataString;
        } 
        public static string GetRoundUp(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           return System.Math.Ceiling(number).ToString();
        }     
        
        public string GetNZDate()
      {
       return System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("dd/MM/yyyy");
      }
      
      public string GetNZTime()
      {
       return System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("HH:mm:ss");
      }
      public static string CheckFieldLength(string inputDateString)
         {
           string outValue=inputDateString.Trim();
           if(outValue.Length==0)
           {
            outValue=String.Empty;
           }
           return outValue;
          }
      
      public static string CheckStateExist(string inputState)
         {
           string outValue=inputState.Trim();
           if(outValue.Length==0)
           {
            outValue="NZ";
           }
           return outValue;
          }
  

]]>
	</msxsl:script>
</xsl:stylesheet>