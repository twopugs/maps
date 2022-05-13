<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/EDIFACT/2006" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
 <xsl:key use="." match="root/OrderLine/Product/Code/text()" name="ProductCode"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/root" />
  </xsl:template>
  <xsl:template match="/root">
		<Root>
			<xsl:for-each select="OrderLine/Product/Code/text()[generate-id(.)=generate-id(key('ProductCode',.)[1])]">
				<Loop>
					<xsl:variable name ="vProductCode" select="." />
					<ProductCode>
						<xsl:value-of select="$vProductCode" />
					</ProductCode>
					<SumOrderQty>
						<xsl:value-of select="sum(../../../../OrderLine[Product/Code = $vProductCode]/OrderedQty)"/>
					</SumOrderQty>
					<SumExpectedQty>
						<xsl:value-of select="sum(../../../../OrderLine[Product/Code = $vProductCode]/ExpectedQuantity)"/>
					</SumExpectedQty>
					<PurposeCode>Replace</PurposeCode>
					<LIN1>0</LIN1>
					<QTY03>
						<xsl:value-of select="../../../../OrderLine[Product/Code = $vProductCode]/PackageQtyUnit/Code" />
					</QTY03>
					<ExpiryDate>
						<xsl:value-of select="../../../../OrderLine[Product/Code = $vProductCode]/ExpiryDate" />
					</ExpiryDate>
				</Loop>
			</xsl:for-each>
		</Root>
   
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