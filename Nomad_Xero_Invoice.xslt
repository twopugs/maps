<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes" />
  <xsl:template match="/">
    <xsl:apply-templates select="/UniversalInterchange/Body/UniversalTransaction" />
  </xsl:template>
  <xsl:template match="/UniversalInterchange/Body/UniversalTransaction">
	<Invoices>
		<Type>ACCREC</Type>
		<Contact>
			<ContactID>REPLACE</ContactID>
		</Contact>
		<DateString>
			<xsl:value-of select="TransactionInfo/PostDate"/>
		</DateString>
		<DueDateString>
			<xsl:value-of select="TransactionInfo/DueDate"/>
		</DueDateString>
		<InvoiceNumber>
			<xsl:value-of select="TransactionInfo/Number"/>
		</InvoiceNumber>
		<CurrencyCode>
			<xsl:value-of select="TransactionInfo/OSCurrency/Code"/>
		</CurrencyCode>
		<Status>DRAFT</Status>
		<LineAmountTypes>Exclusive</LineAmountTypes>
		<xsl:for-each select="TransactionInfo/PostingJournalCollection/PostingJournal">
			<LineItems>
				<ItemCode>
					<xsl:value-of select="ChargeCode/Code"/>
				</ItemCode>
				<Description>
					<xsl:value-of select="Description"/>
				</Description>
				<Quantity>1</Quantity>
				<UnitAmount>
					<xsl:value-of select="LocalAmount"/>
				</UnitAmount>
				<xsl:choose>
					<xsl:when test="VATTaxID/TaxCode ='GST'"> 
						<TaxType>OUTPUT</TaxType>
					</xsl:when>
					<xsl:when test="VATTaxID/TaxCode ='FREEGST'"> 
						<TaxType>EXEMPTEXPORT</TaxType>
					</xsl:when>
					<xsl:otherwise>
						<!-- <TaxType> -->
							<!-- <xsl:value-of select="VATTaxID/TaxCode"/> -->
						<!-- </TaxType> -->
					</xsl:otherwise>
				</xsl:choose>
				<TaxAmount>
					<xsl:value-of select="OSGSTVATAmount"/>
				</TaxAmount>
				<LineAmount>
					<xsl:value-of select="LocalAmount"/>
				</LineAmount>
			</LineItems>
		</xsl:for-each>
		
	</Invoices>
		
	</xsl:template>
</xsl:stylesheet>