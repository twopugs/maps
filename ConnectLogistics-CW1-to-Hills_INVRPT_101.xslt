<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  
  <xsl:template match="/">
    <xsl:apply-templates select="/root" />
  </xsl:template>
  <xsl:template match="/root">
	
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
				<C00201>351</C00201>
			</C002>
		    <BGM02>
				<xsl:value-of select="OrderNumber/text()" />
			</BGM02>
			<BGM03>GR</BGM03>
		</BGM>
		<DTM>
			<C507>
				<C50701>137</C50701>
				<C50702>
					<xsl:value-of select="CurrentDateTime/text()" />
				</C50702>
				<C50703>203</C50703>
			</C507>
		</DTM>
		<DTM>
			<C507>
				<C50701>350</C50701>
				<C50702>
					<xsl:value-of select="CurrentDateTime/text()" />
				</C50702>
				<C50703>203</C50703>
			</C507>
		</DTM>
		<RFFLoop1>
			<RFF>
				<C506>
					<C50601>ZZZ</C50601>
					<C50602>101</C50602>
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
		<xsl:for-each select="OrderLine">
			<LINLoop1>
				<LIN>
					<LIN01>
						<xsl:value-of select="CustomizedFieldCollection/CustomizedField[Key='Line Number']/Value/text()" />
					</LIN01>
					<LIN02>ZA</LIN02>
					<C212>
						<C21201>
							<xsl:value-of select="Product/Code/text()" />
						</C21201>
					</C212>
					<LIN04>ZA</LIN04>
				</LIN>
				
				
					<xsl:variable name="QTYLOOPFLAG">
						<xsl:choose>
							<xsl:when test="OrderedQty = '0.00000000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>
							<xsl:when test="OrderedQty = '0.0000000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>	
							<xsl:when test="OrderedQty = '0.000000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>		
							<xsl:when test="OrderedQty = '0.00000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>		
							<xsl:when test="OrderedQty = '0.0000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>		
							<xsl:when test="OrderedQty = '0.000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>			
							<xsl:when test="OrderedQty = '0.00'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>			
							<xsl:when test="OrderedQty = '0.0'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>				
							<xsl:when test="OrderedQty = '0'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>			
							<xsl:when test="OrderedQty = '000000000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>				
							<xsl:when test="OrderedQty = '00000000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>			
							<xsl:when test="OrderedQty = '0000000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>	
							<xsl:when test="OrderedQty = '000000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>		
							<xsl:when test="OrderedQty = '00000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>			
							<xsl:when test="OrderedQty = '0000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>	
							<xsl:when test="OrderedQty = '000'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>				
							<xsl:when test="OrderedQty = '00'">
								<xsl:value-of select="string('No')"/>
							</xsl:when>							
							<xsl:otherwise>	
								<xsl:value-of select="string('Yes')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
				<xsl:if test="$QTYLOOPFLAG = 'Yes'">
					<QTYLoop2>
						<QTY_2>
							<C186_2>
								<C18601>1</C18601>
								<C18602>
									<xsl:value-of select="OrderedQty" />
								</C18602>
								<C18603>
									<xsl:value-of select="PackageQtyUnit/Code/text()" />
								</C18603>
							</C186_2>
						</QTY_2>
						<LOC_3>
							<LOC01>14</LOC01>
							<C517_3>
								<C51701>14</C51701>
							</C517_3>
							<C519_3>
								<C51903>9</C51903>
								<C51904>SHRT</C51904>
							</C519_3>
							<C553_3>
								<C55303>9</C55303>
								<C55304>SHRT</C55304>
							</C553_3>
						</LOC_3>
					</QTYLoop2>
				</xsl:if>
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