<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  
  <xsl:template match="/">
    <xsl:apply-templates select="/Root" />
  </xsl:template>
  <xsl:template match="/Root">
	
    <ns0:EFACT_D93A_INVRPT>
		<UNH>
			<UNH1>1</UNH1>
			<UNH2>
					<UNH2.1>INVRPT</UNH2.1>
					<UNH2.2>D</UNH2.2>
					<UNH2.3>93A</UNH2.3>
					<UNH2.4>UN</UNH2.4>
					<UNH2.5>EAN003</UNH2.5>
				</UNH2>
		</UNH>
		<BGM>
			<C002>
				<C00201>78</C00201>
			</C002>
		</BGM>
		<DTM>
			<C507>
				<C50701>202</C50701>
				<C50702>
					<xsl:value-of select="CurrentDateTime/text()" />
				</C50702>
				<C50703>203</C50703>
			</C507>
		</DTM>
		<NADLoop1>
			<NAD>
				<NAD01>WH</NAD01>
				<C082>
					<C08201>MLLPROD</C08201>
					<C08203>9</C08203>
				</C082>
			</NAD>
		</NADLoop1>
		<NADLoop1>
			<NAD>
				<NAD01>SU</NAD01>
				<C082>
					<C08201>HILLSPET</C08201>
					<C08203>9</C08203>
				</C082>
			</NAD>
		</NADLoop1>
		<xsl:for-each select="Detail">
			<LINLoop1>
				<LIN>
					<LIN01>
						<xsl:value-of select="position()" />
					</LIN01>
					<C212>
						<C21201>
							<xsl:value-of select="Product/text()" />
						</C21201>
						<C21204>SA</C21204>
					</C212>
				</LIN>
				<QTYLoop2>
					<QTY_2>
						<C186_2>
							<C18601>
								<xsl:value-of select="Hold_Code/text()" />
							</C18601>
							<C18602>
								<xsl:value-of select="string(number(translate(Total_Units/text(),',','')))" />
							</C18602>
							
							<!-- <xsl:choose> -->
								<!-- <xsl:when test="substring-before(Total_Units,'.') != ''"> -->
									<!-- <C18602> -->
										<!-- <xsl:value-of select="translate(Total_Units/text(),',','')" /> -->
									<!-- </C18602> -->
								<!-- </xsl:when>				 -->
								<!-- <xsl:otherwise>	 -->
									<!-- <C18602> -->
										<!-- <xsl:value-of select="translate(Total_Units/text(),',','')" /> -->
									<!-- </C18602> -->
								<!-- </xsl:otherwise> -->
							<!-- </xsl:choose> -->
							<C18603>
								<xsl:value-of select="UQ/text()" />
							</C18603>
						</C186_2>
					</QTY_2>
					<LOC_3>
						<LOC01>14</LOC01>
						<C517_3>
							<C51703>9</C51703>
							<C51704>ZAH1</C51704>
						</C517_3>
					</LOC_3>
					<LOC_3>
						<LOC01>14</LOC01>
						
						<xsl:variable name="LOC0304">
							<xsl:choose>
								<xsl:when test="Location != ''">
									<xsl:value-of select="substring(Location/text(),3,10)" />
								</xsl:when>				
								<xsl:otherwise>	
									<xsl:value-of select="string('')" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<C517_3>
							<C51703>
								<xsl:value-of select="substring-before($LOC0304,':')" />
							</C51703>
							<C51704>
								<xsl:value-of select="substring-after($LOC0304,':')" />
							</C51704>
						</C517_3>
					</LOC_3>
				</QTYLoop2>
				
			</LINLoop1>
		</xsl:for-each>
		
    </ns0:EFACT_D93A_INVRPT>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
	<![CDATA[		
		
	public static string FormatDate(string inputDataString)
        {
            string outDataString=string.Empty;
			
			DateTime date = DateTime.Parse(inputDataString);
			outDataString = date.ToString("yyyyMMdd");
			return outDataString;
        }
		
	public static string GetWhsCode(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> WhsCode=new System.Collections.Generic.Dictionary<string,string>();
            
			WhsCode.Add("PHR","NZ01");WhsCode.Add("PHR","NZ10");
			WhsCode.Add("PHR","NZ11");WhsCode.Add("PHR","NZ12");
			WhsCode.Add("PHR","NZ13");WhsCode.Add("PHR","NZ14");
			WhsCode.Add("PHR","NZ15");WhsCode.Add("PHR","NZ16");
			WhsCode.Add("PHR","NZ17");WhsCode.Add("PHR","NZ18");
			WhsCode.Add("PHR","NZ19");WhsCode.Add("PHR","NZ20");
			WhsCode.Add("PHR","NZ21");WhsCode.Add("PHR","NZ22");
			WhsCode.Add("PHR","NZ23");WhsCode.Add("PHR","NZ24");
			WhsCode.Add("PHR","NZ25");WhsCode.Add("PHR","NZ26");
			WhsCode.Add("PHR","NZ27");
            
            if (WhsCode.ContainsKey(inputDataString))
                outDataString = WhsCode[inputDataString];
            return outDataString;
        }
			
	
	]]>
  </msxsl:script>
</xsl:stylesheet>