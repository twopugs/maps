<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://HobbsGlobal.Schemas.StefaniOrders" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />  
  <xsl:template match="/">
    <xsl:apply-templates select="/OrderRequests" />
  </xsl:template>
  <xsl:template match="/OrderRequests">
    <xsl:variable name="var:v1" select="&quot;1.1&quot;" />
    <UniversalShipment>
      <xsl:attribute name="version">
        <xsl:value-of select="$var:v1" />
      </xsl:attribute>
      <Shipment>
        <DataContext>
          <DataTargetCollection>
            <DataTarget>
              <Type>
                <xsl:value-of select="string('WarehouseOrder')" />
              </Type>
            </DataTarget>
          </DataTargetCollection>
          <DataProvider>KAHAKLAKL</DataProvider>
        </DataContext>
        <LocalProcessing>
          <DeliveryRequiredBy>
            <xsl:value-of select="userCSharp:ConvertDateValue(Order/DeliveryRequiredBy/text())" />
          </DeliveryRequiredBy>
        </LocalProcessing>
        <Order>
          <OrderNumber><xsl:value-of select="Order/OrderNumber/text()" /></OrderNumber>
          <ClientReference>
            <xsl:value-of select="Order/ClientReference/text()" />
          </ClientReference>
          <Type>
            <Code>
              <xsl:value-of select="&quot;ORD&quot;" />
            </Code>
          </Type>
          <Warehouse>
            <Code>
              <xsl:value-of select="&quot;HOB&quot;"/>
            </Code>
          </Warehouse>
          <OrderLineCollection>
            <xsl:for-each select="Order/LineItems">
              <xsl:for-each select="LineItem">
                <xsl:if test="string-length(C/text())!=0">
                <OrderLine>
                  <xsl:if test="C">
                    <OrderedQty>
                      <xsl:value-of select="C/text()" />
                    </OrderedQty>
                  </xsl:if>
                  <OrderedQtyUnit>
                    <Code>
                      <xsl:value-of select="&quot;UNT&quot;" />
                    </Code>
                  </OrderedQtyUnit>
                  <Product>
                    <xsl:if test="A">
                      <Code>
                        <xsl:value-of select="A/text()" />
                      </Code>
                    </xsl:if>
                  </Product>
                </OrderLine>
                </xsl:if>
              </xsl:for-each>
            </xsl:for-each>
          </OrderLineCollection>        
        </Order>
        <OrganizationAddressCollection>
          <OrganizationAddress>
            <AddressType>ConsigneeAddress</AddressType>
             <CompanyName>
                <xsl:value-of select="Order/AddressName/text()"/>
            </CompanyName>            
        <!--  <SuppressAddressValidationError>
				                <xsl:value-of select="string('true')" />
				  </SuppressAddressValidationError>-->
            <Address1>
              <xsl:value-of select="Order/AddressLine1/text()"/>
            </Address1>
            <City>
              <xsl:value-of select="Order/AddressLine3/text()"/>
            </City>
            <AddressOverride>
              <xsl:value-of select="&quot;false&quot;"/>
            </AddressOverride>
          </OrganizationAddress>          
          <OrganizationAddress>
            <AddressType>ConsignorDocumentaryAddress</AddressType>
            <AddressShortCode>53-55 BANKSIA ROAD</AddressShortCode>
            <OrganizationCode>STEAUSPER</OrganizationCode>
          </OrganizationAddress>
          <OrganizationAddress>
            <AddressType>SendersLocalClient</AddressType>
            <AddressShortCode>STEAUSPER</AddressShortCode>
            <OrganizationCode>STEAUSPER</OrganizationCode>
          </OrganizationAddress>
          <OrganizationAddress>
            <AddressType>TransportCompanyDocumentaryAddress</AddressType>
            <AddressShortCode>UNIT 2, 36 VICTORIA STREE</AddressShortCode>
            <OrganizationCode>FASCOUAKL</OrganizationCode>
          </OrganizationAddress>
        </OrganizationAddressCollection>
      </Shipment>
    </UniversalShipment>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[      
      public static string ConvertDateValue(string inputDateString)
              {
                  string outDateString;
                  string month,date,year;
                    string[] inputArray = inputDateString.Split('/');
                    month=inputArray[0];
                    date=inputArray[1];
                    year=inputArray[2];
                    
                    if(month.Length == 1)
                    {
                    month="0"+month;}
                    else{
                    
                    }
                       if(date.Length == 1)
                    {
                    date="0"+date;}
                    else{
                    
                    }
                   inputDateString=month+"/"+date+"/"+year;
                  System.String[] dateString = inputDateString.Split('/');
                  System.DateTime dt = DateTime.ParseExact(inputDateString, "MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                  outDateString = dt.AddDays(2).ToString("yyyy-MM-ddTHH:mm:ss");

                  return outDateString;
                  
              }  
       public static string GetBunningAddCode(string inputDataString)
       {
            string outDescription = string.Empty;
            System.Collections.Generic.Dictionary<string, string> addressCode = new System.Collections.Generic.Dictionary<string, string>();
            addressCode.Add("10 WESTWOOD AVENUE", "10 WESTWOOD AVENUE"); addressCode.Add("107 MANUKAU ROAD PUKEKOHE","107 MANUKAU ROAD PUKEKOHE"); addressCode.Add("131 RIDGEWAY ST","131 RIDGEWAY ST"); addressCode.Add("131 RIDGEWAY ST1","BUNNINGS WANGANUI"); addressCode.Add("15 EYRE ST","15 EYRE ST"); addressCode.Add("15 HOME PLACE","15 HOME PLACE");
            addressCode.Add("167-17 GREAT SOUTH ROAD","167-17 GREAT SOUTH ROAD"); addressCode.Add("175-179 GLOVER ROAD","175-179 GLOVER ROAD"); addressCode.Add("177 CARNARVON ST","177 CARNARVON ST"); addressCode.Add("18 HIBISCUS COAST HIGHWAY","18 HIBISCUS COAST HIGHWAY"); addressCode.Add("18 STRATHALLAN ST","18 STRATHALLAN ST"); addressCode.Add("197 MARSHLAND ROAD","197 MARSHLAND ROAD");
            addressCode.Add("2 CARR ROAD","2 CARR ROAD"); addressCode.Add("2 TITIRANGI ROAD NEW LYNN","2 TITIRANGI ROAD NEW LYNN"); addressCode.Add("22-54 KINSFORD SMITH ST","22-54 KINSFORD SMITH ST"); addressCode.Add("235 CAMBRIDGE TERRACE","235 CAMBRIDGE TERRACE"); addressCode.Add("244 ARAWATA ST","TE AWAMUTU"); addressCode.Add("244 ARAWATA STREET","244 ARAWATA STREET");
            addressCode.Add("26-48 OLD TAUPO RD","26-48 OLD TAUPO RD"); addressCode.Add("30 EMA ST","30 EMA ST"); addressCode.Add("301 MARKET STREET","301 MARKET STREET"); addressCode.Add("363 WEST STREET ALLENTON","363 WEST STREET ALLENTON"); addressCode.Add("406 KING ST HASTINGS","406 KING ST HASTINGS"); addressCode.Add("446 TE RAPA RD","446 TE RAPA RD");
            addressCode.Add("459 ELLERSLIE PANMURE HIGHWAY MT WELLINGTON","459 ELLERSLIE PANMURE HIG"); addressCode.Add("46-56 TORY ST TE ARO","46-56 TORY ST"); addressCode.Add("47 THE ESPLANADE","47 THE ESPLANADE"); addressCode.Add("494 ROSEBANK RD","494 ROSEBANK RD"); addressCode.Add("5 JEAN BATTEN DRIVE","5 JEAN BATTEN DRIVE"); addressCode.Add("59 MOLESWORTH ST","59 MOLESWORTH ST");
            addressCode.Add("7 FAIRWAY DR","7 FAIRWAY DR"); addressCode.Add("76 SAXTON ROAD","76 SAXTON ROAD"); addressCode.Add("78 CARBINE ROAD","CARBINE ROAD"); addressCode.Add("9 HERIOT DRIVE","9 HERIOT DRIVE"); addressCode.Add("90 SPA ROAD","90 SPA ROAD");
            addressCode.Add("94 CRYERS RD","94 CRYERS RD"); addressCode.Add("AICKIN ROAD","AICKIN ROAD"); addressCode.Add("AICKIN ROAD WHANGAMATA","AICKIN ROAD WHANGAMATA"); addressCode.Add("ANNE STREET","ANNE STREET"); addressCode.Add("ASHWORTH ST","ASHWORTH ST");
            addressCode.Add("CNR ARCHERS & WAIRAU ROADS","CNR ARCHERS & WAIRAU ROAD"); addressCode.Add("CNR BLENHEIM ROAD & FOSTER STREET","CNR BLENHEIM ROAD & FOSTE"); addressCode.Add("CNR BURSWOOD DR & TI RAKAU DRIVE","CNR BURSWOOD DR & TI RAKA"); addressCode.Add("CNR KAHIKATEA & QUENTIN DRIVE","CNR KAHIKATEA & QUENTIN D"); addressCode.Add("CNR PEEL ST&KAHUTIA ST","CNR PEEL ST&KAHUTIA ST");
            addressCode.Add("CNR SH 30 & PHOENIX DRIVE","CNR SH 30 & PHOENIX DRIVE");addressCode.Add("CNR TAUROA STREET & STATE HWY 1","CNR TAUROA STREET & STATE");addressCode.Add("CNR TREMAINE DR & RAILWAY ROAD","CNR TREMAINE DR & RAILWAY");addressCode.Add("LAKE ST CAMBRIDGE","LAKE ST CAMBRIDGE");addressCode.Add("LAMBIE DR","LAMBIE DR");addressCode.Add("MAIN RD","MAIN RD");
            addressCode.Add("MANGAKAHIA ROAD","MANGAKAHIA ROAD");addressCode.Add("PRINCES ST","PRINCES ST");addressCode.Add("TAYLORS AVE PAEROA","TAYLORS AVE PAEROA");
            

            if (addressCode.ContainsKey(inputDataString))
            {
                outDescription = (string)addressCode[inputDataString];
            }            
            
            return outDescription;
       }
       public static object _lock = new object();
       public static void CheckForEmptyAndWriteLog(string addCode, string OrgCode ,string addLine1,string addLine2,string addLine3,string addName)
       {
          if(System.String.IsNullOrEmpty(addCode) || System.String.IsNullOrEmpty(OrgCode))
          {
            string sSource = "BizTalk Server";
            string sLog = "Application";
            if (!System.Diagnostics.EventLog.SourceExists(sSource))
                    System.Diagnostics.EventLog.CreateEventSource(sSource, sLog);
         
                System.Diagnostics.EventLog.WriteEntry(sSource, System.String.Format("Hobbs Stefani Map Error: address master data mismatch, \r\n AddName:{0}\r\n AddLine1:{1}\r\n AddLine2:{2}\r\n AddLine3:{3}",addName,addLine1,addLine2,addLine3), System.Diagnostics.EventLogEntryType.Error,234);
                try
                {          
                      lock (_lock)
                      {
                        using (System.IO.StreamWriter w = System.IO.File.AppendText(@"C:\BizTalkTest\HobbsGlobal\log.txt"))
                              {
                                  w.Write("\r\nLog Entry : ");
                                  w.WriteLine("{0}", System.DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss"));
                                  w.WriteLine("  :");
                                  w.WriteLine("  :{0}\r\n{1}\r\n{2}\r\n{3}", addName,addLine1,addLine2,addLine3);
                                  w.WriteLine("-------------------------------");
                              }
                       }
                }
               catch(Exception ex)
               {
                System.Diagnostics.EventLog.WriteEntry(sSource, System.String.Format("Hobbs Stefani Map Logging process error: {0}",ex.Message), System.Diagnostics.EventLogEntryType.Error,235);
               }
          }
       }
       
       public static void CallLog()
       {
        System.Diagnostics.EventLog.WriteEntry("BizTalk Server", System.String.Format("Hobbs Stefani Map Error: error"), System.Diagnostics.EventLogEntryType.Error,234);
        }

]]>
  </msxsl:script>
</xsl:stylesheet>