<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:ns0="http://schemas.microsoft.com/BizTalk/EDI/X12/2006" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:variable name ="var:DocCoachAccessories" select ="document('c:\\cc\configs\tli\COACH_AccessoryMappings.xml')"/>
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalTransaction" />
  </xsl:template>
  <xsl:template match="/s0:UniversalTransaction">
    <xsl:for-each select="s0:TransactionInfo">
      <xsl:variable name="ACKey" select="s0:DataContext/s0:DataSourceCollection/s0:DataSource[s0:Type='AccountingInvoice']/s0:Key/text()"/>
      <xsl:variable name="PurposeCode" select="s0:DataContext/s0:ActionPurpose/s0:Code/text()"/>
        
	  <xsl:variable name="N902_MB">
		<xsl:choose>
			<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:AdditionalBillCollection/s0:AdditionalBill[s0:BillType/s0:Code='MWB']/s0:BillNumber/text() != ''">
				<xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:AdditionalBillCollection/s0:AdditionalBill[s0:BillType/s0:Code='MWB']/s0:BillNumber/text()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="s0:ShipmentCollection/s0:Shipment[s0:WayBillType/s0:Code='MWB']/s0:WayBillNumber/text()"/>
			</xsl:otherwise>
		</xsl:choose>
	  </xsl:variable>  
	  
	  <xsl:variable name="N902_AW">
		<xsl:choose>
			<xsl:when test="s0:ShipmentCollection/s0:Shipment[s0:WayBillType/s0:Code='HWB']/s0:WayBillNumber/text() != ''">
				<xsl:value-of select="s0:ShipmentCollection/s0:Shipment[s0:WayBillType/s0:Code='HWB']/s0:WayBillNumber/text()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment[s0:WayBillType/s0:Code='HWB']/s0:WayBillNumber/text()"/>
			</xsl:otherwise>
		</xsl:choose>
	  </xsl:variable>
	  
	  <xsl:variable name="N902_PO">
		<xsl:choose>
			<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:LocalProcessing/s0:OrderNumberCollection/s0:OrderNumber/s0:OrderReference/text() != ''">
				<xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:LocalProcessing/s0:OrderNumberCollection/s0:OrderNumber/s0:OrderReference/text()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:LocalProcessing/s0:OrderNumberCollection/s0:OrderNumber/s0:OrderReference/text()"/>
			</xsl:otherwise>
		</xsl:choose>
	  </xsl:variable>

          <ns0:X12_00401_110>
            <ST>
              <ST01>
                <xsl:value-of select="&quot;110&quot;" />
              </ST01>
              <ST02>
                <xsl:value-of select="&quot;0001&quot;" />
              </ST02>
            </ST>
            <ns0:B3>
              <B302>
                <xsl:value-of select="userCSharp:CheckStringMandatory(s0:JobInvoiceNumber/text(), 'Value Evaluated from JobInvoiceNumber mapped to B302', $ACKey)"/>
              </B302>

              <xsl:variable name="WayBillNum">
                <xsl:choose>
                  <xsl:when test="string-length(s0:ShipmentCollection/s0:Shipment[s0:WayBillType/s0:Code='HWB']/s0:WayBillNumber/text())!=0">
                    <xsl:value-of select="s0:ShipmentCollection/s0:Shipment[s0:WayBillType/s0:Code='HWB']/s0:WayBillNumber/text()"/>
                  </xsl:when>
                  <xsl:when test="string-length(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment[s0:WayBillType/s0:Code='HWB']/s0:WayBillNumber/text())!=0">
                    <xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment[s0:WayBillType/s0:Code='HWB']/s0:WayBillNumber/text()" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:if test="string-length(s0:ShipmentCollection/s0:Shipment[s0:WayBillType/s0:Code='MWB']/s0:WayBillNumber/text())!=0">
                      <xsl:value-of select="s0:ShipmentCollection/s0:Shipment[s0:WayBillType/s0:Code='MWB']/s0:WayBillNumber/text()"/>
                    </xsl:if>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <B303>
                <xsl:value-of select="userCSharp:CheckStringMandatory(userCSharp:ReplaceString($WayBillNum), 'Value Evaluated from WayBillNumber mapped to B303 from Xpath: ShipmentCollection/Shipment[WayBillType/Code=MWB or HWB]/WayBillNumber', $ACKey)"/>
              </B303>
              <B304>
                <!--<xsl:value-of select="&quot;CC&quot;" />-->
                <xsl:choose>
                  <xsl:when test="s0:InvoiceTerm/text()='PIA'">
                    <xsl:value-of select="&quot;PP&quot;" />
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="&quot;CC&quot;" />
                  </xsl:otherwise>
                </xsl:choose>
              </B304>
              <B306>
                <xsl:value-of select="userCSharp:CheckStringMandatory(userCSharp:ConvertDateValue(s0:PostDate/text()), 'Value Evaluated from PostDate mapped to B306 from Xpath: PostDate', $ACKey)"/>
              </B306>

              <B307>
                <xsl:value-of select="userCSharp:CheckStringMandatory(userCSharp:ConvertStringToDecimalWihout(s0:LocalTotal/text()), 'Value Evaluated from LocalTotal mapped to B307 from Xpath: LocalTotal', $ACKey)"/>
              </B307>
              <xsl:variable name="vB309">
                <xsl:choose>
                  <xsl:when test="string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:LocalProcessing/s0:DeliveryCartageCompleted/text())) != 0">
                    <xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:LocalProcessing/s0:DeliveryCartageCompleted/text()"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:LocalProcessing/s0:DeliveryCartageCompleted/text()"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:if test="string-length(normalize-space($vB309))>0">
                <B309>
                  <xsl:value-of select="userCSharp:ConvertDateValue(normalize-space($vB309))"/>
                </B309>
                <B310>035</B310>
              </xsl:if>
              <B311>
                <xsl:value-of select="&quot;ZBNO&quot;" />
              </B311>
              <B312>
                <xsl:value-of select="userCSharp:ReplaceString(substring(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:TransportLegCollection/s0:TransportLeg[s0:LegOrder=1]/s0:EstimatedDeparture/text()), 1, 10))" />
              </B312>
			  
              <!-- <xsl:if test="s0:ShipmentCollection/s0:Shipment/s0:ShipmentIncoTerm/s0:Code"> -->
                <!-- <B314> -->
                  <!-- <xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:ShipmentIncoTerm/s0:Code/text()" /> -->
                <!-- </B314> -->
              <!-- </xsl:if> -->
            </ns0:B3>
            <!-- <ns0:B3A> -->
              <!-- <B3A01> -->
                <!-- <xsl:value-of select="&quot;SS&quot;" /> -->
              <!-- </B3A01> -->
            <!-- </ns0:B3A> -->
            <ns0:C3>
				<xsl:choose>
					<xsl:when test="s0:OSCurrency/s0:Code/text()='USD'">
						<C301>USD</C301>
					</xsl:when>	
					<xsl:when test="s0:OSCurrency/s0:Code/text()='EUR'">
						<C301>EUR</C301>
					</xsl:when>	
					<xsl:when test="s0:OSCurrency/s0:Code/text()='CAD'">
						<C301>CAD</C301>
					</xsl:when>	
					<xsl:otherwise>
						<C301/>
					</xsl:otherwise>
				</xsl:choose>
            </ns0:C3>


			
             
			

			  

			 

			              
			  
            <ns0:LXLoop1>
              <ns0:LX>
                <LX01>
                  <xsl:value-of select="position()"/>
                </LX01>
              </ns0:LX>
		  			  
			  <!-- N1_BT -->
			  <xsl:choose>
			  <xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendersLocalClient'] != ''">
              <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendersLocalClient']">
              <ns0:N1Loop2>  
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;BT&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SendersLocalClient]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SendersLocalClient]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SendersLocalClient]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				
				<ns0:N9_2>
                <N901>MB</N901>
                <N902>
					<xsl:value-of select="$N902_MB" />
				</N902>
				</ns0:N9_2>

				<ns0:N9_2>
                <N901>AW</N901>
                <N902>
					<xsl:value-of select="$N902_AW" />
                </N902>
				</ns0:N9_2>

				<ns0:N9_2>
                <N901>CR</N901>
                <N902>
					<xsl:value-of select="$N902_PO" />
                </N902>
				
				<!-- <ns0:C040> -->
					<!-- <C04002>1</C04002> -->
				<!-- </ns0:C040> -->
				</ns0:N9_2>
				
			  </ns0:N1Loop2>	
              </xsl:for-each>  
			  </xsl:when>			
			  
			  <xsl:otherwise>
			  <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SendersLocalClient']">
              <ns0:N1Loop2>  
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;BT&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SendersLocalClient]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SendersLocalClient]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SendersLocalClient]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				
				<ns0:N9_2>
                <N901>MB</N901>
                <N902>
					<xsl:value-of select="$N902_MB" />
				</N902>
				</ns0:N9_2>

				<ns0:N9_2>
                <N901>AW</N901>
                <N902>
					<xsl:value-of select="$N902_AW" />
                </N902>
				</ns0:N9_2>

				<ns0:N9_2>
                <N901>CR</N901>
                <N902>
					<xsl:value-of select="$N902_PO" />
                </N902>
				<!-- <ns0:C040> -->
					<!-- <C04002>1</C04002> -->
				<!-- </ns0:C040> -->
				</ns0:N9_2>
				
			  </ns0:N1Loop2>	
              </xsl:for-each>	
			  </xsl:otherwise>
			  </xsl:choose>
		  
		  			<!-- N1_SH -->
			<xsl:choose>
			<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress'] != ''">
              <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']">
			   <ns0:N1Loop2>	
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;SH&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsignorDocumentaryAddress]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsignorDocumentaryAddress]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsignorDocumentaryAddress]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				</ns0:N1Loop2>
              </xsl:for-each>
			  </xsl:when>
			  
			<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SupplierDocumentaryAddress'] != ''">
              <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SupplierDocumentaryAddress']">
			   <ns0:N1Loop2>	
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;SH&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SupplierDocumentaryAddress]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SupplierDocumentaryAddress]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsignorDocumentaryAddress]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				</ns0:N1Loop2>
              </xsl:for-each>
			  </xsl:when>	
			  
			<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress'] != ''">
              <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsignorDocumentaryAddress']">
			   <ns0:N1Loop2>	
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;SH&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsignorDocumentaryAddress]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsignorDocumentaryAddress]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsignorDocumentaryAddress]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				</ns0:N1Loop2>
              </xsl:for-each>
			  </xsl:when>			
			  
			  <xsl:otherwise>
              <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='SupplierDocumentaryAddress']">
			   <ns0:N1Loop2>	
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;SH&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SupplierDocumentaryAddress]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SupplierDocumentaryAddress]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=SupplierDocumentaryAddress]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				</ns0:N1Loop2>
              </xsl:for-each>
			  </xsl:otherwise>
			  </xsl:choose>
			  
			  
			<!-- N1_CN -->
			<xsl:choose>
			<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress'] != ''">
              <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']">
			   <ns0:N1Loop2>	
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;CN&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsigneeDocumentaryAddress]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsigneeDocumentaryAddress]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsigneeDocumentaryAddress]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				</ns0:N1Loop2>
              </xsl:for-each>
			  </xsl:when>
			  
			<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ImporterDocumentaryAddress'] != ''">
              <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ImporterDocumentaryAddress']">
			   <ns0:N1Loop2>	
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;CN&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ImporterDocumentaryAddress]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ImporterDocumentaryAddress]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ImporterDocumentaryAddress]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				</ns0:N1Loop2>
              </xsl:for-each>
			  </xsl:when>	
			  
			<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress'] != ''">
              <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ConsigneeDocumentaryAddress']">
			   <ns0:N1Loop2>	
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;CN&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsigneeDocumentaryAddress]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsigneeDocumentaryAddress]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ConsigneeDocumentaryAddress]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				</ns0:N1Loop2>
              </xsl:for-each>
			  </xsl:when>			
			  
			  <xsl:otherwise>
              <xsl:for-each select="s0:ShipmentCollection/s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ImporterDocumentaryAddress']">
			   <ns0:N1Loop2>	
				<ns0:N1_2>
                  <N101>
                    <xsl:value-of select="&quot;CN&quot;" />
                  </N101>
                  <N102>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:CompanyName/text(), 'Value Evaluated from CompanyName mapped to N102 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ImporterDocumentaryAddress]/CompanyName', $ACKey)"/>
                  </N102>
                  <N103>
                    <xsl:value-of select="&quot;25&quot;" />
                  </N103>
                  <N104>
                    <xsl:value-of select="userCSharp:CheckStringMandatory(s0:OrganizationCode/text(), 'Value Evaluated from OrganizationCode mapped to N104 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ImporterDocumentaryAddress]/OrganizationCode', $ACKey)"/>
                  </N104>
                </ns0:N1_2>
                <ns0:N3_2>
                  <xsl:if test="s0:Address1">
                    <N301>
                      <xsl:value-of select="userCSharp:GetSubString(userCSharp:CheckStringMandatory(normalize-space(s0:Address1/text()), 'Value Evaluated from Address1 mapped to N301 from Xpath: ShipmentCollection/Shipment/OrganizationAddressCollection/OrganizationAddress[AddressType=ImporterDocumentaryAddress]/Address1', $ACKey),string-length(normalize-space(s0:Address1/text())))"/>
                    </N301>
                  </xsl:if>
                  <xsl:if test="s0:Address2">
                    <N302>
                      <xsl:value-of select="normalize-space(s0:Address2/text())"/>
                    </N302>
                  </xsl:if>
                </ns0:N3_2>
                <ns0:N4_2>
                  <N401>
                    <xsl:value-of select="normalize-space(s0:City/text())"/>
                  </N401>
                  <N402>
                    <xsl:value-of select="userCSharp:GetStateCode(normalize-space(s0:State/text()))"/>
                  </N402>
                  <N403>
                    <xsl:value-of select="normalize-space(s0:Postcode/text())"/>
                  </N403>
                  <N404>
                    <xsl:value-of select="normalize-space(s0:Country/s0:Code/text())"/>
                  </N404>
                </ns0:N4_2>
				</ns0:N1Loop2>
              </xsl:for-each>
			  </xsl:otherwise>
			  </xsl:choose>
			  	  
              <ns0:R1>
                <R103>
                  <xsl:variable name="vR103">
                    <xsl:choose>
                      <xsl:when test="string-length(s0:ShipmentCollection/s0:Shipment/s0:PortOfOrigin/s0:Code/text())!=0">
                        <xsl:value-of select="substring(s0:ShipmentCollection/s0:Shipment/s0:PortOfOrigin/s0:Code/text(),3,3)" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="substring(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PortOfOrigin/s0:Code/text(),3,3)" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <xsl:value-of select="userCSharp:CheckStringMandatory($vR103, 'Value Evaluated mapped to R103 from Xpath: ShipmentCollection/Shipment/PortOfOrigin/Code', $ACKey)"/>
                </R103>
				
                <R104>
					<xsl:choose>
						<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ShippingLineAddress']/s0:RegistrationNumberCollection/s0:RegistrationNumber[s0:Type/s0:Code='CCC']/s0:Value/text() != ''">
							<xsl:value-of select="substring(s0:ShipmentCollection/s0:Shipment/s0:OrganizationAddressCollection/s0:OrganizationAddress[s0:AddressType='ShippingLineAddress']/s0:RegistrationNumberCollection/s0:RegistrationNumber[s0:Type/s0:Code='CCC']/s0:Value/text(),1, 3)" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="&quot;CCC&quot;" />
						</xsl:otherwise>
					</xsl:choose>
				</R104>
				
                <xsl:variable name ="var:SelectedAWBHeader" select="msxsl:node-set(//s0:ShipmentCollection/s0:Shipment/s0:CarrierDocumentsOverride/s0:AWBHeader)" />
                <xsl:variable name="var:Requested1stCarrier" select="$var:SelectedAWBHeader/s0:Requested1stCarrier/text()" />
                <R105>
                  <xsl:variable name="vR105">
                    <xsl:choose>
                      <xsl:when test="string-length(s0:ShipmentCollection/s0:Shipment/s0:PortOfDestination/s0:Code/text())!=0">
                        <xsl:value-of select="substring(s0:ShipmentCollection/s0:Shipment/s0:PortOfDestination/s0:Code/text(),3,3)" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="substring(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PortOfDischarge/s0:Code/text(),3,3)" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <xsl:value-of select="userCSharp:CheckStringMandatory($vR105, 'Value Evaluated mapped to R105 from Xpath: ShipmentCollection/Shipment/PortOfDischarge/Code', $ACKey)"/>
                </R105>
				
              </ns0:R1>
			  
              <xsl:choose>
                <xsl:when test="string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))!=0">
                  <ns0:POD>
                    <POD01>
                      <xsl:variable name="vPOD01">
                        <xsl:choose>
                          <xsl:when test="string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))!=0">
                            <xsl:value-of select="userCSharp:ConvertDateValue(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="userCSharp:ConvertDateValue(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:variable>
                      <xsl:value-of select="userCSharp:CheckStringMandatory($vPOD01, 'Value Evaluated mapped to POD01 from Xpath: ShipmentCollection/Shipment/MilestoneCollection/Milestone[EventCode=DCF]/ActualDate', $ACKey)"/>
                    </POD01>
					
                    <POD02>
                      <xsl:choose>
                        <xsl:when test="string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))!=0">
                          <xsl:value-of select="userCSharp:ConvertTimeValue(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="userCSharp:ConvertTimeValue(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </POD02>
					
                    <POD03>
                      <xsl:variable name="vPOD03">
                        <xsl:choose>
                          <xsl:when test="string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:Description/text()))!=0">
                            <xsl:value-of select="normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:Description/text())" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="normalize-space(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:Description/text())" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:variable>
                      <!-- <xsl:value-of select="userCSharp:CheckStringMandatory($vPOD03, 'Value Evaluated mapped to POD01 from Xpath: ShipmentCollection/Shipment/MilestoneCollection/Milestone[EventCode=DCF]/Description', $ACKey)"/> -->
                    </POD03>
					
                  </ns0:POD>
                </xsl:when>
				
                <xsl:when test="string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))!=0">
                  <ns0:POD>
                    <POD01>
                      <xsl:variable name="vPOD01">

                        <xsl:choose>
                          <xsl:when test="string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))!=0">
                            <xsl:value-of select="userCSharp:ConvertDateValue(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="userCSharp:ConvertDateValue(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:variable>
                      <xsl:value-of select="userCSharp:CheckStringMandatory($vPOD01, 'Value Evaluated mapped to POD01 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/MilestoneCollection/Milestone[EventCode=DCF]/ActualDate', $ACKey)"/>

                    </POD01>
                    <POD02>
						<xsl:choose>
                          <xsl:when test="string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))!=0">
                            <xsl:value-of select="userCSharp:ConvertTimeValue(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="userCSharp:ConvertTimeValue(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:ActualDate/text()))" />
                          </xsl:otherwise>
                        </xsl:choose>
                    </POD02>
                    <POD03>
                      <xsl:variable name="vPOD03">

                        <xsl:choose>
                          <xsl:when test="string-length(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:Description/text())!=0">
                            <xsl:value-of select="normalize-space(s0:ShipmentCollection/s0:Shipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:Description/text())" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="normalize-space(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:MilestoneCollection/s0:Milestone[s0:EventCode='DCF']/s0:Description/text())" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:variable>
                      <xsl:value-of select="userCSharp:CheckStringMandatory($vPOD03, 'Value Evaluated mapped to POD03 from Xpath: ShipmentCollection/Shipment/SubShipmentCollection/SubShipment/MilestoneCollection/Milestone[EventCode=DCF]/Description', $ACKey)"/>

                    </POD03>
                  </ns0:POD>
                </xsl:when>
              </xsl:choose>
			  
			  
              <ns0:L5Loop1>
                <ns0:L5>
                  <L501>
                    <xsl:value-of select="position()"/>
                  </L501>
				  <L502>
                    <xsl:choose>
                      <xsl:when test="string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:GoodsDescription/text()))">
                        <xsl:value-of select="userCSharp:GetSubString(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:GoodsDescription/text()),string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:GoodsDescription/text())))"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="userCSharp:GetSubString(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:GoodsDescription/text()),string-length(normalize-space(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:GoodsDescription/text())))"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </L502>
                </ns0:L5>
				
                <ns0:L0>
                  <L001>
                    <xsl:value-of select="position()"/>
                  </L001>
				  
				  <!-- <L002> -->
					<!-- <xsl:choose> -->
                      <!-- <xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeight/text()!=''"> -->
                        <!-- <xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeight/text()" /> -->
                      <!-- </xsl:when> -->
                      <!-- <xsl:otherwise> -->
                        <!-- <xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:TotalWeight/text()" /> -->
                      <!-- </xsl:otherwise> -->
                    <!-- </xsl:choose> -->
                  <!-- </L002> -->
				  
                  <!-- <L003> -->
					<!-- <xsl:choose> -->
					  <!-- <xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeightUnit/s0:Code/text()='KG'"> -->
                        <!-- <xsl:value-of select="&quot;K&quot;" /> -->
                      <!-- </xsl:when> -->
                      <!-- <xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:TotalWeightUnit/s0:Code/text()='KG'"> -->
                        <!-- <xsl:value-of select="&quot;K&quot;" /> -->
                      <!-- </xsl:when> -->
                      <!-- <xsl:otherwise> -->
                        <!-- <xsl:value-of select="&quot;L&quot;" /> -->
                      <!-- </xsl:otherwise> -->
                    <!-- </xsl:choose> -->
                  <!-- </L003> -->
				  
				  
				  <L004>
				  <xsl:choose>
					<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeight/text() != ''">
						<xsl:value-of select="userCSharp:GetRoundUp(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeight/text())"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				  </xsl:choose>
				  </L004>
				  
                  <L005>
                    <xsl:value-of select="&quot;G&quot;" />
                  </L005>
				  

				  
                  <L008>
				  <xsl:choose>
					<xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OuterPacks/text() != ''">
						<xsl:value-of select="sum(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:OuterPacks/text())"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="sum(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:PackQty/text())"/>
					</xsl:otherwise>
				  </xsl:choose>
                  </L008>
				  
                  <L009>
                    <xsl:value-of select="&quot;PCS&quot;" />
                  </L009>
				  
                  <L011>
                    <xsl:choose>
                      <xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:ContainerCollection/s0:Container/s0:WeightUnit/s0:Code/text()='KG'">
                        <xsl:value-of select="&quot;K&quot;" />
                      </xsl:when>
                      <xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeightUnit/s0:Code/text()='KG'">
                        <xsl:value-of select="&quot;K&quot;" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="&quot;L&quot;" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </L011>
                </ns0:L0>
				
                <ns0:L10>
                  <L1001>
					<xsl:value-of select="round(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:ActualChargeable/text() )"/>
                  </L1001>
                  <L1002>A1</L1002>
                  <L1003>
                    <xsl:choose>
                      <xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeightUnit/s0:Code/text()='KG'">
                        <xsl:value-of select="&quot;K&quot;" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="&quot;L&quot;" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </L1003>
                </ns0:L10>
				
                <ns0:L10>
                  <L1001>
                    <xsl:value-of select="round(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeight/text())"/>
                  </L1001>
                  <L1002>A3</L1002>
                  <L1003>
                    <xsl:choose>
                      <xsl:when test="s0:ShipmentCollection/s0:Shipment/s0:TotalWeightUnit/s0:Code/text()='KG'">
                        <xsl:value-of select="&quot;K&quot;" />
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="&quot;L&quot;" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </L1003>
                </ns0:L10>

                <ns0:SL1>
                  <SL101>
                    <xsl:value-of select="substring(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:ServiceLevel/s0:Code, 1, 2)"/>
                  </SL101>
                  <SL103>
                    <xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:PackingLineCollection/s0:PackingLine/s0:Commodity/s0:Code"/>
                  </SL103>
                </ns0:SL1>
				
				
                <xsl:for-each select="s0:PostingJournalCollection/s0:PostingJournal">
                  <xsl:variable name="TotalAmt" select="userCSharp:ConvertStringToDecimal(string(s0:LocalTotalAmount/text()))"/>
                  <xsl:if test="$TotalAmt != 0.00">
                    <ns0:L1Loop1>
                      <ns0:L1>
                        <!-- <L101> -->
                          <!-- <xsl:value-of select="position()"/> -->
                        <!-- </L101> -->
                        <!-- <xsl:if test="s0:LocalTotalAmount"> -->
                          <!-- <L102> -->
                            <!-- <xsl:value-of select="$TotalAmt" /> -->
                          <!-- </L102> -->
                        <!-- </xsl:if> -->
                        <!-- <L103> -->
                          <!-- <xsl:value-of select="&quot;KG&quot;"/> -->
                        <!-- </L103> -->
                        <L104>
                          <xsl:value-of select="userCSharp:CheckStringMandatory(userCSharp:ConvertStringToDecimalWihout(string(s0:LocalTotalAmount/text())), 'Value Evaluated mapped to L104 from Xpath: LocalTotalAmount', $ACKey)"/>
                        </L104> 
                        <L108>
							<xsl:choose>
								<xsl:when test="s0:ChargeCode/s0:Code != ''">
									<xsl:value-of select="userCSharp:GetChargeCode1(s0:ChargeCode/s0:Code)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="&quot;AIR&quot;"/>
								</xsl:otherwise>
							</xsl:choose>
                        </L108>
                        <!-- <L112> -->
                          <!-- <xsl:value-of select="s0:ChargeCode/s0:Description/text()" /> -->
                        <!-- </L112> -->
                      </ns0:L1>
                    </ns0:L1Loop1>
                  </xsl:if>
                </xsl:for-each>
              </ns0:L5Loop1>
            </ns0:LXLoop1>
			
            <ns0:L3>
			<xsl:variable name="L3_01">
				<xsl:choose>
					<xsl:when test="string-length(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:ActualChargeable)!=0">
						<xsl:value-of select="userCSharp:MathRound(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:ActualChargeable)"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="userCSharp:MathRound(s0:ShipmentCollection/s0:Shipment/s0:TotalWeight)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="L3_09">
				<xsl:choose>
					<xsl:when test="string-length(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalVolume/text())!=0">
						<xsl:value-of select="userCSharp:MathRound(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalVolume/text())"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="userCSharp:MathRound(s0:ShipmentCollection/s0:Shipment/s0:TotalVolume/text())"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="L3_11">
				<xsl:choose>
					<xsl:when test="string-length(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalNoOfPacks/text())!=0">
						<xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalNoOfPacks/text()"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:TotalNoOfPacks/text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="L3_12">
				<xsl:choose>
					<xsl:when test="string-length(s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeightUnit/s0:Code/text())!=0">
						<xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:SubShipmentCollection/s0:SubShipment/s0:TotalWeightUnit/s0:Code/text()"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="s0:ShipmentCollection/s0:Shipment/s0:TotalWeightUnit/s0:Code/text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			
              <L301>
                <xsl:value-of select="$L3_01" />
              </L301>
              <L302>
				<xsl:value-of select="&quot;B&quot;" />
              </L302>
              <L305>
                <xsl:value-of select="userCSharp:CheckStringMandatory(userCSharp:ConvertStringToDecimalWihout(s0:LocalTotal/text()), 'Value Evaluated mapped to L305 from Xpath: LocalTotal', $ACKey)"/>
              </L305>
              <!-- <L309> -->
                <!-- <xsl:value-of select="$L3_09" /> -->
              <!-- </L309> -->
              <!-- <L310> -->
				<!-- <xsl:value-of select="&quot;X&quot;" /> -->
              <!-- </L310> -->
              <!-- <L311> -->
                <!-- <xsl:value-of select="$L3_11" /> -->
              <!-- </L311> -->
              <!-- <L312> -->
                <!-- <xsl:choose> -->
                  <!-- <xsl:when test="$L3_12 ='KG'"> -->
                    <!-- <xsl:value-of select="&quot;K&quot;" /> -->
                  <!-- </xsl:when> -->
                  <!-- <xsl:otherwise> -->
                    <!-- <xsl:value-of select="&quot;L&quot;" /> -->
                  <!-- </xsl:otherwise> -->
                <!-- </xsl:choose> -->
              <!-- </L312> -->
            </ns0:L3>
			
          </ns0:X12_00401_110>

    </xsl:for-each>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
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
         public static string ConvertTimeValue(string inputDateString)
        {
            string outDateString;
             if(inputDateString.Length >0)
            {
            System.DateTime dt=System.Convert.ToDateTime(inputDateString);
            outDateString = dt.ToString("HHmmss");
}
else
{outDateString="";
}
            return outDateString;            
        }
        public static string GetStateCode(string inputDateString)
        {
          string outValue=inputDateString;
          if(inputDateString.Length>2)
          {
           outValue=inputDateString.Substring(0, 2);
          }
           return outValue;
        }  
        public static string GetCountryCode(string inputDateString)
        {
          string outValue=inputDateString;
          if(inputDateString.Length>2)
          {
           outValue=inputDateString.Substring(0, 2);
          }
           return outValue;
        }  
        public static string ConvertStringToDecimal(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString = number.ToString("0.00");
           return OutDataString;
        } 
        
        public static string GetL102(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString=string.Empty;
           int i = (int)number;
           if (i == 0 || i == 00)
           {
                OutDataString="ERROR";
           }
           else
           {
                OutDataString = number.ToString("0.00");
           }
           return OutDataString;
        } 
        
        
        public static string ConvertStringToDecimalWihout(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString = (number*100).ToString("0");
           return OutDataString;
        } 
        
         public static string GetL104(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           string OutDataString = (number).ToString("0.00");
           return OutDataString;
        } 
        
        public static string GetRoundUp(string inputDataString)
        {
           decimal number = Decimal.Parse(inputDataString);
           return System.Math.Ceiling(number).ToString();
        }  
        
        public static double Round(double d)
          {
              var absoluteValue = Math.Abs(d);
              var integralPart = (long)absoluteValue;
              var decimalPart = absoluteValue - integralPart;
              var sign = Math.Sign(d);

              double roundedNumber;

              if (decimalPart > 0.5)
              {
                  roundedNumber = integralPart + 1;
              }
              else if (decimalPart == 0)
              {
                  roundedNumber = absoluteValue;
              }
              else
              {
                  roundedNumber = integralPart + 0.5;
              }

              return sign * roundedNumber;
          }
        
         public static string GetChargeCodeDesc(string inputDataString)
        {
            string outDescription = string.Empty;            
            System.Collections.Generic.Dictionary<string,string> chargeCode=new System.Collections.Generic.Dictionary<string,string>();
            chargeCode.Add("BLC","Documentation - Destination");
            chargeCode.Add("CEC","Customs Formalities");
            chargeCode.Add("CUC","Customs Entry");
            chargeCode.Add("DEF","Delivery Charge");
            chargeCode.Add("ENS","ENS Fee");
            chargeCode.Add("FCZ","FCZ Fee");
            chargeCode.Add("FRT","Freight");
            chargeCode.Add("FSC","Fuel Surcharge");
            chargeCode.Add("HLF","Handling");
            chargeCode.Add("OCART","Pick-up and Delivery");
            chargeCode.Add("SC","Security Signature Service");
            chargeCode.Add("SCF","Screening Fee");
            chargeCode.Add("STR","Storage");
            chargeCode.Add("T1","T1");
            chargeCode.Add("THC","Terminal Service Fee");
            chargeCode.Add("TOLL","Interstate/Highway Toll");
            chargeCode.Add("ORC","Origin Handling");
            chargeCode.Add("DORC","Destination Handling");
            chargeCode.Add("BOL","Documentation - Origin");
            chargeCode.Add("EDI","Electronic Data Interchange");
            chargeCode.Add("ECCLR","Export Customs Clearance");
            chargeCode.Add("AWB","Documentation - Origin");
            
            chargeCode.Add("SPT","Spot Quote");
            chargeCode.Add("AMS","AMS Fee");
            chargeCode.Add("DNOTE","Destination Charges");
            chargeCode.Add("OHF","Origin Charges");
            
            if (chargeCode.ContainsKey(inputDataString))
                outDescription = chargeCode[inputDataString];
            if(outDescription.Length>50)
            {
            outDescription = outDescription.Substring(1, 49); }
            
            return outDescription;
        }
        
         public static string GetChargeCodeDescL502(string inputDataString)
        {
            string outDescription = string.Empty;
            System.Collections.Generic.Dictionary<string,string> chargeCode=new System.Collections.Generic.Dictionary<string,string>();
            chargeCode.Add("BLC","DOCUMENTS");
            chargeCode.Add("CEC","EXPORT CUSTOMS");
            chargeCode.Add("CUC","CUSTOMS CLEARANCE");
            chargeCode.Add("DEF","DELIVERY");
            chargeCode.Add("ENS","AMS/ENS");
            chargeCode.Add("FCZ","FCZ");
            chargeCode.Add("FRT","FREIGHT");
            chargeCode.Add("FSC","FUEL SURCHARGE");
            chargeCode.Add("HLF","HANDLING");
            chargeCode.Add("OCART","PICKUP");
            chargeCode.Add("SSC","SECURITY SURCHARGE");
            chargeCode.Add("SCF","SCREENING");
            chargeCode.Add("STR","STORAGE");
            chargeCode.Add("T1","T1");
            chargeCode.Add("THC","TERMINAL HANDLING");
            chargeCode.Add("TOLL","TOLL");
            chargeCode.Add("ORC","Origin Local Charges");
            chargeCode.Add("DORC","Destination Local Charges");
            chargeCode.Add("BOL","Bill of Lading Fee");
            chargeCode.Add("EDI","EDI");
            chargeCode.Add("ECCLR","EXPORT CUSTOMS CLEARANCE FEE");
            chargeCode.Add("AWB","AIRWAY BILL FEE");
            
            if (chargeCode.ContainsKey(inputDataString))
                outDescription = chargeCode[inputDataString];
            if(outDescription.Length>50)
            {
            outDescription = outDescription.Substring(1, 49); }
            
            return outDescription;
        }
        
        public static string GetChargeCode(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> chargeCode=new System.Collections.Generic.Dictionary<string,string>();
            chargeCode.Add("FRT","400");chargeCode.Add("FSC","405");chargeCode.Add("SC","675");chargeCode.Add("HLF","HHB");
            chargeCode.Add("THC","730");chargeCode.Add("CEC","CSF");chargeCode.Add("OCART","PUD");
            chargeCode.Add("SCF","A09");chargeCode.Add("BLC","DOC");chargeCode.Add("CUC","CSE");chargeCode.Add("DEF","DEL");
            chargeCode.Add("STR","SRG");chargeCode.Add("TFF","PUD");
            chargeCode.Add("FOR","LFT");chargeCode.Add("OSEC","400");
            
            chargeCode.Add("HANDLING","HHB");chargeCode.Add("PICKUP FEE","PUD");chargeCode.Add("ENS FEE","CSF");chargeCode.Add("DOCUMENT FEE","DOC");
            chargeCode.Add("FREIGHT","400");chargeCode.Add("SECURITY SURCHARGE","675");chargeCode.Add("CUSTOMS CLEARANCE","CSF");chargeCode.Add("DELIVERY FEE","DEL");
            chargeCode.Add("HANDLING CHARGE","HHB");chargeCode.Add("TOLL","IHT");chargeCode.Add("T1","T1F");
            
            chargeCode.Add("ORC","H01");
            chargeCode.Add("DORC","H17");
            
            chargeCode.Add("ORC1","H01"); //PROD Error Code fix 22.05.2017
            chargeCode.Add("DORC1","H17"); //PROD Error Code fix 22.05.2017
            
            chargeCode.Add("ENS","CSF");
            chargeCode.Add("BOL","430");
            chargeCode.Add("EDI","EDI");
            chargeCode.Add("ECCLR","090");
            chargeCode.Add("FCZ","FCZ");
            
            chargeCode.Add("AWB","430");
            
            chargeCode.Add("SPT","SPT");
            chargeCode.Add("AMS","CSF");
            chargeCode.Add("DNOTE","DCF");
            chargeCode.Add("OHF","ORI");
            
            
            inputDataString=inputDataString.ToUpper();
            if (chargeCode.ContainsKey(inputDataString))
                outDataString = chargeCode[inputDataString];
            return outDataString;
        }
        
        public static string GetPackageType(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> packageType=new System.Collections.Generic.Dictionary<string,string>();
            packageType.Add("PX","PLT");
            packageType.Add("CT","CTN");
            packageType.Add("BG","BAG");
            packageType.Add("PK","PKG");
            packageType.Add("PS","PCS");
            packageType.Add("SI","SKD");
            packageType.Add("CS","CAS");
            packageType.Add("BX","BOX");
            packageType.Add("RO","ROL");
            packageType.Add("DR","DRM");
            packageType.Add("4C","CRT");
            packageType.Add("PKG","PKG");
            packageType.Add("PLT","PLT");
            packageType.Add("PC","PCS");
            packageType.Add("CR","CRT");
            packageType.Add("EG","PLT");
            packageType.Add("PCE","PCS");

            if (packageType.ContainsKey(inputDataString))
                outDataString = packageType[inputDataString];
            return outDataString;
        }

        public static string UpdateZipCode(string inputString)
        {
          string outValue=Regex.Replace(inputString, @"\W", string.Empty);
          return outValue;
        }
        public static string GetVolume(string code, string volume)
        {
          string outValue="0";
          decimal number = Decimal.Parse(volume);
          if(code=="M3")
          {
            outValue=Decimal.Divide(number,(Decimal)0.006).ToString("0.00");
          }else if(code=="CI")
          {
            outValue=Decimal.Divide(number,366).ToString("0.00");
          }else if(code=="CC")
          {
            outValue=Decimal.Divide(number,6000).ToString("0.00");
          }
          return outValue;
        }
        
        public static string GetSubString(string inputDataString,int datalength)
        {
            string outDescription = inputDataString.Replace(":","").Trim();
            if(outDescription.Length>datalength)
            {
            outDescription = outDescription.Substring(0, datalength); }
            return outDescription;
         }
         
          public static string GetL112(string inputDataString,int datalength)
          {
           string outDescription = inputDataString.Trim();
            if(outDescription.Length>25)
            {
            outDescription = outDescription.Substring(0, datalength); }
            return outDescription.TrimEnd();
            }
            
            public static string GetServiceLevel(string inputValue)
            {
              string outValue=inputValue.Trim();
              if(inputValue.Trim()=="DEF")
              {
                outValue="DF";
              }else if (inputValue.Trim()=="EXP" || inputValue.Trim()=="EX")
              {
                outValue="CX";
              }
              return outValue;            
            }
                 public static string CheckStringLength(string inputDateString)
    {
      string outValue=inputDateString.Trim();
      if(inputDateString.Trim().Length==0)
        outValue=string.Empty;
      return outValue;
    }
    
      public static string CheckStringMandatory(string inputDateString, string segmentName , string ACKey)
    {
      string outValue=inputDateString.Trim();
      string FCFSKey = " AccountingInvoice : " + ACKey + "|";
      if(inputDateString.Trim().Length==0)
        throw new System.Exception( "AccountingInvoice: "+ACKey + segmentName + " is empty. Please check your input");
      return outValue;
    }
    
      public static string CheckStringMandatory1(string inputDateString, string segmentName,string key1 , string ACKey)
    {
      string outValue=inputDateString.Trim();
      string FCFSKey = " AccountingInvoice : " + ACKey + "|";
      if(inputDateString.Trim().Length==0)
        throw new System.Exception( "AccountingInvoice: "+ACKey + segmentName + key1+ " is empty. Please check your input");
      return outValue;
    }
    
    
    public string ChargeCodeTrim(string val)
    {
    string v="";
    if(val.Length >= 3)
    {
v=val.Substring(0, 3);
    }
    else
    {
    v=val;
    }
    return v;
    }
    
    public string ReplaceString(string val)
    {
    return val.Replace("-","");
    }
	  public static string GetChargeCode1(string inputDataString)
        {
            string outDataString=string.Empty;
            System.Collections.Generic.Dictionary<string,string> chargeCode=new System.Collections.Generic.Dictionary<string,string>();
            chargeCode.Add("ASSC","ARB");chargeCode.Add("AMS","AMS");
            chargeCode.Add("AIR EXP","AIR");chargeCode.Add("AIR IMP","AIR");          
            chargeCode.Add("B/L FEE","BLC");chargeCode.Add("BAF IMP","FUE");
            chargeCode.Add("CAF","CUA");chargeCode.Add("CHA","CHE");
            chargeCode.Add("CHAS SPLIT","CHE");chargeCode.Add("CLE","CUS");
            chargeCode.Add("CLEADD","CUS");chargeCode.Add("CLEANTRUCK","CLN");
            chargeCode.Add("COURIER","CRS");chargeCode.Add("DDC","DOC");
            chargeCode.Add("DEMURRAGE","DTN");chargeCode.Add("DETENT","DTN");        
            chargeCode.Add("DLC","DRC");chargeCode.Add("DOC","DOC");                        
            chargeCode.Add("DUTY","315");chargeCode.Add("EXM","762");        
            chargeCode.Add("HANDLING","HHB");chargeCode.Add("INLAND","DRC");
            chargeCode.Add("ISF","240");chargeCode.Add("LINE HAUL","400");
            chargeCode.Add("OFR EXP","COF");chargeCode.Add("OIM","COF");
            chargeCode.Add("OLC","CTG");chargeCode.Add("OVSC","COF");
            chargeCode.Add("PIER PASS","PWH");chargeCode.Add("PIM","PBL");
            chargeCode.Add("PSF","675");chargeCode.Add("PSS IMP","SUR");
            chargeCode.Add("SC FUEL","FUE"); chargeCode.Add("SEC","PSS"); 
            chargeCode.Add("STORAGE","STR");chargeCode.Add("THC","TER");            
            chargeCode.Add("TRF","TRF"); chargeCode.Add("WHS","WHC");
			chargeCode.Add("INL","DRC");
			chargeCode.Add("FRT","400");
			chargeCode.Add("FREIGHT","400");
			chargeCode.Add("DSTAIR","AIR");
			chargeCode.Add("ASCEX","AIR");
			chargeCode.Add("HABEX","HHB");
			chargeCode.Add("AHFEX","AIR");
			chargeCode.Add("AIRMF","AIR");
			chargeCode.Add("MBLF","400");
			chargeCode.Add("EDIEX","400");
			chargeCode.Add("PIC","400");
			chargeCode.Add("DEFAULT","AIR");

            inputDataString=inputDataString.ToUpper();
            if (chargeCode.ContainsKey(inputDataString))
                outDataString = chargeCode[inputDataString];
			else outDataString = "AIR";
            return outDataString;
        }


public bool IsNumeric(string val)
{
	if (val == null)
	{
		return false;
	}
	double d = 0;
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool IsNumeric(string val, ref double d)
{
	if (val == null)
	{
		return false;
	}
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

	
public string MathRound(string val)
{
	return MathRound(val, "0");
}


public string MathRound(string val, string decimals)
{
	string retval = "";
	double v = 0;
	double db = 0;
	if (IsNumeric(val, ref v) && IsNumeric(decimals, ref db))
	{
		try
		{
			int d = (int) db;
			double ret = Math.Round(v, d);
			retval = ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
		}
		catch (Exception)
		{
		}
	}
	return retval;
}
	
	
	
]]>
  </msxsl:script>
</xsl:stylesheet>
