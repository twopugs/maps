<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/EFACT_D93A_PRICAT_EAN005" />
  </xsl:template>
  <xsl:template match="/EFACT_D93A_PRICAT_EAN005">
	
    
		<Native>
			<Body>
				<Product>
					<OrgSupplierPart>
						<StmNoteCollection>
							<StmNote>
								<NoteText>
									<xsl:value-of select="RFFLoop1/RFF/C506[C50601='MM']/C50602"/>
								</NoteText>
								<Description>BLOCK STATUS</Description>
								<IsCustomDescription>true</IsCustomDescription>
							</StmNote>
						</StmNoteCollection>
						<OrgSupplierPartBarcodeCollection>
							<xsl:for-each select="PGILoop1/PITLoop1">
								<xsl:if test="PIA !=''">	
									<OrgSupplierPartBarcode>
										<Barcode>
											<xsl:value-of select="PIA/PIA01"/>
										</Barcode>
										<PackType>
										<xsl:if test="concat(IMD[IMD02='CAS']/C273/C27301,IMD[IMD02='CAS']/C273/C27302,IMD[IMD02='CAS']/C273/C27303,IMD[IMD02='CAS']/C273/C27304) !=''">	
											<Code>
												<xsl:value-of select="concat(IMD[IMD02='CAS']/C273/C27301, ' ',IMD[IMD02='CAS']/C273/C27302, ' ',IMD[IMD02='CAS']/C273/C27303, ' ',IMD[IMD02='CAS']/C273/C27304)"/>
											</Code>
										</xsl:if>
										</PackType>
									</OrgSupplierPartBarcode>
								</xsl:if>
							</xsl:for-each>
						</OrgSupplierPartBarcodeCollection>
						<PartNum>
							<xsl:value-of select="PGILoop1/PITLoop1/PIA/C212_3/C21201"/>
						</PartNum>
						<StockKeepingUnit>
							<xsl:value-of select="concat(PGILoop1/PITLoop1/IMD[IMD02='CAS']/C273/C27301, ' ',PGILoop1/PITLoop1/IMD[IMD02='CAS']/C273/C27302, ' ',PGILoop1/PITLoop1/IMD[IMD02='CAS']/C273/C27303, ' ',PGILoop1/PITLoop1/IMD[IMD02='CAS']/C273/C27304)"/>
						</StockKeepingUnit>
						<OrgPartRelationCollection>
							<OrgPartRelation>
								<xsl:if test="PGILoop1/PITLoop1/IMD/C273/C27301 ='FERT'">	
									<UsePartAttrib1>true</UsePartAttrib1>
									<UseExpiryDate>true</UseExpiryDate>
								</xsl:if>
							</OrgPartRelation>
							<xsl:if test="PGILoop1/PITLoop1/PACLoop2/PAC_2/C402_2[C40201='LYC']/C40202 !=''">
								<Ti>
									<xsl:value-of select="PGILoop1/PITLoop1/PACLoop2/PAC_2/C402_2[C40201='LYC']/C40202"/>
								</Ti>
							</xsl:if>
							<xsl:if test="PGILoop1/PITLoop1/PACLoop2/MEA_3[MEA01='PD' and C502_3/C50201='LAY']/C174_3/C17401 !=''">
								<Hi>
									<xsl:value-of select="PGILoop1/PITLoop1/PACLoop2/MEA_3[MEA01='PD' and C502_3/C50201='LAY']/C174_3/C17401"/>
								</Hi>
								<OrgHeader>
									<Code>HILPETHAM</Code>
								</OrgHeader>
							</xsl:if>
						</OrgPartRelationCollection>
						<Desc>
							<xsl:value-of select="concat(PGILoop1/PITLoop1/IMD[IMD02='CAS']/C273/C27301, ' ',PGILoop1/PITLoop1/IMD[IMD02='CAS']/C273/C27302, ' ',PGILoop1/PITLoop1/IMD[IMD02='CAS']/C273/C27303, ' ',PGILoop1/PITLoop1/IMD[IMD02='CAS']/C273/C27304)"/>
						</Desc>
						<NetWeight>
							<xsl:value-of select="PGILoop1/PITLoop1/MEA_2[C502_2/C50201='AAF']/C502_2/C17402"/>
						</NetWeight>
						<WeightUQ>
							<xsl:value-of select="PGILoop1/PITLoop1/MEA_2[C502_2/C50201='AAB']/C174_2/C17401"/>
						</WeightUQ>
						<Weight>
							<xsl:value-of select="PGILoop1/PITLoop1/MEA_2[C502_2/C50201='AAB']/C174_2/C17402"/>
						</Weight>
						<MeasureUQ>
							<xsl:value-of select="PGILoop1/PITLoop1/MEA_2[C502_2/C50201='HT']/C174_2/C17401"/>
						</MeasureUQ>
						<Height>
							<xsl:value-of select="PGILoop1/PITLoop1/MEA_2[C502_2/C50201='HT']/C174_2/C17402"/>
						</Height>
						<MeasureUQ>
							<xsl:value-of select="PGILoop1/PITLoop1/MEA_2[C502_2/C50201='LN']/C174_2/C17401"/>
						</MeasureUQ>
						<Depth>
							<xsl:value-of select="PGILoop1/PITLoop1/MEA_2[C502_2/C50201='LN']/C174_2/C17402"/>
						</Depth>
						<MeasureUQ>
							<xsl:value-of select="PGILoop1/PITLoop1/MEA_2[C502_2/C50201='WD']/C174_2/C17401"/>
						</MeasureUQ>
						<Width>
							<xsl:value-of select="PGILoop1/PITLoop1/MEA_2[C502_2/C50201='WD']/C174_2/C17402"/>
						</Width>
						<IsBarcoded>true</IsBarcoded>
					</OrgSupplierPart>
				</Product>
			</Body>
		</Native>
	
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