<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  
  <xsl:template match="/">
    <xsl:apply-templates select="/UniversalShipment" />
  </xsl:template>
  <xsl:template match="/UniversalShipment">
	
    <ns0:EFACT_D93A_DESADV>
		<UNH>
			<UNH1>1</UNH1>
			<UNH2>
					<UNH2.1>DESADV</UNH2.1>
					<UNH2.2>D</UNH2.2>
					<UNH2.3>93A</UNH2.3>
					<UNH2.4>UN</UNH2.4>
					<UNH2.5>EAN003</UNH2.5>
				</UNH2>
		</UNH>
		<BGM>
			<C002>
				<C00201>15</C00201>
			</C002>
				<xsl:for-each select="Shipment/CustomizedFieldCollection/CustomizedField">
					<xsl:choose>
						<xsl:when test="Key = 'Despatch Advice Number'"> 
							<BGM02>
								<xsl:value-of select="Value/text()" />
							</BGM02>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			<BGM03>4</BGM03>
		</BGM>
		<DTM>
			<C507>
				<C50701>137</C50701>
				<C50702>
					<xsl:value-of select="Shipment/CurrentDateTime/text()" />
				</C50702>
				<C50703>102</C50703>
			</C507>
		</DTM>
		<xsl:for-each select="Shipment/MilestoneCollection/Milestone">
			<xsl:choose>
				<xsl:when test="Description = 'Delivered'"> 
					<DTM>
						<C507>
							<C50701>11</C50701>
							<C50702>
								<xsl:value-of select="ActualDate" />
							</C50702>
							<C50703>102</C50703>
						</C507>
					</DTM>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		
		<NADLoop1>
			<NAD>
				<NAD01>SA</NAD01>
				<C082>
					<C08201>Monteagle Logistics</C08201>
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
		
		
		<CPSLoop1>
			<CPS>
				<CPS01>1</CPS01>
			</CPS>
			
			
			<xsl:for-each select="Shipment/Order/OrderLineCollection/OrderLine">
				<xsl:choose>
					<xsl:when test="CustomizedFieldCollection/CustomizedField[Key = 'Line Number']/Value != ''"> 
						<LINLoop1>
							<LIN>
								<LIN01>
									<xsl:value-of select="Value/text()" />
								</LIN01>
								<C212>
									<C21201>
										<xsl:value-of select="Product/Code/text()" />
									</C21201>
								</C212>
								<LIN04>ZA</LIN04>
							</LIN>
							<QTY_2>
								<C186_2>
									<C18601>12</C18601>
									<C18602>
										<xsl:value-of select="QuantityMet/text()" />
									</C18602>
								</C186_2>
							</QTY_2>
							<QTY_2>
								<C186_2>
									<C18601>12</C18601>
									<C18602>
										<xsl:value-of select="PackageQtyUnit/Code/text()" />
									</C18602>
								</C186_2>
							</QTY_2>
							<PCILoop2>
								<PCI_2>
									<PCI01>10</PCI01>
								</PCI_2>
								<GINLoop2>
									<GIN_3>
										<GIN01>BX</GIN01>
										<C208_11>
											<C20801>ZA</C20801>
										</C208_11>
									</GIN_3>
								</GINLoop2>
							</PCILoop2>
							
						</LINLoop1>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</CPSLoop1>
		
		
    </ns0:EFACT_D93A_DESADV>
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