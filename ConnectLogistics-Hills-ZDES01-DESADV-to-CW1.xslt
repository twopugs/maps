<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/EFACT_D96A_DESADV_EAN006" />
  </xsl:template>
  <xsl:template match="/EFACT_D96A_DESADV_EAN006">
	
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
				<DataProvider>HILLS</DataProvider>
				<EnterpriseID>OGS</EnterpriseID>
				<EventBranch>
					<Code>MLL</Code>
				</EventBranch>
				<ServerID>PRD</ServerID>
			</DataContext>	
			<TotalNoOfPacks>	
				<xsl:value-of select="sum(CPSLoop1/LINLoop1/QTY_2/C186_2[C18601='12']/C18602)"/>
			</TotalNoOfPacks>
			<xsl:if test="DTM/C507[C50701='11']/C50702 !=''">			
				<LocalProcessing>
					<DeliveryRequiredBy>
						<xsl:value-of select="concat(substring(DTM/C507[C50701='11']/C50702,1,4),'-',substring(DTM/C507[C50701='11']/C50702,5,2),'-',substring(DTM/C507[C50701='11']/C50702,7,2),'T00:00:00')"/>
					</DeliveryRequiredBy>
				</LocalProcessing>
			</xsl:if>
			<Order>
				<OrderNumber>
					<xsl:value-of select="CPSLoop1/LINLoop1/RFFLoop3/RFF_4/C506_4[C50601='ON']/C50602"/>
				</OrderNumber>
				<ClientReference>
					<xsl:value-of select="CPSLoop1/LINLoop1/RFFLoop3/RFF_4/C506_4[C50601='AAK']/C50602"/>
				</ClientReference>
				<Warehouse>
					<Code>DN1</Code>
				</Warehouse>
				<OrderLineCollection Content="Complete">
					<xsl:for-each select="CPSLoop1">
						<!-- <xsl:variable name="CPSFLAG"> -->
							<!-- <xsl:choose> -->
								<!-- <xsl:when test="CPS/CPS03 != ''"> -->
									<!-- <xsl:value-of select="CPS/CPS03"/> -->
								<!-- </xsl:when>				 -->
								<!-- <xsl:otherwise>	 -->
									<!-- <xsl:value-of select="string('NA')" /> -->
								<!-- </xsl:otherwise> -->
							<!-- </xsl:choose> -->
						<!-- </xsl:variable> -->
						<xsl:for-each select="LINLoop1">
							<OrderLine>
								<OrderedQty>
									<xsl:value-of select="QTY_2/C186_2[C18601='12']/C18602"/>
								</OrderedQty>
								<OrderedQtyUnit>
									<Code>
										<xsl:value-of select="QTY_2/C186_2[C18601='12']/C18603"/>
									</Code>
								</OrderedQtyUnit>
								<PartAttribute1>
									<xsl:value-of select="PCILoop2/GINLoop2/GIN_3[GIN01='BX']/C208_11/C20801"/>
								</PartAttribute1>
								<Product>
									<Code>
										<xsl:value-of select="PIA[PIA01='5']/C212_2/C21201"/>
									</Code>
								</Product>
								<CustomizedFieldCollection>
									<xsl:if test="LIN/LIN01 !=''">	
										<CustomizedField>
											<Value>
												<xsl:value-of select="LIN/LIN01"/>
											</Value>
											<DataType>String</DataType>
											<!-- <Key>Best Before date</Key> -->
										</CustomizedField>
									</xsl:if>
								</CustomizedFieldCollection>
							</OrderLine>
						</xsl:for-each>
					</xsl:for-each>
				</OrderLineCollection>
			</Order>
			<CustomizedFieldCollection>
				<xsl:if test="CPSLoop1/LINLoop1/RFFLoop3/RFF_4/C506_4[C50601='AAK']/C50602 != ''">	
					<CustomizedField>
						<Value>
							<xsl:value-of select="CPSLoop1/LINLoop1/RFFLoop3/RFF_4/C506_4[C50601='AAK']/C50602"/>
						</Value>
						<DataType>String</DataType>
						<Key>Despatch Advice Number</Key>
					</CustomizedField>
				</xsl:if>
			</CustomizedFieldCollection>
			<OrganizationAddressCollection>
				<OrganizationAddress>
					<AddressType>ConsignorDocumentaryAddress</AddressType>
					<OrganizationCode>HILLPETHAM</OrganizationCode>
				</OrganizationAddress>
				<xsl:if test="NADLoop1/NAD[NAD01='ST' and C082/C08202='02']/C058/C05801 !=''">	
					<OrganizationAddress>
						<AddressType>ConsigneeAddress</AddressType>
						<CompanyName>
							<xsl:value-of select="NADLoop1/NAD[NAD01='ST' and C082/C08202='02']/C058/C05801"/>
						</CompanyName>
						<AddressOverride>true</AddressOverride>
					</OrganizationAddress>
				</xsl:if>
				<xsl:if test="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/C059/C05901 !=''">	
					<OrganizationAddress>
						<AddressType>ConsigneeAddress</AddressType>
						<Address1>
							<xsl:value-of select="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/C059/C05901"/>
						</Address1>
						<AddressOverride>true</AddressOverride>
					</OrganizationAddress>
				</xsl:if>
				<xsl:if test="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/C059/NAD06 !=''">	
					<OrganizationAddress>
						<AddressType>ConsigneeAddress</AddressType>
						<City>
							<xsl:value-of select="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/C059/NAD06"/>
						</City>
						<AddressOverride>true</AddressOverride>
					</OrganizationAddress>
				</xsl:if>
				<xsl:if test="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/NAD08 !=''">	
					<OrganizationAddress>
						<AddressType>ConsigneeAddress</AddressType>
						<Postcode>
							<xsl:value-of select="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/NAD08"/>
						</Postcode>
						<AddressOverride>true</AddressOverride>
					</OrganizationAddress>
				</xsl:if>
				<xsl:if test="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/NAD09 !=''">	
					<OrganizationAddress>
						<AddressType>ConsigneeAddress</AddressType>
						<Country>
							<Code>
								<xsl:value-of select="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/NAD09"/>
							</Code>
						</Country>
						<AddressOverride>true</AddressOverride>
					</OrganizationAddress>
				</xsl:if>
				<xsl:if test="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/NAD07 !=''">	
					<OrganizationAddress>
						<AddressType>ConsigneeAddress</AddressType>
						<State>
							<xsl:value-of select="NADLoop1/NAD[NAD01='ST' and C082/C08202='04']/NAD07"/>
						</State>
						<AddressOverride>true</AddressOverride>
					</OrganizationAddress>
				</xsl:if>
			</OrganizationAddressCollection>
				
      </Shipment>
    </UniversalShipment>
  </xsl:template>

  <msxsl:script language="C#" implements-prefix="userCSharp">
	<![CDATA[	
		
	public static string GetWhsCode(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> WhsCode=new System.Collections.Generic.Dictionary<string,string>();
            
			WhsCode.Add("NZ19","PHR");
            
            if (WhsCode.ContainsKey(inputDataString))
                outDataString = WhsCode[inputDataString];
            return outDataString;
        }
		
	public static string GetUoM(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> UoM=new System.Collections.Generic.Dictionary<string,string>();
            
			UoM.Add("GRM","G");UoM.Add("KGM","KG");
			UoM.Add("LBR","LB");UoM.Add("MGM","MG");
			UoM.Add("TNE","T");UoM.Add("BG","BAG");
			UoM.Add("BB","BBG");UoM.Add("BA","BLC");
			UoM.Add("BO","BOT");UoM.Add("CS","CAS");
			UoM.Add("CX","COI");UoM.Add("BX","CRT");
			UoM.Add("CT","CTN");UoM.Add("DZN","DN");
			UoM.Add("DR","DRM");UoM.Add("GRO","GRS");
			UoM.Add("PAL","PLT");UoM.Add("RO","RLL");
			UoM.Add("TB","TUB");UoM.Add("UN","UNT");           
			
            if (UoM.ContainsKey(inputDataString))
                outDataString = UoM[inputDataString];
            return outDataString;
        }
	
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
        
	]]>
  </msxsl:script>
</xsl:stylesheet>