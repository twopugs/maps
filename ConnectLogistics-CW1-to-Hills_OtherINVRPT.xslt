<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  
  <xsl:template match="/">
    <xsl:apply-templates select="/Detail" />
  </xsl:template>
  <xsl:template match="/Detail">
	
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
				<C50701>137</C50701>
				<C50702>
					<xsl:value-of select="CurrentDateTime/text()" />
				</C50702>
				<C50703>102</C50703>
			</C507>
		</DTM>
		<DTM>
			<C507>
				<C50701>350</C50701>
				<C50702>
					<xsl:value-of select="CurrentDateTime/text()" />
				</C50702>
				<C50703>350</C50703>
			</C507>
		</DTM>
		<RFFLoop1>
			<RFF>
				<C506>
					<C50601>ZZZ</C50601>
					<C50602>
						<xsl:value-of select="Movement_Type/text()" />
					</C50602>
					<C50603>
						<xsl:value-of select="Transaction_Code/text()" />
					</C50603>
				</C506>
			</RFF>
		</RFFLoop1>
		<NADLoop1>
			<NAD>
				<NAD01>WH</NAD01>
				<C082>
					<C08201>MLLPROD</C08201>
					<C08202>14</C08202>
					<C08203>9</C08203>
				</C082>
			</NAD>
		</NADLoop1>
		<NADLoop1>
			<NAD>
				<NAD01>SU</NAD01>
				<C082>
					<C08201>HILLSPET</C08201>
					<C08202>ZZ</C08202>
					<C08203>9</C08203>
				</C082>
			</NAD>
		</NADLoop1>
		
		<LINLoop1>
			<LIN>
				<LIN01>1</LIN01>
				<LIN02>
					<xsl:value-of select="Batch/text()" />
				</LIN02>
				<C212>
					<C21201>
						<xsl:value-of select="Product/text()" />
					</C21201>
				</C212>
				<LIN04>ZA</LIN04>
				<LIN05>
					<xsl:value-of select="Reason_Code/text()" />
				</LIN05>
			</LIN>
			<QTYLoop2>
				<QTY_2>
					<C186_2>
						<C18601>1</C18601>
						<C18602>
								<xsl:value-of select="Quantity/text()" />
						</C18602>
						<C18603>
								<xsl:value-of select="UQ/text()" />
						</C18603>
					</C186_2>
				</QTY_2>
				
				<xsl:variable name="LOC02">
					<xsl:choose>
						<xsl:when test="Warehouse != ''">
							<xsl:value-of select="substring(Warehouse/text(),3,10)" />
						</xsl:when>				
						<xsl:otherwise>	
							<xsl:value-of select="string('')" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>	
				<xsl:variable name="LOC03">
					<xsl:choose>
						<xsl:when test="substring-before(Location,'+') != ''">
							<xsl:value-of select="substring(substring-before(Location,'+'),3,10)" />
						</xsl:when>				
						<xsl:otherwise>	
							<xsl:value-of select="string('')" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>	
				<xsl:variable name="LOC04">
					<xsl:choose>
						<xsl:when test="substring-after(Location,'+') != ''">
							<xsl:value-of select="substring(substring-after(Location,'+'),3,10)" />
						</xsl:when>				
						<xsl:otherwise>	
							<xsl:value-of select="string('')" />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>	
			
				<LOC_3>
					<LOC01>14</LOC01>
					<C517_3>
						<C51703>
							<xsl:value-of select="substring-before($LOC02,':')" />
						</C51703>
						<C51704>
							<xsl:value-of select="substring-after($LOC02,':')" />
						</C51704>
					</C517_3>
					<C519_3>
						<C51903>
							<xsl:value-of select="substring-before($LOC03,':')" />
						</C51903>
						<C51904>
							<xsl:value-of select="substring-after($LOC03,':')" />
						</C51904>
					</C519_3>
					<C553_3>
						<C55303>
							<xsl:value-of select="substring-before($LOC04,':')" />
						</C55303>
						<C55304>
							<xsl:value-of select="substring-after($LOC04,':')" />
						</C55304>
					</C553_3>
				</LOC_3>
			</QTYLoop2>
				
			
			
		</LINLoop1>
		
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