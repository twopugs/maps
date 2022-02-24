<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://JSONArrayTester.CD_Airland_FF"  xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="no" method="xml" version="1.0" />
  <xsl:key name="OrderGroup" match="Airland_FF_Rcd" use="PONumber"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Airland_FF" />
  </xsl:template>
  <xsl:template match="/s0:Airland_FF">
    <UniversalShipmentRcd>
      <xsl:for-each select="Airland_FF_Rcd[generate-id(.)=generate-id(key('OrderGroup',PONumber))]">
        <UniversalShipment>
          <Shipment>
            <DataContext>
              <DataTargetCollection>
                <DataTarget>
                  <Type>
                    <xsl:value-of select="string('OrderManagerOrder')" />
                  </Type>
                </DataTarget>
              </DataTargetCollection>
            </DataContext>
            <ServiceLevel>
              <Code>
                <xsl:value-of select="substring(Priority/text(),1,2)" />
              </Code>
            </ServiceLevel>
            <ShipmentIncoTerm>
              <Code>
                <xsl:value-of select="IncoTerms/text()" />
              </Code>
            </ShipmentIncoTerm>
            <FreightRateCurrency>
              <Code>
                <xsl:value-of select="POCurrency/text()" />
              </Code>
            </FreightRateCurrency>
            <CustomizedFieldCollection>
              <CustomizedField>
                <Key>
                  <xsl:value-of select="string('Location /Store Code')"/>
                </Key>
                <DataType>String</DataType>
                <Value>
                  <xsl:value-of select="Loc_StoreCode/text()" />
                </Value>
              </CustomizedField>
              <CustomizedField>
                <Key>
                  <xsl:value-of select="string('Is Complete')"/>
                </Key>
                <DataType>String</DataType>
                <Value>
                  <xsl:value-of select="IsCompleted/text()" />
                </Value>
              </CustomizedField>
              <CustomizedField>
                <Key>
                  <xsl:value-of select="string('PO Type')"/>
                </Key>
                <DataType>String</DataType>
                <Value>
                  <xsl:value-of select="POType/text()" />
                </Value>
              </CustomizedField>
              <CustomizedField>
                <Key>
                  <xsl:value-of select="string('Store Description')"/>
                </Key>
                <DataType>String</DataType>
                <Value>
                  <xsl:value-of select="StoreDesc/text()" />
                </Value>
              </CustomizedField>
              <CustomizedField>
                <Key>
                  <xsl:value-of select="string('Asset No')"/>
                </Key>
                <DataType>String</DataType>
                <Value>
                  <xsl:value-of select="AssetNo/text()" />
                </Value>
              </CustomizedField>
              <CustomizedField>
                <Key>
                  <xsl:value-of select="string('Country Code')"/>
                </Key>
                <DataType>String</DataType>
                <Value>
                  <xsl:value-of select="CountryCode/text()" />
                </Value>
              </CustomizedField>
            </CustomizedFieldCollection>
            <Order>
              <OrderNumber>
                <xsl:value-of select="PONumber/text()" />
              </OrderNumber>
              <xsl:if test="IsCompleted/text()='Yes' or IsCompleted/text()='YES'">
                <Status>
                  <Code>
                    <xsl:value-of select="string('COM')"/>
                  </Code>
                </Status>
              </xsl:if>
              <OrderLineCollection>
                <xsl:for-each select="key('OrderGroup',PONumber)">
                  <OrderLine>
                    <Product>
                      <Code>
                        <xsl:value-of select="ItemNum/text()" />
                      </Code>
                      <Description>
                        <xsl:value-of select="ItemDesc/text()" />
                      </Description>
                    </Product>
                    <LineNumber>
                      <xsl:value-of select="POLineNumber/text()" />
                    </LineNumber>
                    <OrderedQty>
                      <xsl:value-of select="QtyOrdered/text()" />
                    </OrderedQty>
                    <OrderedQtyUnit>
                      <Code>
                        <xsl:choose>
                          <xsl:when test="UOM/text()='Mt'">
                            <xsl:value-of select="'MTS'" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="'UNT'" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </Code>
                    </OrderedQtyUnit>
                    <UnitPriceRecommended>
                      <xsl:value-of select="UnitCost/text()" />
                    </UnitPriceRecommended>
                    <ExtendedLinePrice>
                      <xsl:value-of select="TotalCost/text()" />
                    </ExtendedLinePrice>
                    <RequiredInStore>
                      <xsl:value-of select="userCSharp:ConvertDateValue(ExpectedDate/text())" />
                    </RequiredInStore>
                    <CustomizedFieldCollection>
                      <CustomizedField>
                        <Key>
                          <xsl:value-of select="string('Asset No')"/>
                        </Key>
                        <DataType>String</DataType>
                        <Value>
                          <xsl:value-of select="AssetNo/text()" />
                        </Value>
                      </CustomizedField>
                      <CustomizedField>
                        <Key>
                          <xsl:value-of select="string('Vendor Part No')"/>
                        </Key>
                        <DataType>String</DataType>
                        <Value>
                          <xsl:value-of select="VendorPartNo/text()" />
                        </Value>
                      </CustomizedField>
                    </CustomizedFieldCollection>
                  </OrderLine>
                </xsl:for-each>
              </OrderLineCollection>
            </Order>
            <DateCollection>
              <Date>
                <Value>
                  <xsl:value-of select="userCSharp:ConvertDateValue(PODate/text())" />
                </Value>
                <Type>OrderDate</Type>
              </Date>
              <Date>
                <Value>
                  <xsl:value-of select="userCSharp:ConvertDateValue(ExpectedDate/text())" />
                </Value>
                <IsEstimate>False</IsEstimate>
                <Type>ExWorksRequiredBy</Type>
              </Date>
            </DateCollection>
            <OrganizationAddressCollection>
              <OrganizationAddress>
                <AddressType>ConsigneePickupDeliveryAddress</AddressType>
                <OrganizationCode>
                  <xsl:value-of select="userCSharp:GetAddressOrgCode(CountryCode/text())" />
                </OrganizationCode>
                <AddressShortCode>
                  <xsl:value-of select="userCSharp:GetAddressShortCode(CountryCode/text())" />
                </AddressShortCode>
              </OrganizationAddress>

              <OrganizationAddress>
                <AddressType>ConsigneeDocumentaryAddress</AddressType>
                <OrganizationCode>
                  <xsl:value-of select="userCSharp:GetAddressOrgCode(CountryCode/text())" />
                </OrganizationCode>
                <AddressShortCode>
                  <xsl:value-of select="userCSharp:GetAddressShortCode(CountryCode/text())" />
                </AddressShortCode>
              </OrganizationAddress>

              <OrganizationAddress>
                <AddressType>ConsignorPickupDeliveryAddress</AddressType>
                <OrganizationCode>
                  <xsl:value-of select="userCSharp:GetConsignorAddressOrgCode(userCSharp:StringUpperCase(string(VendorName/text())))" />
                </OrganizationCode>
                <AddressShortCode>
                  <xsl:value-of select="userCSharp:GetConsignorAddressShortCode(userCSharp:StringUpperCase(string(VendorName/text())))" />
                </AddressShortCode>
              </OrganizationAddress>

              <OrganizationAddress>
                <AddressType>ConsignorDocumentaryAddress</AddressType>
                <OrganizationCode>
                  <xsl:value-of select="userCSharp:GetConsignorAddressOrgCode(userCSharp:StringUpperCase(string(VendorName/text())))" />
                </OrganizationCode>
                <AddressShortCode>
                  <xsl:value-of select="userCSharp:GetConsignorAddressShortCode(userCSharp:StringUpperCase(string(VendorName/text())))" />
                </AddressShortCode>
              </OrganizationAddress>
            </OrganizationAddressCollection>
          </Shipment>
        </UniversalShipment>
      </xsl:for-each>
    </UniversalShipmentRcd>

  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringSubstring(string str, string left, string right)
{
	string retval = "";
	double dleft = 0;
	double dright = 0;
	if (str != null && IsNumeric(left, ref dleft) && IsNumeric(right, ref dright))
	{
		int lt = (int)dleft;
		int rt = (int)dright;
		lt--; rt--;
		if (lt >= 0 && rt >= lt && lt < str.Length)
		{
			if (rt < str.Length)
			{
				retval = str.Substring(lt, rt-lt+1);
			}
			else
			{
				retval = str.Substring(lt, str.Length-lt);
			}
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
  public static string ConvertDateValue(string inputDateString)
              {
                string outDateString;
                System.DateTime dt = DateTime.ParseExact(inputDateString, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  
              
                public static string GetAddressOrgCode(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> OrgCodeType=new System.Collections.Generic.Dictionary<string,string>();
         OrgCodeType.Add("10","CAPDRIMWZ");
OrgCodeType.Add("12","CMSNMBMWZ");
OrgCodeType.Add("25","CAPDRIFRW");
OrgCodeType.Add("30","CAPDRICAI");
OrgCodeType.Add("32","CAPDRIBKO");
OrgCodeType.Add("31","CAPDRICKY");
OrgCodeType.Add("33","CAPDRIOUA");
OrgCodeType.Add("37","CAPDRIABJ");
OrgCodeType.Add("38","CAPDRINKC");
OrgCodeType.Add("39","CAPMINABJ");
OrgCodeType.Add("50","CAPDRIWDH");
OrgCodeType.Add("61","CAPDRIRUH");
OrgCodeType.Add("87","CAPAUSPER");
OrgCodeType.Add("99","CAPDRIBDA");
OrgCodeType.Add("94","CAPDRIMRU");
OrgCodeType.Add("1","CAPAUSPER");
OrgCodeType.Add("2","CAPAUSPER");
OrgCodeType.Add("3","CAPAUSPER");
OrgCodeType.Add("4","CAPAUSPER");
OrgCodeType.Add("5","CAPAUSPER");
OrgCodeType.Add("6","CAPAUSPER");
OrgCodeType.Add("7","CAPAUSPER");
OrgCodeType.Add("8","CAPAUSPER");
OrgCodeType.Add("9","CAPAUSPER");
OrgCodeType.Add("11","CAPAUSPER");
OrgCodeType.Add("13","CAPAUSPER");
OrgCodeType.Add("14","CAPAUSPER");
OrgCodeType.Add("15","CAPAUSPER");
OrgCodeType.Add("16","CAPAUSPER");
OrgCodeType.Add("17","CAPAUSPER");
OrgCodeType.Add("18","CAPAUSPER");
OrgCodeType.Add("19","CAPAUSPER");
OrgCodeType.Add("20","CAPAUSPER");
OrgCodeType.Add("21","CAPAUSPER");
OrgCodeType.Add("22","CAPAUSPER");
OrgCodeType.Add("23","CAPAUSPER");
OrgCodeType.Add("24","CAPAUSPER");
OrgCodeType.Add("26","CAPAUSPER");
OrgCodeType.Add("27","CAPAUSPER");
OrgCodeType.Add("28","CAPAUSPER");
OrgCodeType.Add("29","CAPAUSPER");
OrgCodeType.Add("34","CAPAUSPER");
OrgCodeType.Add("35","CAPAUSPER");
OrgCodeType.Add("36","CAPAUSPER");
OrgCodeType.Add("40","CAPAUSPER");
OrgCodeType.Add("41","CAPAUSPER");
OrgCodeType.Add("42","CAPAUSPER");
OrgCodeType.Add("43","CAPAUSPER");
OrgCodeType.Add("44","CAPAUSPER");
OrgCodeType.Add("45","CAPAUSPER");
OrgCodeType.Add("46","CAPAUSPER");
OrgCodeType.Add("47","CAPAUSPER");
OrgCodeType.Add("48","CAPAUSPER");
OrgCodeType.Add("49","CAPAUSPER");
OrgCodeType.Add("51","CAPAUSPER");
OrgCodeType.Add("52","CAPAUSPER");
OrgCodeType.Add("53","CAPAUSPER");
OrgCodeType.Add("54","CAPAUSPER");
OrgCodeType.Add("55","CAPAUSPER");
OrgCodeType.Add("56","CAPAUSPER");
OrgCodeType.Add("57","CAPAUSPER");
OrgCodeType.Add("58","CAPAUSPER");
OrgCodeType.Add("59","CAPAUSPER");
OrgCodeType.Add("60","CAPAUSPER");
OrgCodeType.Add("62","CAPAUSPER");
OrgCodeType.Add("63","CAPAUSPER");
OrgCodeType.Add("64","CAPAUSPER");
OrgCodeType.Add("65","CAPAUSPER");
OrgCodeType.Add("66","CAPAUSPER");
OrgCodeType.Add("67","CAPAUSPER");
OrgCodeType.Add("68","CAPAUSPER");
OrgCodeType.Add("69","CAPAUSPER");
OrgCodeType.Add("70","CAPAUSPER");
OrgCodeType.Add("71","CAPAUSPER");
OrgCodeType.Add("72","CAPAUSPER");
OrgCodeType.Add("73","CAPAUSPER");
OrgCodeType.Add("74","CAPAUSPER");
OrgCodeType.Add("75","CAPAUSPER");
OrgCodeType.Add("76","CAPAUSPER");
OrgCodeType.Add("77","CAPAUSPER");
OrgCodeType.Add("78","CAPAUSPER");
OrgCodeType.Add("79","CAPAUSPER");
OrgCodeType.Add("80","CAPAUSPER");
OrgCodeType.Add("81","CAPAUSPER");
OrgCodeType.Add("82","CAPAUSPER");
OrgCodeType.Add("83","CAPAUSPER");
OrgCodeType.Add("84","CAPAUSPER");
OrgCodeType.Add("85","CAPAUSPER");
OrgCodeType.Add("86","CAPAUSPER");
OrgCodeType.Add("88","CAPAUSPER");
OrgCodeType.Add("89","CAPAUSPER");
OrgCodeType.Add("90","CAPAUSPER");
OrgCodeType.Add("91","CAPAUSPER");
OrgCodeType.Add("92","CAPAUSPER");
OrgCodeType.Add("93","CAPAUSPER");
OrgCodeType.Add("95","CAPAUSPER");
OrgCodeType.Add("96","CAPAUSPER");
OrgCodeType.Add("97","CAPAUSPER");
OrgCodeType.Add("98","CAPAUSPER");
OrgCodeType.Add("100","CAPAUSPER");



  if (OrgCodeType.ContainsKey(inputDataString))
       outDataString = OrgCodeType[inputDataString];
     return outDataString;
 }

 public static string GetAddressShortCode(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> OrgshrtCodeType=new System.Collections.Generic.Dictionary<string,string>();
     
OrgshrtCodeType.Add("10","PLOT 36 & 37, MKUYUNI NEW INDUSTRIAL AREA");
OrgshrtCodeType.Add("12","PLOT 36 & 37, MKUYUNI NEW INDUSTRIAL AREA");
OrgshrtCodeType.Add("25","GDC FARM");
OrgshrtCodeType.Add("30","8TH FLOOR, 52 AHMED FAKHRY STREET");
OrgshrtCodeType.Add("32","BAMAKO, HAMDALLAYE");
OrgshrtCodeType.Add("31","ALMAMYA TIRO");
OrgshrtCodeType.Add("33","EX SECTEUR 15, PARCELLE N");
OrgshrtCodeType.Add("37","ABIDJAN, COCODY");
OrgshrtCodeType.Add("38","75 ILOT V, NOUAKCHOTT");
OrgshrtCodeType.Add("39","ABIDJAN, COCODY - ANGRE");
OrgshrtCodeType.Add("50","29 FELD STREET");
OrgshrtCodeType.Add("61","OLAYA STREET, RUSAIS COMMERCIAL COMPLEX");
OrgshrtCodeType.Add("87","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("99","CANON'S COURT");
OrgshrtCodeType.Add("94","9TH FLOOR, THE CORE BUILD");
OrgshrtCodeType.Add("1","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("2","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("3","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("4","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("5","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("6","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("7","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("8","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("9","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("11","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("13","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("14","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("15","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("16","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("17","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("18","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("19","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("20","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("21","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("22","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("23","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("24","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("26","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("27","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("28","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("29","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("34","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("35","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("36","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("40","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("41","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("42","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("43","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("44","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("45","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("46","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("47","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("48","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("49","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("51","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("52","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("53","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("54","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("55","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("56","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("57","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("58","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("59","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("60","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("62","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("63","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("64","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("65","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("66","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("67","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("68","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("69","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("70","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("71","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("72","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("73","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("74","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("75","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("76","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("77","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("78","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("79","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("80","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("81","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("82","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("83","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("84","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("85","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("86","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("88","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("89","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("90","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("91","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("92","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("93","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("95","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("96","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("97","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("98","394 STIRLING HIGHWAY");
OrgshrtCodeType.Add("100","394 STIRLING HIGHWAY");


  if (OrgshrtCodeType.ContainsKey(inputDataString))
       outDataString = OrgshrtCodeType[inputDataString];
     return outDataString;
 }
 
  public static string GetConsignorAddressShortCode(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> ConsignorAddressShortCodeType=new System.Collections.Generic.Dictionary<string,string>();
     
ConsignorAddressShortCodeType.Add("ADVANCED LOGIC TECHNOLOGY SA","RUE DE NIEDERPALLEN 30H");
ConsignorAddressShortCodeType.Add("AFRIQUE ATLANTIC SERVICES (GH) LTD","TKD HARBOUR BUSINESS AREA");
ConsignorAddressShortCodeType.Add("AL-JAN INTERNATIONAL INC.","11065 N. 600 E., Monroevi");
ConsignorAddressShortCodeType.Add("ALLIED HEAT TRANSFER INTERNATIONAL","19 Tacoma Circuit");
ConsignorAddressShortCodeType.Add("ALLIANCE SCIENTIFIC","PO BOX 565");
ConsignorAddressShortCodeType.Add("AL NOOR MOTORS FZCO","298 Al Aweer Ducamz");
ConsignorAddressShortCodeType.Add("AMC EUROPE GMBH","KOENIGSTRASSE 39");
ConsignorAddressShortCodeType.Add("AMERICAN DIAMOND TOOL","925 S 4400 W");
ConsignorAddressShortCodeType.Add("AMIS","A DIVISION OF SYNERLYTIC");
ConsignorAddressShortCodeType.Add("ANDREW PETERSON","36 FRANK RANDELL DRIVE");
ConsignorAddressShortCodeType.Add("A.NOBLE & SON LTD","80-92 GRAND JUNCTION ROAD");
ConsignorAddressShortCodeType.Add("ARABIAN AFRICAN GMBH & CO","4 RAIFFEISENSTRASSE");
ConsignorAddressShortCodeType.Add("ASTRAK GROUP LTD","Wheatfield Road");
ConsignorAddressShortCodeType.Add("ATLAS COPCO POWER TECHNIQUE","3 BESSEMER STREET,");
ConsignorAddressShortCodeType.Add("ATOM BITS","4145 NORTH SERVICE ROAD");
ConsignorAddressShortCodeType.Add("AUSTIN ENGINEERING","100 CHISHOLM CRESCENT");
ConsignorAddressShortCodeType.Add("AUSTRALIAN EXPLORATION ENGINEERING (AUSTEX)","109 COOLGARDUE AVENUE");
ConsignorAddressShortCodeType.Add("AUSTECH INDUSTRIES","PO BOX 6551");
ConsignorAddressShortCodeType.Add("AUSTRALASIAN MINING SERVICES PTY LTD","270 Berkshire Road Forres");
ConsignorAddressShortCodeType.Add("AUSPLANT","SHED 16 55 COMMERCE CIRCU");
ConsignorAddressShortCodeType.Add("BEIJING FEILONG INTERNATIONAL TRADE CO LTD","B2-0645 ROOM CENTURY TEA");
ConsignorAddressShortCodeType.Add("BOART LONGYEAR CANADA","1111 Main Street West");
ConsignorAddressShortCodeType.Add("BOART LONGYEAR AUSTRALIA PTY LTD","26 Butler Boulevard, Burb");
ConsignorAddressShortCodeType.Add("BOART LONGYEAR SUISSE SARL","12, AVENUE DES MORGINES");
ConsignorAddressShortCodeType.Add("BOART LONGYEAR SOUTH AFRICA (PTY) LTD","Cycad House");
ConsignorAddressShortCodeType.Add("BRUGTECH GMBH","STIEGLITZGANG 6");
ConsignorAddressShortCodeType.Add("BULLIVANTS","10-14 KELLOGG ROAD");
ConsignorAddressShortCodeType.Add("BUS 4X4 GLOBAL PTY LTD","1828 IPSWICH ROAD");
ConsignorAddressShortCodeType.Add("CAPDRILL AUSTRALIA PTY LTD","394 STIRLING HIGHWAY");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING CÔTE D'IVOIRE LIMITED SARL","Abidjan, Cocody, Riviera");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING LTD","Canon's Court");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING MALI SARL","Bamako, Hamdallaye");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING EGYPT (LLC)","8th Floor, 52 Ahmed Fakhr");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING GUINEA SA","ALMAMYA TIRO");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING BOTSWANA","GDC FARM");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING (MAURITIUS) LTD","9TH FLOOR, THE CORE BUILD");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING (T) LIMITED","Plot 36 & 37, Mkuyuni New");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING (MAURITANIA) SARL","75 Ilot V, Nouakchott");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING - BURKINA FASO SARL","Ex Secteur 15, Parcelle N");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING SAUDI ARABIA","OLAYA STREET, RUSAIS COMM");
ConsignorAddressShortCodeType.Add("CAPITAL DRILLING (NAMIBIA) (PROPRIETARY) LIMITED","29 Feld Street");
ConsignorAddressShortCodeType.Add("CAPITAL MINING SERVICES SARL","Abidjan, Cocody - Angre,");
ConsignorAddressShortCodeType.Add("CARGOTEC AUSTRALIA PTY LTD","1 COMO COURT");
ConsignorAddressShortCodeType.Add("CAUTRAC","LYON INDUSTRIAL ESTATE");
ConsignorAddressShortCodeType.Add("CEEC TRUCKS INDUSTRY CO.LTD","99  Automotive High-tech");
ConsignorAddressShortCodeType.Add("CITLAND INTERNATIONAL SA PTY LTD","10 Diesel Road");
ConsignorAddressShortCodeType.Add("CIVILPRO","UNIT 1 56 BOUNDARY ROAD");
ConsignorAddressShortCodeType.Add("CME BLASTING & MINING EQUIPMENT LTD","333 Wyecroft Road");
ConsignorAddressShortCodeType.Add("CMS NMBG (SERVICES) LIMITED","PLOT 36 & 37, MKUYUNI NEW");
ConsignorAddressShortCodeType.Add("COMACCHIO SRL","24 VIA CALLALTA 24B");
ConsignorAddressShortCodeType.Add("COMPRESSED AIR REPAIRS & EQUIPMENT PTY LTD","P o Box 131");
ConsignorAddressShortCodeType.Add("CORPORAAL ENTERPRISES","24 Dellamarta Road");
ConsignorAddressShortCodeType.Add("CQMS RAZER","747 LYTTON ROAD");
ConsignorAddressShortCodeType.Add("DA ANALYTICAL CONSULTING","1/F RIVER COURT");
ConsignorAddressShortCodeType.Add("DATC EUROPE","6 RUE ISAAC NEWTON");
ConsignorAddressShortCodeType.Add("DI-CORP","35 VOODOO CRES");
ConsignorAddressShortCodeType.Add("DIXON GROUP EUROPE LTD","350 WALTON SUMMIT CENTER,");
ConsignorAddressShortCodeType.Add("DOME SHELTER AUSTRALIA","82 BYFIELD STREET");
ConsignorAddressShortCodeType.Add("DONALDSON FILTRATION DEUTSCHLAND GMBH","1 INTERLEUVENLAAN");
ConsignorAddressShortCodeType.Add("DOVER SYSTEMS","12 GILES STREET");
ConsignorAddressShortCodeType.Add("DOWNUNDER MINING","54 PEEL ROAD");
ConsignorAddressShortCodeType.Add("DRICONEQ AFRICA (PTY) LTD","Cnr Harriet & James Brigh");
ConsignorAddressShortCodeType.Add("DRILL EQUIP CC","PST: Kya Sands");
ConsignorAddressShortCodeType.Add("DRILL EQUIP PTY LTD","97 SHEFFIELD ROAD");
ConsignorAddressShortCodeType.Add("DRICONEQ PRODUCTION AB","SVETSAREVAGEN 4");
ConsignorAddressShortCodeType.Add("DRILLING SUPPLY AND MINING SERVICES MAURITANIA","ZRA 453 B TEVRAGH ZEINA");
ConsignorAddressShortCodeType.Add("DV8 TECHNOLOGY LIMITED","UNIT 48, NORTHWAY LANE");
ConsignorAddressShortCodeType.Add("EDMO AUSTRALIA","6 OLNEY COURT");
ConsignorAddressShortCodeType.Add("ELLAPACK","1/6A BRIDGE ROAD");
ConsignorAddressShortCodeType.Add("ENGINE CARE SYSTEMS AUSTRALASIA","SHED 12 30 MUDGEERABA ROA");
ConsignorAddressShortCodeType.Add("ENGINEERING TOP TECH","6 BRASS LINK");
ConsignorAddressShortCodeType.Add("EPIROC DRILLING SOLUTIONS USA","2100 NORTH FIRST STREET");
ConsignorAddressShortCodeType.Add("EPIROC DRILLING TOOLS AB","BLOCK 1, BIORNBACKSVAGEN");
ConsignorAddressShortCodeType.Add("EPIROC MALI SARL","ROUTE DE SOTUBA");
ConsignorAddressShortCodeType.Add("PT EPIROC SOUTHREN ASIA SINGAPORE BRANCH","25 Tuas Avenue 2");
ConsignorAddressShortCodeType.Add("EQUIPMENT HUB PTY LTD","68 Maryland Drive, Regent");
ConsignorAddressShortCodeType.Add("PT ETI FIRE SYSTEMS","Jalan Magelang-Kopeng Klm");
ConsignorAddressShortCodeType.Add("EXPLORATION DRILL MASTERS CHILE SA","Av. Colorado 01200,");
ConsignorAddressShortCodeType.Add("FEAVER TOOLS","63 KURNALL ROAD");
ConsignorAddressShortCodeType.Add("FOREMOST AUSTRALIA","7 CRAFT STREET");
ConsignorAddressShortCodeType.Add("FORDIA GROUP INC","3 Hotel-de-Ville");
ConsignorAddressShortCodeType.Add("GDC (PTY) LTD","PLOT 9268 DUMELA INDUSTRI");
ConsignorAddressShortCodeType.Add("GEARENCH","4450 S. HWY 6");
ConsignorAddressShortCodeType.Add("GEMEX INTERNATIONAL LIMITED","Erenkoy Istasyon Cad Cagl");
ConsignorAddressShortCodeType.Add("GFS FREIGHT SERVICES LTD","84 Drimnagh Road");
ConsignorAddressShortCodeType.Add("GRAYS","6 SPARTAN STREET");
ConsignorAddressShortCodeType.Add("GROUNDBREAKING MINING SOLUTIONS","53 HENSBROOK LOOP");
ConsignorAddressShortCodeType.Add("GULF MINETECH (L.L.C.)","9 AL MUST");
ConsignorAddressShortCodeType.Add("HALADJIAN","1951 AVENUE D'ORANGE");
ConsignorAddressShortCodeType.Add("HALCO BRIGHOUSE LTD","UNIT 2 BIRDS ROYD MILL, B");
ConsignorAddressShortCodeType.Add("HANJIN D&B CO LTD","49 HANAMSAN-DAN 10 BEON-R");
ConsignorAddressShortCodeType.Add("HARDCORE DIAMOND PRODUCTS.","Unit 1/17 Donegal Road");
ConsignorAddressShortCodeType.Add("HORIZON PLANT CE LTD","1 BALLYCOOLIN ROAD");
ConsignorAddressShortCodeType.Add("HUD MINING SUPPLIES","31 BREWERY STREET");
ConsignorAddressShortCodeType.Add("HYDI","37 WEST THEBARTON ROAD");
ConsignorAddressShortCodeType.Add("HYDRATORQUE QLD PTY LTD","2 Henricks Street");
ConsignorAddressShortCodeType.Add("HYDRA TORQUE FLUID POWER SOLUTIONS","2 HENRICKS ST");
ConsignorAddressShortCodeType.Add("IBEX LOGISTICS LIMITED","1403 Bains Avenue, Masaki");
ConsignorAddressShortCodeType.Add("INK COMMUNICATIONS","PO BOX 225");
ConsignorAddressShortCodeType.Add("IQ WELLNESS GROUP","329 HAY STREET");
ConsignorAddressShortCodeType.Add("IVA JOHANN GMBH","IN DEN WEIDEN 29");
ConsignorAddressShortCodeType.Add("JA DELMAS","17 RUE VAUBAN");
ConsignorAddressShortCodeType.Add("JORAL ENGINEERING PTY (LTD)","14 BEDFORD AVENUE");
ConsignorAddressShortCodeType.Add("KAL TIRE MINING SOUTH AFRICA","19 RICHARDS DRIVE");
ConsignorAddressShortCodeType.Add("KITS FZE","ABRAJ");
ConsignorAddressShortCodeType.Add("LEIGHTON PARTS MANAGEMENT","HIGHFIELD FARM");
ConsignorAddressShortCodeType.Add("LIQUID AUTOMATION SYSTEMS PTY LTD","CNR Sam Green And Martin");
ConsignorAddressShortCodeType.Add("LYONS AIRCONDITIONING SERVICES (WA) PTY LDT","157 CHISHOLM CRESCENT");
ConsignorAddressShortCodeType.Add("MANTRAC","KM 28 ALEX CAIRO DESERT R");
ConsignorAddressShortCodeType.Add("MASPRO ENGINEERING PTY LTD","Lot 3, 28 Burnett St.");
ConsignorAddressShortCodeType.Add("MBI GLOBAL INC","110 RUE JACQUES-BIBEAU");
ConsignorAddressShortCodeType.Add("MCCULLOCHS DRILLING AND BORING","205 MIDLAND HIGHWAY");
ConsignorAddressShortCodeType.Add("METZKE ENGINEERING","27 Coulson Way, Canning V");
ConsignorAddressShortCodeType.Add("MILELE MOTORS FZE","AL AWIR ROAD");
ConsignorAddressShortCodeType.Add("MINCON INC","107 INDUSTRIAL PARK RD");
ConsignorAddressShortCodeType.Add("MINCON INTERNATIONAL LIMITED","Smithstown Industrial Est");
ConsignorAddressShortCodeType.Add("MINPAC LOGISTICS (AUSTRALIA) PTY LTD","37 Bligh Street");
ConsignorAddressShortCodeType.Add("MINCON ROCKDRILLS USA, INC.","107 Industrial Park Road");
ConsignorAddressShortCodeType.Add("MINCON ROCKDRILLS PTY LTD","243 Collier Road");
ConsignorAddressShortCodeType.Add("MINE SITE MAINTENANCE","Victoria Street");
ConsignorAddressShortCodeType.Add("MINCON WEST AFRICA","CALLE ADOLFO ALONSO FERNA");
ConsignorAddressShortCodeType.Add("ML GLOBAL SERVICES","2706 19TH ST S");
ConsignorAddressShortCodeType.Add("MOBILE ENERGY AUSTRALIA PTY LTD","39 Dulacca");
ConsignorAddressShortCodeType.Add("MOMA PRODUCTS PTY LTD TRADING","14A Bowen Street");
ConsignorAddressShortCodeType.Add("MONARCH ENGINEERING (PTY) LTD","UNIT 5, LOT 218 SAM NUJOM");
ConsignorAddressShortCodeType.Add("MOSIL LUBRICANTS PRIVATE LIMITED","PLOT NO. A-657, NEAR RAMN");
ConsignorAddressShortCodeType.Add("MUDEX","42 GILLAM DRIVE");
ConsignorAddressShortCodeType.Add("MURRAY MACHINARY","DINNESWOOD, TARVES");
ConsignorAddressShortCodeType.Add("NELION TRADING LTD","ZANZIBAR ROAD");
ConsignorAddressShortCodeType.Add("NEWLAND ASSOCIATES","15 PEARSON STREET");
ConsignorAddressShortCodeType.Add("NILFISK PTY LTD","1504 COLEEN ROAD, HONEYDE");
ConsignorAddressShortCodeType.Add("NITRALIFE SOUTHERN AFRICA (PTY) LTD","UNIT 11 BARBEQUE TERRACE");
ConsignorAddressShortCodeType.Add("NIVEK INDUSTRIES","15 MATHRY CLOSE");
ConsignorAddressShortCodeType.Add("ORICA GHANA LIMITED","NO 83, OSU BADU STREET. P");
ConsignorAddressShortCodeType.Add("OZKONT KONTEYNER DIS TIC LTD STI","VEYSEL KARANI MAH");
ConsignorAddressShortCodeType.Add("PEGASUS TRADING BVBA","De Leiteweg 22");
ConsignorAddressShortCodeType.Add("PK TRUCKS HOLLAND","Graanweg 2");
ConsignorAddressShortCodeType.Add("PRIORITY DRILLING","KILIMOR");
ConsignorAddressShortCodeType.Add("PROGRADEX","5 THE CHANTRELLES");
ConsignorAddressShortCodeType.Add("REAL MINING SUPPLY","8850 NW 18TH TER");
ConsignorAddressShortCodeType.Add("REFLEX INSTRUMENTS EUROPE LTD","5 UPPER STALLS");
ConsignorAddressShortCodeType.Add("RELIABLE INDUSTRIES","5739 G ST");
ConsignorAddressShortCodeType.Add("REMAN AFRICA","13 INNES ROAD,");
ConsignorAddressShortCodeType.Add("ROBIT AUSTRALIA","24-26 GAUGE CIRCUIT");
ConsignorAddressShortCodeType.Add("R&R DRILLING INC","2633 Hwy 25E");
ConsignorAddressShortCodeType.Add("SAFETY WISE SOLUTIONS","856-860 DONCASTER ROAD");
ConsignorAddressShortCodeType.Add("SAMCHEM DRILLING FLUIDS & CHEMICALS (PTY) LTD","c/o Boron & Basalt Street");
ConsignorAddressShortCodeType.Add("SANDVIK MIDDLE EAST FZE","SHEIK ZAYED ROAD");
ConsignorAddressShortCodeType.Add("SANDVIK MINING AND CONSTRUCTION GHANA","NO 12 AGBAAMO STREET");
ConsignorAddressShortCodeType.Add("SANDVIK ROCK MINING","13500 NW COUNTY ROAD 235");
ConsignorAddressShortCodeType.Add("SAUDI ARABIA CAPITAL DRILLING COMPANY FOR MINING","Olaya Street, Rusais Comm");
ConsignorAddressShortCodeType.Add("SCHRAMM AUSTRALIA","52-54 BANKSIA ROAD");
ConsignorAddressShortCodeType.Add("SCHRAMM HAMMERS AND BITS PTY LTD","60 Paramount Drive,");
ConsignorAddressShortCodeType.Add("SCORE INTERNATIONAL","UTSENAKENWEG 26");
ConsignorAddressShortCodeType.Add("SEA CONTAINERS WA","LOT 5 MOYLAN ROAD");
ConsignorAddressShortCodeType.Add("SK GLOBAL SERVICES","308 MAGNAMBOUGOU");
ConsignorAddressShortCodeType.Add("SMC CORPORATION PTY LTD","63 69 DALY STREET");
ConsignorAddressShortCodeType.Add("SONIC DRY CLEAN","1672 MAIN ST STE E");
ConsignorAddressShortCodeType.Add("SOUTH COAST DIESELS","Naas Industrial Estate,");
ConsignorAddressShortCodeType.Add("STEALTH GLOBAL INDUSTRIES UK LIMITED","Fleming Court, Leigh Road");
ConsignorAddressShortCodeType.Add("STEALTH GLOBAL INDUSTRIES (AUSTRALIA) PTY LTD","10/43, Cedric Street");
ConsignorAddressShortCodeType.Add("STORM PROCUREMENT LTD","1 Bell Street");
ConsignorAddressShortCodeType.Add("STS DRILLING & MINING TECHNICAL SERVICES","BUILDING 12, STREET 285,");
ConsignorAddressShortCodeType.Add("SULLAIR LLC","3700 E MICHIGAN BLVD");
ConsignorAddressShortCodeType.Add("SUMMIT EQUIPMENT SUPPLIES LTD","4 COTES PARK INDUSTRIAL E");
ConsignorAddressShortCodeType.Add("SWICK ENGINEERING","64 GREAT EASTERN HIGHWAY");
ConsignorAddressShortCodeType.Add("SWIFT PLANT SPARES","19 LEIGH STREET");
ConsignorAddressShortCodeType.Add("TECHNIDRILL SAS","1ERE AVENUE 18EME RUE ZI");
ConsignorAddressShortCodeType.Add("TECHNICAL MECHANICAL SERVICES","117 STOCKPORT ROAD");
ConsignorAddressShortCodeType.Add("THOR DRILL RIG CC","PLOT 78 VAALBANK, R104 RD");
ConsignorAddressShortCodeType.Add("TL ENGINEERING (AUST) PTY LTD","463 BUSHMEAD ROAD");
ConsignorAddressShortCodeType.Add("TOPARTS PTE LTD","Blk 196 Pandan Loop");
ConsignorAddressShortCodeType.Add("TRADING MAINTENANCE SERVICES","117 KANDA MILE");
ConsignorAddressShortCodeType.Add("TRANSITYRE BV","EIKDONK 5");
ConsignorAddressShortCodeType.Add("TRATCO","117 STOCKPORT ROAD");
ConsignorAddressShortCodeType.Add("TREJA GLOBAL SUPPLY","21 DARLOT RD");
ConsignorAddressShortCodeType.Add("TURNKEY HYDRAULICS","P O Box 14521,Wadeville 1");
ConsignorAddressShortCodeType.Add("TWIGA INVESTMENTS T/A MINE EQUIP","25 BOTHA STREET");
ConsignorAddressShortCodeType.Add("UNATRAC LTD","188 BATH ROAD");
ConsignorAddressShortCodeType.Add("UNIQUE CORE PRODUCTS AFRICA PTY LTD","5 CR SWART DRIVE");
ConsignorAddressShortCodeType.Add("WELLFORCE INTERNATIONAL LTD","Well Force International");
ConsignorAddressShortCodeType.Add("WESTERN AIR","36 REGENT STREET");
ConsignorAddressShortCodeType.Add("WINCHESTER SUPPLY","8 MOORSIDE PLACE");
ConsignorAddressShortCodeType.Add("WORLDWIDE PLANT LIMITED","WATERSIDE COTTAGE");
ConsignorAddressShortCodeType.Add("ZERO TRIP INNOVATIONS LTD","KILLIMOR");


  if (ConsignorAddressShortCodeType.ContainsKey(inputDataString))
       outDataString = ConsignorAddressShortCodeType[inputDataString];
     return outDataString;
 }
 
public static string GetConsignorAddressOrgCode(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> ConsignorOrgCodeType=new System.Collections.Generic.Dictionary<string,string>();
     
ConsignorOrgCodeType.Add("ADVANCED LOGIC TECHNOLOGY SA","ADVLOGLUX");
ConsignorOrgCodeType.Add("AFRIQUE ATLANTIC SERVICES (GH) LTD","AFRATLTKD");
ConsignorOrgCodeType.Add("AL-JAN INTERNATIONAL INC.","ALJANI9MO");
ConsignorOrgCodeType.Add("ALLIED HEAT TRANSFER INTERNATIONAL","ALLHEAPER");
ConsignorOrgCodeType.Add("ALLIANCE SCIENTIFIC","ALLSCIJNB");
ConsignorOrgCodeType.Add("AL NOOR MOTORS FZCO","ALNOORDXB");
ConsignorOrgCodeType.Add("AMC EUROPE GMBH","AMCEURHAM");
ConsignorOrgCodeType.Add("AMERICAN DIAMOND TOOL","AMEDIASLC");
ConsignorOrgCodeType.Add("AMIS","AMISJNB");
ConsignorOrgCodeType.Add("ANDREW PETERSON","ANDPETBNE");
ConsignorOrgCodeType.Add("A.NOBLE & SON LTD","ANOSONADL");
ConsignorOrgCodeType.Add("ARABIAN AFRICAN GMBH & CO","ARAAFRFRA");
ConsignorOrgCodeType.Add("ASTRAK GROUP LTD","ASTRAKGRG");
ConsignorOrgCodeType.Add("ATLAS COPCO POWER TECHNIQUE","ATLCOPSYD");
ConsignorOrgCodeType.Add("ATOM BITS","ATOBITYTO");
ConsignorOrgCodeType.Add("AUSTIN ENGINEERING","AUSENGPER");
ConsignorOrgCodeType.Add("AUSTRALIAN EXPLORATION ENGINEERING (AUSTEX)","AUSEXPPER");
ConsignorOrgCodeType.Add("AUSTECH INDUSTRIES","AUSINDYVR");
ConsignorOrgCodeType.Add("AUSTRALASIAN MINING SERVICES PTY LTD","AUSMINPER");
ConsignorOrgCodeType.Add("AUSPLANT","AUSPLABNE");
ConsignorOrgCodeType.Add("BEIJING FEILONG INTERNATIONAL TRADE CO LTD","BEIFEIBJS");
ConsignorOrgCodeType.Add("BOART LONGYEAR CANADA","BOALON");
ConsignorOrgCodeType.Add("BOART LONGYEAR AUSTRALIA PTY LTD","BOALONADL");
ConsignorOrgCodeType.Add("BOART LONGYEAR SUISSE SARL","BOALONGVA");
ConsignorOrgCodeType.Add("BOART LONGYEAR SOUTH AFRICA (PTY) LTD","BOALONJNB");
ConsignorOrgCodeType.Add("BRUGTECH GMBH","BRUGTEFRA");
ConsignorOrgCodeType.Add("BULLIVANTS","BULLIVSYD");
ConsignorOrgCodeType.Add("BUS 4X4 GLOBAL PTY LTD","BUS4X4BNE");
ConsignorOrgCodeType.Add("CAPDRILL AUSTRALIA PTY LTD","CAPAUSPER");
ConsignorOrgCodeType.Add("CAPITAL DRILLING CÔTE D'IVOIRE LIMITED SARL","CAPDRIABJ");
ConsignorOrgCodeType.Add("CAPITAL DRILLING LTD","CAPDRIBDA");
ConsignorOrgCodeType.Add("CAPITAL DRILLING MALI SARL","CAPDRIBKO");
ConsignorOrgCodeType.Add("CAPITAL DRILLING EGYPT (LLC)","CAPDRICAI");
ConsignorOrgCodeType.Add("CAPITAL DRILLING GUINEA SA","CAPDRICKY");
ConsignorOrgCodeType.Add("CAPITAL DRILLING BOTSWANA","CAPDRIFRW");
ConsignorOrgCodeType.Add("CAPITAL DRILLING (MAURITIUS) LTD","CAPDRIMRU");
ConsignorOrgCodeType.Add("CAPITAL DRILLING (T) LIMITED","CAPDRIMWZ");
ConsignorOrgCodeType.Add("CAPITAL DRILLING (MAURITANIA) SARL","CAPDRINKC");
ConsignorOrgCodeType.Add("CAPITAL DRILLING - BURKINA FASO SARL","CAPDRIOUA");
ConsignorOrgCodeType.Add("CAPITAL DRILLING SAUDI ARABIA","CAPDRIRUH");
ConsignorOrgCodeType.Add("CAPITAL DRILLING (NAMIBIA) (PROPRIETARY) LIMITED","CAPDRIWDH");
ConsignorOrgCodeType.Add("CAPITAL MINING SERVICES SARL","CAPMINABJ");
ConsignorOrgCodeType.Add("CARGOTEC AUSTRALIA PTY LTD","CARAUSMEL");
ConsignorOrgCodeType.Add("CAUTRAC","CAUTRALON");
ConsignorOrgCodeType.Add("CEEC TRUCKS INDUSTRY CO.LTD","CEETRUSHA");
ConsignorOrgCodeType.Add("CITLAND INTERNATIONAL SA PTY LTD","CITINT");
ConsignorOrgCodeType.Add("CIVILPRO","CIVILPBNE");
ConsignorOrgCodeType.Add("CME BLASTING & MINING EQUIPMENT LTD","CMEBLAYTO");
ConsignorOrgCodeType.Add("CMS NMBG (SERVICES) LIMITED","CMSNMBMWZ");
ConsignorOrgCodeType.Add("COMACCHIO SRL","COMACCGOA");
ConsignorOrgCodeType.Add("COMPRESSED AIR REPAIRS & EQUIPMENT PTY LTD","COMAIRPER");
ConsignorOrgCodeType.Add("CORPORAAL ENTERPRISES","CORENTPER");
ConsignorOrgCodeType.Add("CQMS RAZER","CQMRAZBNE");
ConsignorOrgCodeType.Add("DA ANALYTICAL CONSULTING","DAANALMRU");
ConsignorOrgCodeType.Add("DATC EUROPE","DATEURPAR");
ConsignorOrgCodeType.Add("DI-CORP","DICORPYYZ");
ConsignorOrgCodeType.Add("DIXON GROUP EUROPE LTD","DIXEURLON");
ConsignorOrgCodeType.Add("DOME SHELTER AUSTRALIA","DOMSHEPER");
ConsignorOrgCodeType.Add("DONALDSON FILTRATION DEUTSCHLAND GMBH","DONFILBRU");
ConsignorOrgCodeType.Add("DOVER SYSTEMS","DOVSYSJNB");
ConsignorOrgCodeType.Add("DOWNUNDER MINING","DOWMINPER");
ConsignorOrgCodeType.Add("DRICONEQ AFRICA (PTY) LTD","DRIAFRJNB");
ConsignorOrgCodeType.Add("DRILL EQUIP CC","DRIEQUJNB");
ConsignorOrgCodeType.Add("DRILL EQUIP PTY LTD","DRIEQUPER");
ConsignorOrgCodeType.Add("DRICONEQ PRODUCTION AB","DRIPROSTO");
ConsignorOrgCodeType.Add("DRILLING SUPPLY AND MINING SERVICES MAURITANIA","DRISUPNKC");
ConsignorOrgCodeType.Add("DV8 TECHNOLOGY LIMITED","DV8TECLHR");
ConsignorOrgCodeType.Add("EDMO AUSTRALIA","EDMAUSBNE");
ConsignorOrgCodeType.Add("ELLAPACK","ELLAPAMEL");
ConsignorOrgCodeType.Add("ENGINE CARE SYSTEMS AUSTRALASIA","ENGCARBNE");
ConsignorOrgCodeType.Add("ENGINEERING TOP TECH","ENGTOPJNB");
ConsignorOrgCodeType.Add("EPIROC DRILLING SOLUTIONS USA","EPIDRIIAH");
ConsignorOrgCodeType.Add("EPIROC DRILLING TOOLS AB","EPIDRISTO");
ConsignorOrgCodeType.Add("EPIROC MALI SARL","EPIMALBKO");
ConsignorOrgCodeType.Add("PT EPIROC SOUTHREN ASIA SINGAPORE BRANCH","EPISOUSIN");
ConsignorOrgCodeType.Add("EQUIPMENT HUB PTY LTD","EQUHUBBNE");
ConsignorOrgCodeType.Add("PT ETI FIRE SYSTEMS","ETIFIRJKT");
ConsignorOrgCodeType.Add("EXPLORATION DRILL MASTERS CHILE SA","EXPDRISCL");
ConsignorOrgCodeType.Add("FEAVER TOOLS","FEATOOPER");
ConsignorOrgCodeType.Add("FOREMOST AUSTRALIA","FORAUSPER");
ConsignorOrgCodeType.Add("FORDIA GROUP INC","FORDIAYUL");
ConsignorOrgCodeType.Add("GDC (PTY) LTD","GDCFRW");
ConsignorOrgCodeType.Add("GEARENCH","GEARENDFW");
ConsignorOrgCodeType.Add("GEMEX INTERNATIONAL LIMITED","GEMINTISL");
ConsignorOrgCodeType.Add("GFS FREIGHT SERVICES LTD","GFSFRE");
ConsignorOrgCodeType.Add("GRAYS","GRAYSPER");
ConsignorOrgCodeType.Add("GROUNDBREAKING MINING SOLUTIONS","GROMINPER");
ConsignorOrgCodeType.Add("GULF MINETECH (L.L.C.)","GULMINDXB");
ConsignorOrgCodeType.Add("HALADJIAN","HALADJCDG");
ConsignorOrgCodeType.Add("HALCO BRIGHOUSE LTD","HALBRILON");
ConsignorOrgCodeType.Add("HANJIN D&B CO LTD","HANJDBPUS");
ConsignorOrgCodeType.Add("HARDCORE DIAMOND PRODUCTS.","HARDIAADL");
ConsignorOrgCodeType.Add("HORIZON PLANT CE LTD","HORPLADUB");
ConsignorOrgCodeType.Add("HUD MINING SUPPLIES","HUDMINJNB");
ConsignorOrgCodeType.Add("HYDI","HYDIADL");
ConsignorOrgCodeType.Add("HYDRATORQUE QLD PTY LTD","HYDQLDBNE");
ConsignorOrgCodeType.Add("HYDRA TORQUE FLUID POWER SOLUTIONS","HYDTORBNE");
ConsignorOrgCodeType.Add("IBEX LOGISTICS LIMITED","IBELOG");
ConsignorOrgCodeType.Add("INK COMMUNICATIONS","INKCOMPER");
ConsignorOrgCodeType.Add("IQ WELLNESS GROUP","IQWELLPER");
ConsignorOrgCodeType.Add("IVA JOHANN GMBH","IVAJOHDTM");
ConsignorOrgCodeType.Add("JA DELMAS","JADELMBOD");
ConsignorOrgCodeType.Add("JORAL ENGINEERING PTY (LTD)","JORENGJNB");
ConsignorOrgCodeType.Add("KAL TIRE MINING SOUTH AFRICA","KALTIRJNB");
ConsignorOrgCodeType.Add("KITS FZE","KITFZEDXB");
ConsignorOrgCodeType.Add("LEIGHTON PARTS MANAGEMENT","LEIPARLON");
ConsignorOrgCodeType.Add("LIQUID AUTOMATION SYSTEMS PTY LTD","LIQAUTJNB");
ConsignorOrgCodeType.Add("LYONS AIRCONDITIONING SERVICES (WA) PTY LDT","LYOAIRPER");
ConsignorOrgCodeType.Add("MANTRAC","MANTRAALY");
ConsignorOrgCodeType.Add("MASPRO ENGINEERING PTY LTD","MASENGSYD");
ConsignorOrgCodeType.Add("MBI GLOBAL INC","MBIGLOYYZ");
ConsignorOrgCodeType.Add("MCCULLOCHS DRILLING AND BORING","MCCDRIMEL");
ConsignorOrgCodeType.Add("METZKE ENGINEERING","METENGPER");
ConsignorOrgCodeType.Add("MILELE MOTORS FZE","MILMOTDXB");
ConsignorOrgCodeType.Add("MINCON INC","MINCONMDW");
ConsignorOrgCodeType.Add("MINCON INTERNATIONAL LIMITED","MININTSNN");
ConsignorOrgCodeType.Add("MINPAC LOGISTICS (AUSTRALIA) PTY LTD","MINLOGSYD");
ConsignorOrgCodeType.Add("MINCON ROCKDRILLS USA, INC.","MINROC");
ConsignorOrgCodeType.Add("MINCON ROCKDRILLS PTY LTD","MINROCPER");
ConsignorOrgCodeType.Add("MINE SITE MAINTENANCE","MINSITBDA");
ConsignorOrgCodeType.Add("MINCON WEST AFRICA","MINWESLPA");
ConsignorOrgCodeType.Add("ML GLOBAL SERVICES","MLGLOBIAH");
ConsignorOrgCodeType.Add("MOBILE ENERGY AUSTRALIA PTY LTD","MOBENEBNE");
ConsignorOrgCodeType.Add("MOMA PRODUCTS PTY LTD TRADING","MOMPROPER");
ConsignorOrgCodeType.Add("MONARCH ENGINEERING (PTY) LTD","MONENGFRW");
ConsignorOrgCodeType.Add("MOSIL LUBRICANTS PRIVATE LIMITED","MOSLUBBOM");
ConsignorOrgCodeType.Add("MUDEX","MUDEXPER");
ConsignorOrgCodeType.Add("MURRAY MACHINARY","MURMACLON");
ConsignorOrgCodeType.Add("NELION TRADING LTD","NELTRAMBA");
ConsignorOrgCodeType.Add("NEWLAND ASSOCIATES","NEWASSPER");
ConsignorOrgCodeType.Add("NILFISK PTY LTD","NILFISJNB");
ConsignorOrgCodeType.Add("NITRALIFE SOUTHERN AFRICA (PTY) LTD","NITSOUJNB");
ConsignorOrgCodeType.Add("NIVEK INDUSTRIES","NIVINDSYD");
ConsignorOrgCodeType.Add("ORICA GHANA LIMITED","ORIGHAACC");
ConsignorOrgCodeType.Add("OZKONT KONTEYNER DIS TIC LTD STI","OZKKONISL");
ConsignorOrgCodeType.Add("PEGASUS TRADING BVBA","PEGTRABRU");
ConsignorOrgCodeType.Add("PK TRUCKS HOLLAND","PKTRUC");
ConsignorOrgCodeType.Add("PRIORITY DRILLING","PRIDRIDUB");
ConsignorOrgCodeType.Add("PROGRADEX","PROGRALON");
ConsignorOrgCodeType.Add("REAL MINING SUPPLY","REAMINMIA");
ConsignorOrgCodeType.Add("REFLEX INSTRUMENTS EUROPE LTD","REFINSLHR");
ConsignorOrgCodeType.Add("RELIABLE INDUSTRIES","RELINDMSY");
ConsignorOrgCodeType.Add("REMAN AFRICA","REMAFRJNB");
ConsignorOrgCodeType.Add("ROBIT AUSTRALIA","ROBAUSPER");
ConsignorOrgCodeType.Add("R&R DRILLING INC","RRDRILTZW");
ConsignorOrgCodeType.Add("SAFETY WISE SOLUTIONS","SAFWISMEL");
ConsignorOrgCodeType.Add("SAMCHEM DRILLING FLUIDS & CHEMICALS (PTY) LTD","SAMDRIJNB");
ConsignorOrgCodeType.Add("SANDVIK MIDDLE EAST FZE","SANMIDDXB");
ConsignorOrgCodeType.Add("SANDVIK MINING AND CONSTRUCTION GHANA","SANMINACC");
ConsignorOrgCodeType.Add("SANDVIK ROCK MINING","SANROCJAX");
ConsignorOrgCodeType.Add("SAUDI ARABIA CAPITAL DRILLING COMPANY FOR MINING","SAUARA");
ConsignorOrgCodeType.Add("SCHRAMM AUSTRALIA","SCHAUSPER");
ConsignorOrgCodeType.Add("SCHRAMM HAMMERS AND BITS PTY LTD","SCHHAMPER");
ConsignorOrgCodeType.Add("SCORE INTERNATIONAL","SCOINTBRU");
ConsignorOrgCodeType.Add("SEA CONTAINERS WA","SEACONPER");
ConsignorOrgCodeType.Add("SK GLOBAL SERVICES","SKGLOBBKO");
ConsignorOrgCodeType.Add("SMC CORPORATION PTY LTD","SMCPER");
ConsignorOrgCodeType.Add("SONIC DRY CLEAN","SONDRYLAX");
ConsignorOrgCodeType.Add("SOUTH COAST DIESELS","SOUCOADUB");
ConsignorOrgCodeType.Add("STEALTH GLOBAL INDUSTRIES UK LIMITED","STEGLOLON");
ConsignorOrgCodeType.Add("STEALTH GLOBAL INDUSTRIES (AUSTRALIA) PTY LTD","STEGLOPER");
ConsignorOrgCodeType.Add("STORM PROCUREMENT LTD","STOPROJNB");
ConsignorOrgCodeType.Add("STS DRILLING & MINING TECHNICAL SERVICES","STSDRICAI");
ConsignorOrgCodeType.Add("SULLAIR LLC","SULLAIMGC");
ConsignorOrgCodeType.Add("SUMMIT EQUIPMENT SUPPLIES LTD","SUMEQULON");
ConsignorOrgCodeType.Add("SWICK ENGINEERING","SWIENGPER");
ConsignorOrgCodeType.Add("SWIFT PLANT SPARES","SWIPLALON");
ConsignorOrgCodeType.Add("TECHNIDRILL SAS","TECHNICOS");
ConsignorOrgCodeType.Add("TECHNICAL MECHANICAL SERVICES","TECMECLON");
ConsignorOrgCodeType.Add("THOR DRILL RIG CC","THODRIJNB");
ConsignorOrgCodeType.Add("TL ENGINEERING (AUST) PTY LTD","TLENGIPER");
ConsignorOrgCodeType.Add("TOPARTS PTE LTD","TOPARTSIN");
ConsignorOrgCodeType.Add("TRADING MAINTENANCE SERVICES","TRAMAIACC");
ConsignorOrgCodeType.Add("TRANSITYRE BV","TRANSIAMS");
ConsignorOrgCodeType.Add("TRATCO","TRATCOLON");
ConsignorOrgCodeType.Add("TREJA GLOBAL SUPPLY","TREGLOPER");
ConsignorOrgCodeType.Add("TURNKEY HYDRAULICS","TURHYD");
ConsignorOrgCodeType.Add("TWIGA INVESTMENTS T/A MINE EQUIP","TWIINVJNB");
ConsignorOrgCodeType.Add("UNATRAC LTD","UNATRALON");
ConsignorOrgCodeType.Add("UNIQUE CORE PRODUCTS AFRICA PTY LTD","UNICORJNB");
ConsignorOrgCodeType.Add("WELLFORCE INTERNATIONAL LTD","WELINT");
ConsignorOrgCodeType.Add("WESTERN AIR","WESAIRADL");
ConsignorOrgCodeType.Add("WINCHESTER SUPPLY","WINSUPLON");
ConsignorOrgCodeType.Add("WORLDWIDE PLANT LIMITED","WORPLALON");
ConsignorOrgCodeType.Add("ZERO TRIP INNOVATIONS LTD","ZERTRIDUB");



  if (ConsignorOrgCodeType.ContainsKey(inputDataString))
       outDataString = ConsignorOrgCodeType[inputDataString];
     return outDataString;
 }
 
 
public string StringUpperCase(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.ToUpper(System.Globalization.CultureInfo.InvariantCulture);
}
 
]]>
  </msxsl:script>
</xsl:stylesheet>