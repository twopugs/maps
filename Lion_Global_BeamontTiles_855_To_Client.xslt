<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/X12/2006" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:variable name ="var:DocCoachAccessories" select ="document('c:\\cc\configs\tli\COACH_AccessoryMappings.xml')"/>
	<xsl:template match="/">
		<xsl:apply-templates select="/s0:UniversalInterchange" />
	</xsl:template>
	<xsl:template match="/s0:UniversalInterchange">
		
			<ns0:X12_00401_855>
				<ST>
					<ST01>
						<xsl:value-of select="&quot;855&quot;" />
					</ST01>
					<ST02>
						<xsl:value-of select="&quot;0001&quot;" />
					</ST02>
				</ST>
				
				<ns0:BAK>
					<BAK01>
						<xsl:value-of select="&quot;00&quot;" />
					</BAK01>
					<BAK02>
						<xsl:value-of select="&quot;AC&quot;" />
					</BAK02>
					<BAK03>
						<xsl:value-of select="s0:Body/s0:UniversalShipment/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:RelatedShipmentCollection/s0:RelatedShipment/s0:Order/s0:OrderNumber/text()"/>
					</BAK03>
					<BAK04>
						<xsl:value-of select="userCSharp:ConvertDateValue(normalize-space(s0:Body/s0:UniversalShipment/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:RelatedShipmentCollection/s0:RelatedShipment/s0:DateCollection/s0:Date[s0:Type='OrderDate']/s0:Value/text()))" />
					</BAK04>
					<BAK06>
						<xsl:value-of select="&quot;AP0002370&quot;" />
					</BAK06>
				</ns0:BAK>

				<xsl:for-each select="s0:Body/s0:UniversalShipment/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:RelatedShipmentCollection/s0:RelatedShipment/s0:Order/s0:OrderLineCollection/s0:OrderLine">
					<ns0:PO1Loop1>
						<ns0:PO1>
							<PO101>
								<xsl:value-of select="position()"/>
							</PO101>
							<PO102>
								<xsl:value-of select="s0:OrderedQty/text()"/>
							</PO102>
							<PO103>
								<xsl:value-of select="s0:OrderedQtyUnit/s0:Code/text()"/>
							</PO103>
							<PO104>
								<xsl:value-of select="s0:UnitPriceRecommended/text()"/>
							</PO104>
							<PO106>
								<xsl:value-of select="&quot;IN&quot;" />
							</PO106>
							<PO107>
								<xsl:value-of select="s0:Product/s0:Code/text()"/>
							</PO107>
							<PO108>
								<xsl:value-of select="&quot;BP&quot;" />
							</PO108>
						</ns0:PO1>
						<ns0:PO3>
							<PO301>
								<xsl:value-of select="&quot;AQ&quot;" />
							</PO301>
							<PO306>
								<xsl:value-of select="s0:OrderLine/s0:OrderedQty/text()"/>
							</PO306>
							<PO307>
								<xsl:value-of select="s0:OrderedQtyUnit/s0:Code/text()"/>
							</PO307>
							<PO308>
								<xsl:value-of select="s0:OrderedQtyUnit/s0:Description/text()"/>
							</PO308>
						</ns0:PO3>
						<ns0:PIDLoop1>
							<ns0:PID_2>
								<PID01>
									<xsl:value-of select="&quot;F&quot;" />
								</PID01>
								<PID02>
									<xsl:value-of select="s0:Product/s0:Description/text()"/>
								</PID02>
							</ns0:PID_2>
						</ns0:PIDLoop1>
						<ns0:ACKLoop1>
							<ns0:ACK>
								<ACK01>
									<xsl:value-of select="&quot;IC&quot;" />
								</ACK01>
								<ACK02>
									<xsl:value-of select="s0:OrderedQty/text()"/>
								</ACK02>
								<ACK03>
									<xsl:value-of select="&quot;EACH&quot;" />
								</ACK03>
								<ACK04>
									<xsl:value-of select="&quot;17&quot;" />
								</ACK04>
								<ACK05>
									<xsl:value-of select="userCSharp:ConvertDateValue(normalize-space(../../../../../s0:LocalProcessing/s0:EstimatedDelivery/text()))" />
								</ACK05>
								<ACK06>
									<xsl:value-of select="position()"/>
								</ACK06>
								<ACK07>
									<xsl:value-of select="&quot;BT&quot;" />
								</ACK07>
								<ACK08>
									<xsl:value-of select="s0:PartAttribute1/text()"/>
								</ACK08>
							</ns0:ACK>
						</ns0:ACKLoop1>
					</ns0:PO1Loop1>
				</xsl:for-each>
			</ns0:X12_00401_855>

	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[
        public static string ConvertDateValue(string inputDateString)
        {
            string outDateString;
            if(inputDateString.Length >0)
            {
            System.DateTime dt=System.Convert.ToDateTime(inputDateString);
            outDateString = dt.ToString("yyyyMMdd");
}
else
{outDateString="";
}
            return outDateString;            
        }
         public static string ConvertTimeValue(string inputDateString)
        {
            string outDateString;
             if(inputDateString.Length >0)
            {
            System.DateTime dt=System.Convert.ToDateTime(inputDateString);
            outDateString = dt.ToString("HHmmss");
}
else
{outDateString="";
}
            return outDateString;            
        }
        public static string GetStateCode(string inputDateString)
        {
          string outValue=inputDateString;
          if(inputDateString.Length>2)
          {
           outValue=inputDateString.Substring(0, 2);
          }
           return outValue;
        }  
        public static string GetCountryCode(string inputDateString)
        {
          string outValue=inputDateString;
          if(inputDateString.Length>2)
          {
           outValue=inputDateString.Substring(0, 2);
          }
           return outValue;
        }  
        public static string ConvertStringToDecimal(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString = number.ToString("0.00");
           return OutDataString;
        } 
        
        public static string GetL102(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString=string.Empty;
           int i = (int)number;
           if (i == 0 || i == 00)
           {
                OutDataString="ERROR";
           }
           else
           {
                OutDataString = number.ToString("0.00");
           }
           return OutDataString;
        } 
        
        
        public static string ConvertStringToDecimalWihout(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString = (number*100).ToString("0");
           return OutDataString;
        } 
        
         public static string GetL104(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString = (number).ToString("0.00");
           return OutDataString;
        } 
        
        public static string GetRoundUp(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           return System.Math.Ceiling(number).ToString();
        }  
        
        public static double Round(double d)
          {
              var absoluteValue = Math.Abs(d);
              var integralPart = (long)absoluteValue;
              var decimalPart = absoluteValue - integralPart;
              var sign = Math.Sign(d);

              double roundedNumber;

              if (decimalPart > 0.5)
              {
                  roundedNumber = integralPart + 1;
              }
              else if (decimalPart == 0)
              {
                  roundedNumber = absoluteValue;
              }
              else
              {
                  roundedNumber = integralPart + 0.5;
              }

              return sign * roundedNumber;
          }
        
         public static string GetChargeCodeDesc(string inputDataString)
        {
            string outDescription = string.Empty;            
            System.Collections.Generic.Dictionary<string,string> chargeCode=new System.Collections.Generic.Dictionary<string,string>();
            chargeCode.Add("BLC","Documentation - Destination");
            chargeCode.Add("CEC","Customs Formalities");
            chargeCode.Add("CUC","Customs Entry");
            chargeCode.Add("DEF","Delivery Charge");
            chargeCode.Add("ENS","ENS Fee");
            chargeCode.Add("FCZ","FCZ Fee");
            chargeCode.Add("FRT","Freight");
            chargeCode.Add("FSC","Fuel Surcharge");
            chargeCode.Add("HLF","Handling");
            chargeCode.Add("OCART","Pick-up and Delivery");
            chargeCode.Add("SC","Security Signature Service");
            chargeCode.Add("SCF","Screening Fee");
            chargeCode.Add("STR","Storage");
            chargeCode.Add("T1","T1");
            chargeCode.Add("THC","Terminal Service Fee");
            chargeCode.Add("TOLL","Interstate/Highway Toll");
            chargeCode.Add("ORC","Origin Handling");
            chargeCode.Add("DORC","Destination Handling");
            chargeCode.Add("BOL","Documentation - Origin");
            chargeCode.Add("EDI","Electronic Data Interchange");
            chargeCode.Add("ECCLR","Export Customs Clearance");
            chargeCode.Add("AWB","Documentation - Origin");
            
            chargeCode.Add("SPT","Spot Quote");
            chargeCode.Add("AMS","AMS Fee");
            chargeCode.Add("DNOTE","Destination Charges");
            chargeCode.Add("OHF","Origin Charges");
            
            if (chargeCode.ContainsKey(inputDataString))
                outDescription = chargeCode[inputDataString];
            if(outDescription.Length>50)
            {
            outDescription = outDescription.Substring(1, 49); }
            
            return outDescription;
        }
        
         public static string GetChargeCodeDescL502(string inputDataString)
        {
            string outDescription = string.Empty;
            System.Collections.Generic.Dictionary<string,string> chargeCode=new System.Collections.Generic.Dictionary<string,string>();
            chargeCode.Add("BLC","DOCUMENTS");
            chargeCode.Add("CEC","EXPORT CUSTOMS");
            chargeCode.Add("CUC","CUSTOMS CLEARANCE");
            chargeCode.Add("DEF","DELIVERY");
            chargeCode.Add("ENS","AMS/ENS");
            chargeCode.Add("FCZ","FCZ");
            chargeCode.Add("FRT","FREIGHT");
            chargeCode.Add("FSC","FUEL SURCHARGE");
            chargeCode.Add("HLF","HANDLING");
            chargeCode.Add("OCART","PICKUP");
            chargeCode.Add("SSC","SECURITY SURCHARGE");
            chargeCode.Add("SCF","SCREENING");
            chargeCode.Add("STR","STORAGE");
            chargeCode.Add("T1","T1");
            chargeCode.Add("THC","TERMINAL HANDLING");
            chargeCode.Add("TOLL","TOLL");
            chargeCode.Add("ORC","Origin Local Charges");
            chargeCode.Add("DORC","Destination Local Charges");
            chargeCode.Add("BOL","Bill of Lading Fee");
            chargeCode.Add("EDI","EDI");
            chargeCode.Add("ECCLR","EXPORT CUSTOMS CLEARANCE FEE");
            chargeCode.Add("AWB","AIRWAY BILL FEE");
            
            if (chargeCode.ContainsKey(inputDataString))
                outDescription = chargeCode[inputDataString];
            if(outDescription.Length>50)
            {
            outDescription = outDescription.Substring(1, 49); }
            
            return outDescription;
        }
        
        public static string GetChargeCode(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> chargeCode=new System.Collections.Generic.Dictionary<string,string>();
            chargeCode.Add("FRT","400");chargeCode.Add("FSC","405");chargeCode.Add("SC","675");chargeCode.Add("HLF","HHB");
            chargeCode.Add("THC","730");chargeCode.Add("CEC","CSF");chargeCode.Add("OCART","PUD");
            chargeCode.Add("SCF","A09");chargeCode.Add("BLC","DOC");chargeCode.Add("CUC","CSE");chargeCode.Add("DEF","DEL");
            chargeCode.Add("STR","SRG");chargeCode.Add("TFF","PUD");
            chargeCode.Add("FOR","LFT");chargeCode.Add("OSEC","400");
            
            chargeCode.Add("HANDLING","HHB");chargeCode.Add("PICKUP FEE","PUD");chargeCode.Add("ENS FEE","CSF");chargeCode.Add("DOCUMENT FEE","DOC");
            chargeCode.Add("FREIGHT","400");chargeCode.Add("SECURITY SURCHARGE","675");chargeCode.Add("CUSTOMS CLEARANCE","CSF");chargeCode.Add("DELIVERY FEE","DEL");
            chargeCode.Add("HANDLING CHARGE","HHB");chargeCode.Add("TOLL","IHT");chargeCode.Add("T1","T1F");
            
            chargeCode.Add("ORC","H01");
            chargeCode.Add("DORC","H17");
            
            chargeCode.Add("ORC1","H01"); //PROD Error Code fix 22.05.2017
            chargeCode.Add("DORC1","H17"); //PROD Error Code fix 22.05.2017
            
            chargeCode.Add("ENS","CSF");
            chargeCode.Add("BOL","430");
            chargeCode.Add("EDI","EDI");
            chargeCode.Add("ECCLR","090");
            chargeCode.Add("FCZ","FCZ");
            
            chargeCode.Add("AWB","430");
            
            chargeCode.Add("SPT","SPT");
            chargeCode.Add("AMS","CSF");
            chargeCode.Add("DNOTE","DCF");
            chargeCode.Add("OHF","ORI");
            
            
            inputDataString=inputDataString.ToUpper();
            if (chargeCode.ContainsKey(inputDataString))
                outDataString = chargeCode[inputDataString];
            return outDataString;
        }
        
        public static string GetPackageType(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> packageType=new System.Collections.Generic.Dictionary<string,string>();
            packageType.Add("PX","PLT");
            packageType.Add("CT","CTN");
            packageType.Add("BG","BAG");
            packageType.Add("PK","PKG");
            packageType.Add("PS","PCS");
            packageType.Add("SI","SKD");
            packageType.Add("CS","CAS");
            packageType.Add("BX","BOX");
            packageType.Add("RO","ROL");
            packageType.Add("DR","DRM");
            packageType.Add("4C","CRT");
            packageType.Add("PKG","PKG");
            packageType.Add("PLT","PLT");
            packageType.Add("PC","PCS");
            packageType.Add("CR","CRT");
            packageType.Add("EG","PLT");
            packageType.Add("PCE","PCS");

            if (packageType.ContainsKey(inputDataString))
                outDataString = packageType[inputDataString];
            return outDataString;
        }

        public static string UpdateZipCode(string inputString)
        {
          string outValue=Regex.Replace(inputString, @"\W", string.Empty);
          return outValue;
        }
        public static string GetVolume(string code, string volume)
        {
          string outValue="0";
          decimal number = Decimal.Parse(volume);
          if(code=="M3")
          {
            outValue=Decimal.Divide(number,(Decimal)0.006).ToString("0.00");
          }else if(code=="CI")
          {
            outValue=Decimal.Divide(number,366).ToString("0.00");
          }else if(code=="CC")
          {
            outValue=Decimal.Divide(number,6000).ToString("0.00");
          }
          return outValue;
        }
        
        public static string GetSubString(string inputDataString,int datalength)
        {
            string outDescription = inputDataString.Replace(":","").Trim();
            if(outDescription.Length>datalength)
            {
            outDescription = outDescription.Substring(0, datalength); }
            return outDescription;
         }
         
          public static string GetL112(string inputDataString,int datalength)
          {
           string outDescription = inputDataString.Trim();
            if(outDescription.Length>25)
            {
            outDescription = outDescription.Substring(0, datalength); }
            return outDescription.TrimEnd();
            }
            
            public static string GetServiceLevel(string inputValue)
            {
              string outValue=inputValue.Trim();
              if(inputValue.Trim()=="DEF")
              {
                outValue="DF";
              }else if (inputValue.Trim()=="EXP" || inputValue.Trim()=="EX")
              {
                outValue="CX";
              }
              return outValue;            
            }
                 public static string CheckStringLength(string inputDateString)
    {
      string outValue=inputDateString.Trim();
      if(inputDateString.Trim().Length==0)
        outValue=string.Empty;
      return outValue;
    }
    
      public static string CheckStringMandatory(string inputDateString, string segmentName , string ACKey)
    {
      string outValue=inputDateString.Trim();
      string FCFSKey = " AccountingInvoice : " + ACKey + "|";
      if(inputDateString.Trim().Length==0)
        throw new System.Exception( "AccountingInvoice: "+ACKey + segmentName + " is empty. Please check your input");
      return outValue;
    }
    
      public static string CheckStringMandatory1(string inputDateString, string segmentName,string key1 , string ACKey)
    {
      string outValue=inputDateString.Trim();
      string FCFSKey = " AccountingInvoice : " + ACKey + "|";
      if(inputDateString.Trim().Length==0)
        throw new System.Exception( "AccountingInvoice: "+ACKey + segmentName + key1+ " is empty. Please check your input");
      return outValue;
    }
    
    
    public string ChargeCodeTrim(string val)
    {
    string v="";
    if(val.Length >= 3)
    {
v=val.Substring(0, 3);
    }
    else
    {
    v=val;
    }
    return v;
    }
    
    public string ReplaceString(string val)
    {
    return val.Replace("-","");
    }
	  public static string GetChargeCode1(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> chargeCode=new System.Collections.Generic.Dictionary<string,string>();
            chargeCode.Add("ASSC","ARB");chargeCode.Add("AMS","AMS");
            chargeCode.Add("AIR EXP","AIR");chargeCode.Add("AIR IMP","AIR");          
            chargeCode.Add("B/L FEE","BLC");chargeCode.Add("BAF IMP","FUE");
            chargeCode.Add("CAF","CUA");chargeCode.Add("CHA","CHE");
            chargeCode.Add("CHAS SPLIT","CHE");chargeCode.Add("CLE","CUS");
            chargeCode.Add("CLEADD","CUS");chargeCode.Add("CLEANTRUCK","CLN");
            chargeCode.Add("COURIER","CRS");chargeCode.Add("DDC","DOC");
            chargeCode.Add("DEMURRAGE","DTN");chargeCode.Add("DETENT","DTN");        
            chargeCode.Add("DLC","DRC");chargeCode.Add("DOC","DOC");                        
            chargeCode.Add("DUTY","315");chargeCode.Add("EXM","762");        
            chargeCode.Add("HANDLING","HHB");chargeCode.Add("INLAND","DRC");
            chargeCode.Add("ISF","240");chargeCode.Add("LINE HAUL","400");
            chargeCode.Add("OFR EXP","COF");chargeCode.Add("OIM","COF");
            chargeCode.Add("OLC","CTG");chargeCode.Add("OVSC","COF");
            chargeCode.Add("PIER PASS","PWH");chargeCode.Add("PIM","PBL");
            chargeCode.Add("PSF","675");chargeCode.Add("PSS IMP","SUR");
            chargeCode.Add("SC FUEL","FUE"); chargeCode.Add("SEC","PSS"); 
            chargeCode.Add("STORAGE","STR");chargeCode.Add("THC","TER");            
            chargeCode.Add("TRF","TRF"); chargeCode.Add("WHS","WHC");
			chargeCode.Add("INL","DRC");
			chargeCode.Add("FRT","400");
			chargeCode.Add("FREIGHT","400");
			chargeCode.Add("DSTAIR","AIR");
			chargeCode.Add("ASCEX","AIR");
			chargeCode.Add("HABEX","HHB");
			chargeCode.Add("AHFEX","AIR");
			chargeCode.Add("AIRMF","AIR");
			chargeCode.Add("MBLF","400");
			chargeCode.Add("EDIEX","400");
			chargeCode.Add("PIC","400");
			chargeCode.Add("DEFAULT","AIR");

            inputDataString=inputDataString.ToUpper();
            if (chargeCode.ContainsKey(inputDataString))
                outDataString = chargeCode[inputDataString];
			else outDataString = "AIR";
            return outDataString;
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
	
	
	
]]>
	</msxsl:script>
</xsl:stylesheet>
