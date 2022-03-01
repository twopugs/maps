<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:s0="http://BizTalk_Server_Project2.Accounts_Payable_Invoice_mod1_FF" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/Headers" />
	</xsl:template>
	<xsl:template match="/Headers">
		<UniversalTransactions xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11">
			<UniversalTransaction>
					
				
				<TransactionInfo>
					<DataContext>
						<DataTargetCollection>
							<DataTarget>
								<Type>AccountingInvoice</Type>
							</DataTarget>
						</DataTargetCollection>
					</DataContext>
					<Description>
						<xsl:value-of select="Detail[Col1='OP']/Col10/text()"/>
					</Description>
					<Number>
						<xsl:value-of select="Detail[Col1='OP']/Col10/text()"/>
					</Number>
					<BranchAddress>
						<AddressType>OFC</AddressType>
						<Country>
							<Code>NZ</Code>
						</Country>
					</BranchAddress>
					<Ledger>AP</Ledger>
					<OrganizationAddress>
						<OrganizationCode>
							<xsl:value-of select="Detail[Col1='OP']/Col15/text()"/>
						</OrganizationCode>
						<AddressType>OFC</AddressType>
					</OrganizationAddress>
					<TransactionDate>
						<xsl:value-of select="Detail[Col1='OP']/Col12/text()"/>
					</TransactionDate>
					
						
						<xsl:variable name='Total' select="sum(Detail[Col1='KB']/Col150)"/>
						<xsl:choose>
							<xsl:when test="$Total = '0'"> 
								<OSExGSTVATAmount>INV</OSExGSTVATAmount>
							</xsl:when>
							<xsl:when test="$Total != '0'"> 
								<OSExGSTVATAmount>
									<xsl:value-of select="$Total"/>
								</OSExGSTVATAmount>
								<TransactionType>CRD</TransactionType>
							</xsl:when>
							<xsl:otherwise>
							</xsl:otherwise>
						</xsl:choose>
								
					
					
					
					
					
					<xsl:if test="Detail[Col1='OP']/Col15 != ''">
						<xsl:variable name='Key' select="Detail[Col1='OP']/Col15/text()"/>
					</xsl:if>
					<PostingJournalCollection>
						<xsl:for-each select="Detail[Col1='KB']">
							<PostingJournal>
								<TransactionType>CST</TransactionType>
								<OSAmount>
									<xsl:value-of select="Col150/text()"/>
								</OSAmount>
								<OSGSTVATAmount>
									<xsl:value-of select="Col154/text()"/>
								</OSGSTVATAmount>
								<OSCurrency>
									<Code>
										<xsl:value-of select="Col161/text()"/>
									</Code>
								</OSCurrency>
								<Organization>
									<Key>
										<xsl:value-of select="../Detail[Col1='OP']/Col15/text()"/>
									</Key>
									<Type>Organization</Type>
								</Organization>
								<ChargeCode>
									<Code>
										<xsl:value-of select="Col132/text()"/>
									</Code>
								</ChargeCode>
								<OSTotalAmount>
									<xsl:value-of select="Col150 + 	Col154"/>
								</OSTotalAmount>
							</PostingJournal>
						</xsl:for-each>
					</PostingJournalCollection>
				</TransactionInfo>
			</UniversalTransaction>
		</UniversalTransactions>
	</xsl:template>
</xsl:stylesheet>