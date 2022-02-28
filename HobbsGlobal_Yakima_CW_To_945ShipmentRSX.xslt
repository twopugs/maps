<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11"  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalShipment" />
  </xsl:template>

  <xsl:template match="/s0:UniversalShipment">
    <Shipments>
      <xsl:for-each select="s0:Shipment">
        <Shipment>      
          <Header>
            <ShipmentHeader>
              <TradingPartnerId>11VNONYAKIMAAUS</TradingPartnerId>
              <ShipmentIdentification>
                <xsl:value-of select="s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
              </ShipmentIdentification>
              <ShipDate>
                <xsl:value-of select="userCSharp:GetDateValue(s0:LocalProcessing/s0:DeliveryRequiredBy/text())" />
              </ShipDate>
              <ShipmentTime>
                <xsl:value-of select="userCSharp:GetTimeValue(s0:LocalProcessing/s0:DeliveryRequiredBy/text())" />
              </ShipmentTime>
              <TsetPurposeCode>
                <xsl:value-of select="s0:CustomizedFieldCollection/s0:CustomizedField[s0:Key='TsetPurposeCode' and s0:DataType='String']/s0:Value/text()"/>
              </TsetPurposeCode>
              <ShipNoticeDate>
                <xsl:value-of select="userCSharp:GetNZDate()" />
              </ShipNoticeDate>
              <ShipNoticeTime>
                <xsl:value-of select="userCSharp:GetNZTime()" />
              </ShipNoticeTime>
              <ASNStructureCode>0001</ASNStructureCode>
              <BillOfLadingNumber>
                <xsl:value-of select="s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
              </BillOfLadingNumber>
              <CarrierProNumber>
                <xsl:value-of select="s0:Order/s0:TransportReference/text()"/>
              </CarrierProNumber>
            </ShipmentHeader>
            <Dates>
              <DateTimeQualifier>370</DateTimeQualifier>
                 <Date>
                  <xsl:value-of select="userCSharp:GetDateValue(s0:DataContext/s0:TriggerDate/text())" />
                </Date>
              <Time>
                <xsl:value-of select="userCSharp:GetTimeValue(s0:DataContext/s0:TriggerDate/text())" />
              </Time>
            </Dates>
            <Dates>
              <DateTimeQualifier>017</DateTimeQualifier>
                 <Date>
                <xsl:value-of select="userCSharp:GetDateValue(s0:DataContext/s0:TriggerDate/text())" />
              </Date>
              <Time>
                <xsl:value-of select="userCSharp:GetTimeValue(s0:DataContext/s0:TriggerDate/text())" />
              </Time>
           </Dates>
              <References>
              <ReferenceQual>IV</ReferenceQual>
              <ReferenceID>
                <xsl:value-of select="s0:Order/s0:OrderNumber/text()"/>
              </ReferenceID>
            </References>
          
            <References>
              <ReferenceQual>SI</ReferenceQual>
              <ReferenceID>
                <xsl:value-of select="s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key/text()"/>
              </ReferenceID>
            </References>
            <xsl:for-each select="s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeAddress']">
              <Address>
                <AddressTypeCode>DA</AddressTypeCode>
                <AddressName>
                  <xsl:value-of select="s0:CompanyName/text()"/>
                </AddressName>
                <Address1>
                  <xsl:value-of select="s0:Address1/text()"/>
                </Address1>
                <Address2>
                  <xsl:value-of select="s0:Address2/text()"/>
                </Address2>
                <City>
                  <xsl:value-of select="s0:City/text()"/>
                </City>
                <State>
                  <xsl:value-of select="userCSharp:CheckStateExist(s0:State/text())"/>
                </State>
                <PostalCode>
                  <xsl:value-of select="s0:PostCode/text()"/>
                       </PostalCode>
                <Country>
                      <xsl:value-of select="s0:Country/s0:Code/text()"/>                  
                </Country>
                </Address>
            <Address>
                <AddressTypeCode>ST</AddressTypeCode>
                <AddressName>
                  <xsl:value-of select="s0:CompanyName/text()"/>
                </AddressName>
                <Address1>
                  <xsl:value-of select="s0:Address1/text()"/>
                </Address1>
                <Address2>
                  <xsl:value-of select="s0:Address2/text()"/>
                </Address2>
                <City>
                  <xsl:value-of select="s0:City/text()"/>
                </City>
                <State>
                  <xsl:value-of select="userCSharp:CheckStateExist(s0:State/text())"/>
                </State>
                <PostalCode>
                  <xsl:value-of select="s0:PostCode/text()"/>
                </PostalCode>
                <Country>
                      <xsl:value-of select="s0:Country/s0:Code/text()"/>
                </Country>
                
              </Address>
            </xsl:for-each>
        </Header>
          <OrderLevel>
            <xsl:for-each select="s0:Order">
              <OrderHeader>
                
                <PurchaseOrderNumber>
                  <xsl:value-of select="s0:OrderNumber/text()" />
                </PurchaseOrderNumber>
                </OrderHeader>
               </xsl:for-each>
            <xsl:for-each select="s0:PackingLineCollection/s0:PackingLine">
              <PackLevel>
                <Pack>                
                  <PackLevelType>
                    <xsl:choose>
                      <xsl:when test="s0:PackType/s0:Code='PLT'">
                        <xsl:text>P</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>T</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </PackLevelType>
                  <ShippingSerialID>
                    <xsl:value-of select="s0:ReferenceNumber/text()"/>
                  </ShippingSerialID>
                </Pack>
                <PalletInformation>
                  <PalletQualifier>OU</PalletQualifier>
                  <PalletWeight>
                    <xsl:value-of select="s0:Weight/text()"/>
                  </PalletWeight>
                  <PalletWeightUOM>
                    <xsl:value-of select="s0:WeightUnit/s0:Code/text()"/>
                  </PalletWeightUOM>
                  <PalletVolume>
                    <xsl:value-of select="s0:Volume/text()"/>
                  </PalletVolume>
                  <PalletVolumeUOM>CR</PalletVolumeUOM>
                  </PalletInformation>
                    <xsl:for-each select="s0:PackedItemCollection/s0:PackedItem">
                  
				  <xsl:variable name="packlinecommerciallink" select="s0:CommercialInvoiceLineLink/text()"/>

                     <xsl:variable name="var:orderlinelink" select="../../../../s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice/s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine[s0:Link=$packlinecommerciallink]/s0:OrderLineLink/text()"/>

                    <!--<xsl:for-each select="../../s0:Order/s0:OrderLineCollection/s0:OrderLine[s0:Link=$var:orderlinelink]">-->
                    <xsl:for-each select="../../../../s0:Order/s0:OrderLineCollection/s0:OrderLine[s0:Link=$var:orderlinelink]">
                                     <ItemLevel>
   <ShipmentLine>
                        <LineSequenceNumber>
                          <xsl:value-of select="s0:LineNumber/text()"/>
                          <!--<xsl:value-of select="$var:orderlinelink"/>-->
                        </LineSequenceNumber>
                        <VendorPartNumber>
                          <xsl:value-of select="s0:Product/s0:Code/text()"/>
                        </VendorPartNumber>
                        <GTIN>
                          <xsl:value-of select="s0:PartAttribute1/text()"/>
                        </GTIN>
                        <ShipQty>
                          <xsl:value-of select="s0:OrderedQty/text()"/>
                        </ShipQty>
                        <ShipQtyUOM>EA</ShipQtyUOM>
                      </ShipmentLine>
                
                  </ItemLevel>
				</xsl:for-each>
                    </xsl:for-each>
              </PackLevel>
            </xsl:for-each>
          </OrderLevel>
          <Summary>
            <TotalLineItemNumber>
            <xsl:value-of select="number(s0:Order/s0:UnitsSent/text())"/>
            </TotalLineItemNumber>
          </Summary>
        </Shipment>
      </xsl:for-each>
    </Shipments>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
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
            outDateString = dt.ToString("yyyy-MM-dd");
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
       return System.TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.FindSystemTimeZoneById("New Zealand Standard Time")).ToString("yyyy-MM-dd");
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