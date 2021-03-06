<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:s0="http://BizTalk_Server_Project2.Accounts_Payable_Invoice_mod1_FF" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<!-- <xsl:key use="InvoiceNumber" match="InvoiceDetail" name="groups"/> -->
	<xsl:template match="/">
		<xsl:apply-templates select="/Invoice" />
	</xsl:template>
	<xsl:template match="/Invoice">
		<UniversalTransactions xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11">
			<xsl:for-each select ="body">
				<xsl:variable name ="var:LocalTotal" select="normalize-space(sum(itemList/items/total/text()))" />
				<xsl:if test="$var:LocalTotal!=0">
					<UniversalTransaction>
						<xsl:variable name ="var:externalId" select="client/properties/clientidentification.client_code/text()" />
						<xsl:variable name="var:taxConfig">
							<xsl:choose>
								<xsl:when test="client/taxConfig/label/text() = '&quot;Aucune taxe&quot;'">
									<xsl:value-of select="&quot;FREEGST&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;E - Exempt de taxes&quot;'">
									<xsl:value-of select="&quot;EXEMPT&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;FP - TPS @ 5%; TVQ @ 9,975%&quot;'">
									<xsl:value-of select="&quot;GSTANDQST&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;NB - TVH @ 15%&quot;'">
									<xsl:value-of select="&quot;HST15&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;O - TVHO @ 13%&quot;'">
									<xsl:value-of select="&quot;HST13&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;NE - TVH @ 15%&quot;'">
									<xsl:value-of select="&quot;HST15&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;PE - TVH @ 14%&quot;'">
									<xsl:value-of select="&quot;HST14&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;NS - TVH @ 15%&quot;'">
									<xsl:value-of select="&quot;HST15&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;BC - TPS @ 5%&quot;'">
									<xsl:value-of select="&quot;GST&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;F - TPS @ 5%&quot;'">
									<xsl:value-of select="&quot;GST&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;AB - TPS @ 5%&quot;'">
									<xsl:value-of select="&quot;GST&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;MB - TPS @ 5%&quot;'">
									<xsl:value-of select="&quot;GST&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;NL - TVH @ 15%&quot;'">
									<xsl:value-of select="&quot;HST15&quot;" />
								</xsl:when>
								<xsl:when test="client/taxConfig/label/text() = '&quot;SK - TPS @ 5%&quot;'">
									<xsl:value-of select="&quot;GST&quot;" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="&quot;GST&quot;" />
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>  

						<TransactionInfo>
							<Number>
								<xsl:value-of select="normalize-space(id/text())"/>
							</Number>
							<OSCurrency>
								<Code>CAD</Code>
							</OSCurrency>
							<TransactionDate>
								<xsl:value-of select="userCSharp:GetDateTimeNow()"/>
							</TransactionDate>
							<PostDate>
								<xsl:value-of select="userCSharp:GetDateTimeNow()"/>
							</PostDate>
							<TransactionType>INV</TransactionType>
							<Ledger>AR</Ledger>
							<DataContext>
								<CodesMappedToTarget>true</CodesMappedToTarget>
								<DataProvider>G19TLETRN</DataProvider>
								<EnterpriseID>G19</EnterpriseID>
								<ServerID>TRN</ServerID>
								<RecipientRoleCollection>
									<RecipientRole>
										<Code>ORP</Code>
										<Description>Organization Proxy</Description>
									</RecipientRole>
								</RecipientRoleCollection>
								<DataTargetCollection>
									<DataTarget>
										<Type>AccountingInvoice</Type>
									</DataTarget>
								</DataTargetCollection>
								<Company>
									<Code>TLE</Code>
								</Company>
							</DataContext>
							<!--	<Ledger>AP</Ledger>-->
							<TransactionType>INV</TransactionType>
							<Description>
								<xsl:value-of select="concat('ProgressionLive Task ', id/text())"/>
							</Description>
							<BranchAddress>
								<AddressType>OFC</AddressType>
								<OrganizationCode>TRALEVLEV</OrganizationCode>
								<Country>
									<Code>CA</Code>
								</Country>
							</BranchAddress>
							<LocalVATAmount>
								<xsl:value-of select="normalize-space(sum(itemList/items/total/text()))"/>
							</LocalVATAmount>
							<LocalTotal>
								<xsl:value-of select="normalize-space(sum(itemList/items/total/text()))"/>
							</LocalTotal>
							<OrganizationAddress>
								<OrganizationCode>
									<xsl:value-of select="$var:externalId"/>
								</OrganizationCode>
								<AddressType>OFC</AddressType>
							</OrganizationAddress>
							<PostingJournalCollection>
								<xsl:for-each select="itemList/items">
									<PostingJournal>
										<Sequence>
											<xsl:value-of select="position()"/>
										</Sequence>
										<ChargeExchangeRate>1</ChargeExchangeRate>
										<ChargeCurrency>
											<Code>CAD</Code>
										</ChargeCurrency>
										<Description>
											<xsl:value-of select="normalize-space(label/text())"/>
										</Description>
										<LocalAmount>
											<xsl:value-of select="normalize-space(total/text())"/>
										</LocalAmount>
										<OSAmount>
											<xsl:value-of select="normalize-space(total/text())"/>
										</OSAmount>
										<Branch>
											<Code>CAD</Code>
										</Branch>
										<Department>
											<Code>TOT</Code>
										</Department>
										<Organization>
											<Key>
												<xsl:value-of select="$var:externalId"/>
											</Key>
											<Type>Organization</Type>
										</Organization>
										<xsl:if test="$var:taxConfig!=0">
											<VATTaxID>
												<TaxCode>
													<xsl:if test="taxable/text()=&quot;true&quot;">
														<xsl:value-of select="$var:taxConfig"/>
													</xsl:if>
												</TaxCode>
											</VATTaxID>
										</xsl:if>
										<ChargeCode>
											<Code>
												<!-- <xsl:value-of select="normalize-space(product/label/text())"/> -->
												<xsl:value-of select="userCSharp:ChargeCodeConvert(normalize-space(product/id/text()))"/>
											</Code>
										</ChargeCode>
									</PostingJournal>
								</xsl:for-each>
							</PostingJournalCollection>
						</TransactionInfo>
					</UniversalTransaction>
				</xsl:if>
			</xsl:for-each>
		</UniversalTransactions>
	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[
public string StringConcat(string param0)
{
   return param0;
}
 public static string ConvertDateRequiredValue(string inputDateString)
              {
                string outDateString;
                System.DateTime dt = DateTime.ParseExact(inputDateString, "yyyy-MM-dd HH:mm:ss", System.Globalization.CultureInfo.InvariantCulture);
                outDateString = dt.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  

public static string GetDateTimeNow()
              {
                string outDateString;
                outDateString = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");

                return outDateString;
              }  
			  
			  
public string ChargeCodeConvert(string code1)
{
  if(code1.Equals("49")) 
  return "TLASS";
  else if(code1.Equals("14")) 
  return "TLATT";
  else if(code1.Equals("12")) 
  return "Barils";
  else if(code1.Equals("56")) 
  return "TLBLSH";
  else if(code1.Equals("9")) 
  return "Bo??tes";
  else if(code1.Equals("10")) 
  return "Chaudi??res";
  else if(code1.Equals("68")) 
  return "TLCOES";
  else if(code1.Equals("69")) 
  return "TLCOFSC";
  else if(code1.Equals("70")) 
  return "TLCOIN";
  else if(code1.Equals("71")) 
  return "TLCOLI";
  else if(code1.Equals("72")) 
  return "TLCOMD";
  else if(code1.Equals("73")) 
  return "TLCOOP";
  else if(code1.Equals("74")) 
  return "TLCOOUT";
  else if(code1.Equals("81")) 
  return "TLCOPC";
  else if(code1.Equals("75")) 
  return "TLCOPP";
  else if(code1.Equals("77")) 
  return "TLCOSKI";
  else if(code1.Equals("78")) 
  return "TLCOTRA";
  else if(code1.Equals("79")) 
  return "TLCOWT";
  else if(code1.Equals("80")) 
  return "TLCOWR";
  else if(code1.Equals("76")) 
  return "TLCOSDS";
  else if(code1.Equals("44")) 
  return "Cosmo Missed drop";
  else if(code1.Equals("36")) 
  return "TLDERE";
  else if(code1.Equals("63")) 
  return "TLENIN";
  else if(code1.Equals("65")) 
  return "TLENMA";
  else if(code1.Equals("62")) 
  return "TLENME";
  else if(code1.Equals("64")) 
  return "TLENOUT";
  else if(code1.Equals("66")) 
  return "TLENPAL";
  else if(code1.Equals("67")) 
  return "TLENPALE";
  else if(code1.Equals("26")) 
  return "Cosmo Empty skid";
  else if(code1.Equals("45")) 
  return "Entreposage /Storage";
    
  else if(code1.Equals("16")) 
  return "Enveloppes";
  else if(code1.Equals("30")) 
  return "Cosmo FSC";
  else if(code1.Equals("55")) 
  return "TLGECO";
  else if(code1.Equals("31")) 
  return "Cosmo In";
  else if(code1.Equals("28")) 
  return "Cosmo Live Inventory (Web Base)";
  else if(code1.Equals("39")) 
  return "TLLISU";
  else if(code1.Equals("3")) 
  return "TLMANU";
  else if(code1.Equals("4")) 
  return "MD - 500";
  else if(code1.Equals("5")) 
  return "MD + 500 kg";
  else if(code1.Equals("13")) 
  return "TLMADAP";
  else if(code1.Equals("11")) 
  return "TLMADAM";
  else if(code1.Equals("33")) 
  return "TLMAAD";
  else if(code1.Equals("61")) 
  return "Mensuel/Monthly Entreposage/Storage";
  else if(code1.Equals("35")) 
  return "TLMIDR";
  else if(code1.Equals("34")) 
  return "TLMIPUP";
  else if(code1.Equals("17")) 
  return "Mobilier";
  else if(code1.Equals("23")) 
  return "Cosmo Order processing";
  else if(code1.Equals("22")) 
  return "Cosmo Out";
  else if(code1.Equals("1")) 
  return "Palette";
  else if(code1.Equals("40")) 
  return "TLPAVI";
  else if(code1.Equals("53")) 
  return "TLPECA";
  else if(code1.Equals("25")) 
  return "Cosmo Pick & Pak";
  else if(code1.Equals("21")) 
  return "PC";
  else if(code1.Equals("58")) 
  return "TLPUSAD";
  else if(code1.Equals("60")) 
  return "TLPUSAE";
  else if(code1.Equals("57")) 
  return "TLPUSAL";
  else if(code1.Equals("59")) 
  return "TLPUSASF";
  else if(code1.Equals("47")) 
  return "Ramassage Suppl??mentaire";
  else if(code1.Equals("52")) 
  return "TLRASU";
  else if(code1.Equals("19")) 
  return "TLREVO";
  else if(code1.Equals("6")) 
  return "TLTRA";
  else if(code1.Equals("32")) 
  return "Cosmo Transport";
  else if(code1.Equals("41")) 
  return "TRTRSE";
  else if(code1.Equals("43")) 
  return "Travail ?? l'heure/Montr??al";
  else if(code1.Equals("42")) 
  return "Travail ?? l'heure/Qu??bec";
  else if(code1.Equals("15")) 
  return "T??tes";
  else if(code1.Equals("50")) 
  return "Cosmo Waiting Time";
  else if(code1.Equals("24")) 
  return "Cosmo Wrapping";
  else if(code1.Equals("48")) 
  return "Wrong adress";
  else if(code1.Equals("20")) 
  return "TLZCVQ";
  else if(code1.Equals("46")) 
  return "TLZCVM";
  else if(code1.Equals("37")) 
  return "TLZORE";
  else if(code1.Equals("27")) 
  return "Cosmo same day surcharge";
  else if(code1.Equals("38")) 
  return "TLSERU";
  else if(code1.Equals("2")) 
  return "TAIL";
  else if(code1.Equals("29")) 
  return "Cosmo Skid";
  else if(code1.Equals("18")) 
  return "TLSUR";
  else if(code1.Equals("54")) 
  return "TLTARA";
  else if(code1.Equals("8")) 
  return "TLTALI";
  
  
  else
  return "XXX";
}			  

]]>
	</msxsl:script>
</xsl:stylesheet>