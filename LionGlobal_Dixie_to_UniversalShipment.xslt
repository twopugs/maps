<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/CPPOHD_D" />
	</xsl:template>
	<xsl:template match="/CPPOHD_D">

		<xsl:variable name="var_DEL_WHCODE">
			<xsl:choose>
				<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'BAYS'">
					<xsl:value-of select="&quot;AUMEL&quot;" />
				</xsl:when>
				<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'NSW'">
					<xsl:value-of select="&quot;AUSYD&quot;" />
				</xsl:when>
				<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'QLD'">
					<xsl:value-of select="&quot;AUBNE&quot;" />
				</xsl:when>
				<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'WA'">
					<xsl:value-of select="&quot;AUFRE&quot;" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="&quot;AUZZZ&quot;" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable> 

		<ns0:UniversalShipment>
			<ns0:Shipment>
				<ns0:AdditionalTerms>
					<xsl:value-of select="normalize-space(POHEADER/DELCUST/text())" />
				</ns0:AdditionalTerms>
				<ns0:BookingConfirmationReference>
					<xsl:value-of select="normalize-space(POHEADER/CUST_REF/text())" />
				</ns0:BookingConfirmationReference>
				<ns0:DateCollection>
					<ns0:Date>
						<ns0:Value>
							<xsl:value-of select="concat(substring(normalize-space(POHEADER/ORDERDATE/text()), 1, 4), '-', substring(normalize-space(POHEADER/ORDERDATE/text()), 5, 2), '-', substring(normalize-space(POHEADER/ORDERDATE/text()), 7, 2), 'T00:00:00')"/>
						</ns0:Value>
						<ns0:Type>OrderDate</ns0:Type>
						<ns0:IsEstimate>false</ns0:IsEstimate>
					</ns0:Date>
					<ns0:Date>
						<ns0:Value>
							<xsl:value-of select="concat(substring(normalize-space(POHEADER/SHIPBEFORE/text()), 1, 4), '-', substring(normalize-space(POHEADER/SHIPBEFORE/text()), 5, 2), '-', substring(normalize-space(POHEADER/SHIPBEFORE/text()), 7, 2), 'T00:00:00')"/>
						</ns0:Value>
						<ns0:Type>ExWorksRequiredBy</ns0:Type>
						<ns0:IsEstimate>false</ns0:IsEstimate>
					</ns0:Date>
				</ns0:DateCollection>
				<ns0:DataContext>
					<ns0:DataTargetCollection>
						<ns0:DataTarget>
							<ns0:Type>OrderManagerOrder</ns0:Type>
						</ns0:DataTarget>
					</ns0:DataTargetCollection>
				</ns0:DataContext>
				<ns0:CommercialInfo>
					<ns0:CommercialInvoiceCollection>
						<ns0:CommercialInvoice>
							<ns0:InvoiceNumber>
								<xsl:value-of select="normalize-space(POHEADER/PI_NUMBER/text())" />
							</ns0:InvoiceNumber>
							<ns0:InvoiceDate>
								<xsl:value-of select="concat(substring(normalize-space(POHEADER/ORDERDATE/text()), 1, 4), '-', substring(normalize-space(POHEADER/ORDERDATE/text()), 5, 2), '-', substring(normalize-space(POHEADER/ORDERDATE/text()), 7, 2), 'T00:00:00')"/>
							</ns0:InvoiceDate>
						</ns0:CommercialInvoice>
					</ns0:CommercialInvoiceCollection>
				</ns0:CommercialInfo>
				<ns0:FreightRateCurrency>
					<ns0:Code>
						<xsl:value-of select="normalize-space(POHEADER/CURRENCY/text())" />
					</ns0:Code>
				</ns0:FreightRateCurrency>
				<ns0:LocalProcessing>
					<ns0:DeliveryRequiredBy>
						<xsl:value-of select="concat(substring(normalize-space(POHEADER/REQWHETA/text()), 1, 4), '-', substring(normalize-space(POHEADER/REQWHETA/text()), 5, 2), '-', substring(normalize-space(POHEADER/REQWHETA/text()), 7, 2), 'T00:00:00')"/>
					</ns0:DeliveryRequiredBy>
				</ns0:LocalProcessing>


				<ns0:PortOfDestination>
					<ns0:Code>
						<xsl:choose>
							<xsl:when test="POHEADER/DESTPORT/text() != ''">
								<xsl:value-of select="normalize-space(userCSharp:PortOfDestinationConvert(POHEADER/DESTPORT/text()))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$var_DEL_WHCODE"/>
							</xsl:otherwise>
						</xsl:choose>
					</ns0:Code>
				</ns0:PortOfDestination>
				<ns0:PortOfDischarge>
					<ns0:Code>
						<xsl:choose>
							<xsl:when test="POHEADER/DESTPORT/text() != ''">
								<xsl:value-of select="normalize-space(userCSharp:PortOfDestinationConvert(POHEADER/DESTPORT/text()))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$var_DEL_WHCODE"/>
							</xsl:otherwise>
						</xsl:choose>
					</ns0:Code>
				</ns0:PortOfDischarge>
				<ns0:ShipmentIncoTerm>
					<ns0:Code>
						<xsl:value-of select="normalize-space(POHEADER/FRTTERM/text())" />
					</ns0:Code>
				</ns0:ShipmentIncoTerm>
				<ns0:TransportMode>
					<ns0:Code>
						<xsl:value-of select="normalize-space(POHEADER/SHIPMODE/text())" />
					</ns0:Code>
				</ns0:TransportMode>
				<ns0:Order>
					<ns0:OrderNumber>
						<xsl:value-of select="concat('DCE', userCSharp:ReplaceString(normalize-space(POHEADER/PONO/text())))" />
					</ns0:OrderNumber>
					<ns0:Status>
						<ns0:Code>INC</ns0:Code>
					</ns0:Status>
					<ns0:OrderLineCollection>
						<xsl:for-each select="POHEADER/PODETAILS">
							<xsl:for-each select="QUANTITY">
								<ns0:OrderLine>
									<ns0:LineNumber>
										<xsl:value-of select="normalize-space(../LINENO/text())" />
									</ns0:LineNumber>
									<ns0:OrderedQty>
										<xsl:value-of select="normalize-space(./text())" />
									</ns0:OrderedQty>
									<ns0:PackageQty>
										<xsl:value-of select="normalize-space(../PACKITEMS/text())" />
									</ns0:PackageQty>
									<xsl:for-each select="../IMPPRODCODE">
										<ns0:Product>
											<ns0:Code>
												<xsl:value-of select="normalize-space(./text())" />
											</ns0:Code>
											<ns0:Description>
												<xsl:value-of select="normalize-space(../PRODDESC/text())" />
											</ns0:Description>
										</ns0:Product>
									</xsl:for-each>
									<ns0:UnitPriceRecommended>
										<xsl:value-of select="normalize-space(../UNITPRICE/text())" />
									</ns0:UnitPriceRecommended>
									<ns0:Volume>
										<xsl:value-of select="normalize-space(../VOLUME/text())" />
									</ns0:Volume>
									<ns0:Weight>
										<xsl:value-of select="normalize-space(../WEIGHT/text())" />
									</ns0:Weight>
									<ns0:CustomizedFieldCollection>
										<xsl:for-each select="../SUPPPRODCODE">
											<ns0:CustomizedField>
												<ns0:Key>
													<xsl:text>SELLER_PID</xsl:text>
												</ns0:Key>
												<ns0:DataType>
													<xsl:text>String</xsl:text>
												</ns0:DataType>
												<ns0:Value>
													<xsl:value-of select="normalize-space(./text())" />
												</ns0:Value>
											</ns0:CustomizedField>
										</xsl:for-each>
										<xsl:for-each select="../SUPPPRODDESC">
											<ns0:CustomizedField>
												<ns0:Key>
													<xsl:text>SELLER_DESC</xsl:text>
												</ns0:Key>
												<ns0:DataType>
													<xsl:text>String</xsl:text>
												</ns0:DataType>
												<ns0:Value>
													<xsl:value-of select="normalize-space(./text())" />
												</ns0:Value>
											</ns0:CustomizedField>
										</xsl:for-each>
									</ns0:CustomizedFieldCollection>
									<ns0:AdditionalInformation>
										<xsl:value-of select="concat(normalize-space(../../DEL_ADDR1/text()), ' ', normalize-space(../../DEL_ADDR2/text()), ' ',  normalize-space(../../DEL_ADDR3/text()), ' ', normalize-space(../../DEL_ADDR4/text()), ' ', normalize-space(../../DEL_ADDRCTY/text()))"/>
									</ns0:AdditionalInformation>
								</ns0:OrderLine>
							</xsl:for-each>
						</xsl:for-each>
					</ns0:OrderLineCollection>
				</ns0:Order>

				<xsl:choose>
					<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR'">
						<ns0:ServiceLevel>
							<ns0:Code>DIR</ns0:Code>
						</ns0:ServiceLevel>
					</xsl:when>
					<xsl:otherwise>
						<ns0:ServiceLevel>
							<ns0:Code>STD</ns0:Code>
						</ns0:ServiceLevel>
					</xsl:otherwise>
				</xsl:choose>

				<ns0:OrganizationAddressCollection>

					<xsl:choose>
						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'AXFURN'">
							<ns0:AddressType>
								<xsl:text>ConsignorDocumentaryAddress</xsl:text>
							</ns0:AddressType>
							<ns0:Address1>Lot 9633, Jalan Ayer Manis</ns0:Address1>
							<ns0:Address2>Parit Jawa, 84150</ns0:Address2>
							<ns0:City/>
							<ns0:CompanyName>AX FURNITURE SDN BHD</ns0:CompanyName>
							<ns0:Contact/>
							<ns0:Email>marketing1@axfurniture.com</ns0:Email>
							<ns0:Fax>00116069868004</ns0:Fax>
							<ns0:Phone>00116069868007</ns0:Phone>
						</xsl:when>
						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'BESTBETECK'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>PTD 10636, JALAN KEMPAS 1</ns0:Address1>
								<ns0:Address2>KAWASAN PERINDUSTRIAN</ns0:Address2>
								<ns0:City/>
								<ns0:CompanyName>BEST-BETECK FURNITURE SDN BHD</ns0:CompanyName>
								<ns0:Contact/>
								<ns0:Email>marketing2@bestbeteck.com; toh@bestbeteck.com</ns0:Email>
								<ns0:Fax/>
								<ns0:Phone>6069866967</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>
						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = ''">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1/>
								<ns0:Address2/>
								<ns0:City/>
								<ns0:CompanyName/>
								<ns0:Contact/>
								<ns0:Email/>
								<ns0:Fax/>
								<ns0:Phone/>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'BOAS'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>UNIT A, 16F.,</ns0:Address1>
								<ns0:Address2>88 COMMERCIAL BUILDING</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>BOAS FURNITURE COMPANY LIMITED</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>owen@boasfurniture.com</ns0:Email>
								<ns0:Fax>25436637</ns0:Fax>
								<ns0:Phone>25435013</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'BURDEN'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>Limited</ns0:Address1>
								<ns0:Address2>Suite 2001 20F</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>Burden Furniture (Inter'nal) L</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>lindsay@burdenfurniture.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>963807107</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'CKBAN'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>No 3799 Mk. 11. Changkat</ns0:Address1>
								<ns0:Address2>14300 Nibong Tebal.</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>C.K. BAN SOON LEE INDUSTRIES</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>sales@ckbsl.com.my</ns0:Email>
								<ns0:Fax>00116045822999</ns0:Fax>
								<ns0:Phone>00116045822111</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'CLEMUSD'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>Unit G63, 63-85 Turner St</ns0:Address1>
								<ns0:Address2>Port Melbourne</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>Clemenger Inter'nal Freight</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>mpavlakos@cif.com.au</ns0:Email>
								<ns0:Fax>96819338</ns0:Fax>
								<ns0:Phone>92059100</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'COMFY'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>LOT 3993 JALAN TEY MIA JEN</ns0:Address1>
								<ns0:Address2>KG. KEBUN SAYUR BUKIT BAKRI</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>COMFY FACTOR SDN BHD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>sam@comfyfactor.com</ns0:Email>
								<ns0:Fax>9868551</ns0:Fax>
								<ns0:Phone>9866500</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'DCEGLOBAL'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>NO5, 1ST FLOOR, JALAN PUNCAK 2</ns0:Address1>
								<ns0:Address2>PEKAN PARIT BAKAR, PARIT BAKAR</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>DCE GLOBAL SDN BHD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>celine@dce-global.com</ns0:Email>
								<ns0:Fax>9811177</ns0:Fax>
								<ns0:Phone>9811144</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'EDENLAND'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>EDENLAND ENTERPRISES PTY LTD</ns0:Address1>
								<ns0:Address2>ROOM 804 SINO CENTRE</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>EDEN LAND ENTERPRISES PTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>yokey@edenlandmsia.com</ns0:Email>
								<ns0:Fax>78740893</ns0:Fax>
								<ns0:Phone>78740886</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'ELEGANTWOO'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>POS 356 BT 4-1/2 PARIT BAKAR</ns0:Address1>
								<ns0:Address2>JALAN TEMENGGUNG AHMAD</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>ELEGANT WOOD-LINK SDH BHD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>celine@dce-global.com</ns0:Email>
								<ns0:Fax>6069813853</ns0:Fax>
								<ns0:Phone>6069811328</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'EON'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>SHANGEN INDUSTRILA ESTATE</ns0:Address1>
								<ns0:Address2>XIQIAO TOWN, NANHAI DISTRICT,</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>EON TECHNOLOGY INDUSTRY CO LTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>ivy@jbmfurniture.com</ns0:Email>
								<ns0:Fax>5781890079</ns0:Fax>
								<ns0:Phone>5781890078</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'FOSHAN'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>WOODEN PRODUCTS CO., LTD</ns0:Address1>
								<ns0:Address2>2ND INDUSTRIAL AREA,</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>GUANGDONG SUNTEAM STEEL</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>lindy@sunteam.com.cn</ns0:Email>
								<ns0:Fax>75728109448</ns0:Fax>
								<ns0:Phone>75728917601</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'HAINBOYANG'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1> LTD</ns0:Address1>
								<ns0:Address2>NO 18 ZHIJIANG ROAD</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>HAINING BOYANG FURNITURE CO LT</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>nancy@boyang-furniture.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>057387933009</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'HOMEUP'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>LOT8726, PTD 6023, BATU 8,</ns0:Address1>
								<ns0:Address2>KAWASAN PERINDUSTRIAN</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>HOME UPHOLSTERY INDUSTRIES SDN</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>swwong@eritz.com.my</ns0:Email>
								<ns0:Fax>6069860942</ns0:Fax>
								<ns0:Phone>606986500</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'HUAXIA'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>XIAOFENG TOWN ANJI COUNTY</ns0:Address1>
								<ns0:Address2>HUZHOU CITY</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>ZHEJIANG HUAXIA BAMBOO and WOOD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>emily@valkahome.com</ns0:Email>
								<ns0:Fax>05725515128</ns0:Fax>
								<ns0:Phone>05725118739</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'INTERMULTI'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>NO 23M JALAN PESERAI PT LAMAN</ns0:Address1>
								<ns0:Address2>83500 PT SULONG BATU PAHAT</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>INTER MULTI FURNITURE SDN BHD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>jyin@imf-furniture.com</ns0:Email>
								<ns0:Fax>6074188833</ns0:Fax>
								<ns0:Phone>6074188333</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'JIASIN'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>NO.29 CHENJIANG ROAD</ns0:Address1>
								<ns0:Address2>CHENJIANG TOWN</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>JIASIN FURNISHINGS LIMITED</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>jorgetct@126.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>8613680763616</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'JINHUABOYA'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>(CAREFREE)</ns0:Address1>
								<ns0:Address2>1399 EAST JINGANG ROAD,</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>JINHUA BOYA FURNITURE CO.LTD.</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>dengjiemax@126.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>57982928688</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'KASEN'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>FLAT 03H, 15F, CARNIVAL COMM</ns0:Address1>
								<ns0:Address2>BUILDING 18 JAVA ROAD</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>KASEN INDUSTRIAL(HK) LIMITED</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>13656627999@139.com</ns0:Email>
								<ns0:Fax>25089598</ns0:Fax>
								<ns0:Phone>28875858</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'KUKA'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>Factory Adds:113-11th Street,</ns0:Address1>
								<ns0:Address2>Xiasha District, Hangzhou,</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>KUKA(HK) TRADE CO.,LIMITED</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>potter@kukahome.com</ns0:Email>
								<ns0:Fax>57185044502</ns0:Fax>
								<ns0:Phone>57185146199</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'LBFURN'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>LOT PTD 5998</ns0:Address1>
								<ns0:Address2>KAWASAN PERINDUSTRIAN BKT</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>LB FURNITURE SDN BHD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>jennifer@lbfurniture.com</ns0:Email>
								<ns0:Fax>6069865522</ns0:Fax>
								<ns0:Phone>6069865500</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'LIVINGWORL'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>PTD 5286 JBB 11 BATU 7 1/2</ns0:Address1>
								<ns0:Address2>JALAN BAKRI 84200</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>LIVING WORLD (M) SDN BHD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>lesley@livingworld.com.my</ns0:Email>
								<ns0:Fax>6069860337</ns0:Fax>
								<ns0:Phone>6069860335</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'MAGMA'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>21F, YUE THAI COMMERCIAL BLD</ns0:Address1>
								<ns0:Address2>128 CONNAUGHT ROAD</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>MAGMA LIMITED</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>msisovic@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>54135218</ns0:Fax>
								<ns0:Phone>54135157</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'MASTER'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>LOT 2325, JALAN SUGAI BURUNG</ns0:Address1>
								<ns0:Address2>81500 PEKAN NENAS , PONTIAN</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>MASTER SOFA INDUSTRIES SDN.BHD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>customerservice2@mastersofa.</ns0:Email>
								<ns0:Fax>76992688</ns0:Fax>
								<ns0:Phone>76991999</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'MMML'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>3RD FLOOR, OMAR HODGE BUILDING</ns0:Address1>
								<ns0:Address2>WICKHAMS CAYI</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>MORROW MARKETING MANAGEMENT</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>craig@mmml.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>
								</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'PHAMNHATA'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>NO 57, 14 THIEN TAN STREET</ns0:Address1>
								<ns0:Address2>BLOCK 4, TAN HOA WARD</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>PHAM NHAT ANH CO., LTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>phamnhatanh.furniture@gmail.</ns0:Email>
								<ns0:Fax>2513983926</ns0:Fax>
								<ns0:Phone>2513983989</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SIGGSHOME'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>LOT 5003 A, JALAN AIK HWA 19</ns0:Address1>
								<ns0:Address2>BUKIT BAKRI 84200 MUAR</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>SIGGS HOME MANUFACTURING SDN</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>info@siggshome.com</ns0:Email>
								<ns0:Fax>6069869273</ns0:Fax>
								<ns0:Phone>6069867273</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SILVER'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>MANUFACTURE LTD</ns0:Address1>
								<ns0:Address2>YANCHENG INDUSTRIAL ZONE</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>SILVER BEAUTY HOME DECORS MANU</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>sales1@silverbeauty.com.cn</ns0:Email>
								<ns0:Fax>00867526577730</ns0:Fax>
								<ns0:Phone>00867526577733</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SKYINTL'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>No.2 MIDDLE GONGYE DADAO</ns0:Address1>
								<ns0:Address2>LONGSHAN INDUSTRY ZONE,</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>SKY INTERNATIONAL GROUP LTD.</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>ceo@skyintlgroup.com.cn</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>7565813666</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SKYLINE'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>NO 263 BEIYUAN ROAD</ns0:Address1>
								<ns0:Address2>KUNSHAN, JIANGSU 215345</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>KUNSHAN SKYLINE INTERNATIONAL</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>nicky@skylinefurn.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>8651250130304</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SOFAX'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>No.800 Shuangbai Road</ns0:Address1>
								<ns0:Address2>Shanghai 201100</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>Sofax Shanghai Co Ltd</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>allan@sofax.com.cn</ns0:Email>
								<ns0:Fax>862164341905</ns0:Fax>
								<ns0:Phone>862164342166</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SUZHOUGX'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>NO. 100 FADA ROAD</ns0:Address1>
								<ns0:Address2>BANQIAO DEVELOPMENT AREA,</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>TAICANG KANGLE SOFA and FURN</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>binder@kangle-sofa.com</ns0:Email>
								<ns0:Fax>51253440738</ns0:Fax>
								<ns0:Phone>51281601081</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'TOPGARD'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>PT MLO 2322 JALEN AYER MANIS</ns0:Address1>
								<ns0:Address2>MUKIM PARIT JAWA</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>TOPGARD RESOURCES SDN BHD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>csyap@topgardresources.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>00116069863313</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'VANSENINT'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>33 JIASHAN AVENUE</ns0:Address1>
								<ns0:Address2>JIASHAN COUNTY</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>ZHEJIANG VANSEN INTELLIGENT FU</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>joyxue@vansen.net.cn</ns0:Email>
								<ns0:Fax>57384669898</ns0:Fax>
								<ns0:Phone>573-84018078</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'VEKENOJINT'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>TRADE CO..LTD</ns0:Address1>
								<ns0:Address2>ROOM 1309 PIAOYING CENTURY</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>SHANGHAI O-J INTERNATIONAL</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>lucky-dragon@vip.163.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>862165159604</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WHITEFEAV'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>L-1-CN, ROAD DA3/NA7</ns0:Address1>
								<ns0:Address2>MY PHUOC INDUSTRIAL PARK</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>WHITE FEATHER INTERNATIONAL CO</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>sharonkoh@whitefeathers.com.</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>40650553933</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODCONAK'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>TAN PHUOC KHANH TOWN</ns0:Address1>
								<ns0:Address2>TAN UYEN DISTRICT</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>AN KHANG CO LTD.,</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>SALES@ANKHANGWOOD.COM</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>842743615491</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODCONLT'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>BINH CHANH WARD</ns0:Address1>
								<ns0:Address2>KHANH BINH PRE</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>LUC THIEN PHU J.S. CO</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>lethienphu9999@gmail.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>0914148698</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODHK'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>21F, YUE THAI COMMERCIAL BUIL</ns0:Address1>
								<ns0:Address2>128 CONNAUGHT ROAD</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>WOODNET LIMITED</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>msisovic@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>62811496</ns0:Fax>
								<ns0:Phone>66848260</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNET'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>WOODNET LIMITED HCMC (FACTORY)</ns0:Address1>
								<ns0:Address2>RM101 SOUTHERN CROSS SKY VIEW</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>LE HOANG MINH CO. LTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>woodnet1@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>54135218</ns0:Fax>
								<ns0:Phone>54135157</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETCL'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>343 TRAN KHAT CHAN STREET</ns0:Address1>
								<ns0:Address2>THANH NHAN WARD</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>CUU LONG JOINT STOCK COMPANY</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>woodnet1@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>988465789</ns0:Fax>
								<ns0:Phone>439722227</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETDOH'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>LY THUONG KIET ST-DI AN WARD</ns0:Address1>
								<ns0:Address2>BINH DUONG PROVINCE</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>DONG HOA WOOD PROCESS. CO.,LTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>admin@rbcdonghoa.vn</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>6503734363</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETDU'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>NO.12,27A STREET</ns0:Address1>
								<ns0:Address2>PHUOC LONG B WARD</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>DAI THUAN FURNITURE COMPANY</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>info@daifuco.vn</ns0:Email>
								<ns0:Fax>02516280307</ns0:Fax>
								<ns0:Phone>02516280309</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETEW'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>TAN PHUOC KHANNH TAN UYEN</ns0:Address1>
								<ns0:Address2>BINH DUONG VIET NAM</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>EASTWESTFURN LTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>woodnet1@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>846503612723</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETGM'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>Hamlet 1B, An Phu Ward</ns0:Address1>
								<ns0:Address2>Thuan An District</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>GIANG MINH CO.,LTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>woodnet1@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>8406503713172</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETHT'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>LOT A1-A4</ns0:Address1>
								<ns0:Address2>NORTHEAST SONG CAU INDUSTRIAL</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>THAI THINH COMPANY LTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>woodnet1@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>001108457372115</ns0:Fax>
								<ns0:Phone>001108457372117</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETHU'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>KM20 - HIGHWAY 19 -</ns0:Address1>
								<ns0:Address2>NHON HOA WARD, AN NHON TOWN</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>HUU THINH PRODUCTION and TRADING</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>woodnet1@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>563838704</ns0:Fax>
								<ns0:Phone>563838547</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETTHA'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>59D/1 AN PHU WARD</ns0:Address1>
								<ns0:Address2>THUAN AN TOWN</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>THINH AN WOOD LTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>woodnet1@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>06503777924</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETVB'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>Lot C2, Street N4,</ns0:Address1>
								<ns0:Address2>Nam Tan Uyen IZ</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>VIETBOARD JOINT STOCK COMPANY</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>woodnet1@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>6503652960</ns0:Fax>
								<ns0:Phone>6503652887</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETVI'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>G.5, Binh Khanh</ns0:Address1>
								<ns0:Address2>Khanh Binh</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>VIENA HANDICRAFT CO.LTD.</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>vienaco@gmail.com</ns0:Email>
								<ns0:Fax>2743652744</ns0:Fax>
								<ns0:Phone>2743652744</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETVN'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>60/8 ROAD 18, HIEP BINH CHANH</ns0:Address1>
								<ns0:Address2>THU DUC DIS HCM CITY</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>VIETNAM CONNECTION CO. LTD</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>woodnet1@woodnet-ltd.net</ns0:Email>
								<ns0:Fax>837263110</ns0:Fax>
								<ns0:Phone>83726310405</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'XINHE'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>LOT 3951 LORONG PAYA</ns0:Address1>
								<ns0:Address2>JALAN KEBUN SAYUR</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>XINHE FURNITURE INDUSTRIES SDN</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>ivy@xinhefurniture.com</ns0:Email>
								<ns0:Fax>175342220</ns0:Fax>
								<ns0:Phone>195950222</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'XINYUAN'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>GUGAO ROAD</ns0:Address1>
								<ns0:Address2>AGRICULTURAL PRODUCT</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>TAIZHOU XINYUAN FURNITURE CO</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>justin@tz-xinyuan.com</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>52387499886</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'YEWH'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>LOT 1950 BATU 1 1/2</ns0:Address1>
								<ns0:Address2>JALAN BANGI 43500</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>YEW HOONG SOFA PRODUCTS (M)</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>marketing@hugosofa.com</ns0:Email>
								<ns0:Fax>60387249890</ns0:Fax>
								<ns0:Phone>60387235676</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'ZAGOLEBET'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>HO CHI MINH</ns0:Address1>
								<ns0:Address2>PRO-LIVING ASIA</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>ZAGO'S STUDIO LE BETON FACTORY</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>nhon.nguyen@pro-living.asia</ns0:Email>
								<ns0:Fax>
								</ns0:Fax>
								<ns0:Phone>+06503639162</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'ZHEJ HAPPY'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>NO.100 LONGXING ROAD</ns0:Address1>
								<ns0:Address2>HAINING, ZHEJIANG</ns0:Address2>
								<ns0:City>
								</ns0:City>
								<ns0:CompanyName>ZHEJIANG HAPPY FURNISHINGS CO</ns0:CompanyName>
								<ns0:Contact>
								</ns0:Contact>
								<ns0:Email>happyleather_03@ounoya.com</ns0:Email>
								<ns0:Fax>57387800118</ns0:Fax>
								<ns0:Phone>57387501620</ns0:Phone>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:otherwise>
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:Address1>
									<xsl:value-of select="normalize-space(POHEADER/VEND_ADDR2/text())" />
								</ns0:Address1>
								<ns0:Address2>
									<xsl:value-of select="normalize-space(POHEADER/VEND_ADDR3/text())" />
								</ns0:Address2>
								<ns0:City>
									<xsl:value-of select="normalize-space(POHEADER/VEND_ADDRCTY/text())" />
								</ns0:City>
								<ns0:CompanyName>
									<xsl:value-of select="normalize-space(POHEADER/VEND_ADDR1/text())" />
								</ns0:CompanyName>
								<ns0:Contact>
									<xsl:value-of select="normalize-space(POHEADER/VEND_CONTACT/text())" />
								</ns0:Contact>
								<ns0:Email>
									<xsl:value-of select="normalize-space(POHEADER/VEND_EMAIL/text())" />
								</ns0:Email>
								<ns0:Fax>
									<xsl:value-of select="normalize-space(POHEADER/VEND_FAX/text())" />
								</ns0:Fax>
								<ns0:Phone>
									<xsl:value-of select="normalize-space(POHEADER/VEND_PHONE/text())" />
								</ns0:Phone>
							</ns0:OrganizationAddress>  
						</xsl:otherwise>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'BAYS'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<ns0:AddressShortCode>BAYS</ns0:AddressShortCode>
								<ns0:Address1>80 Hartnett Dve</ns0:Address1>
								<ns0:Address2>Seaford</ns0:Address2>
								<ns0:City>Seaford</ns0:City>
								<ns0:CompanyName>Bayside Seaford</ns0:CompanyName>
								<ns0:Contact/>
								<ns0:Email/>
								<ns0:Fax/>
								<ns0:Phone/>
								<ns0:State>VIC</ns0:State>
								<ns0:Postcode>3198</ns0:Postcode>
								<ns0:Port>
									<ns0:Code>AUMEL</ns0:Code>
								</ns0:Port>
								<ns0:Country>
									<ns0:Code>AU</ns0:Code>
								</ns0:Country>
							</ns0:OrganizationAddress>		  
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<ns0:AddressShortCode>BAYS</ns0:AddressShortCode>
								<ns0:Address1>80 Hartnett Dve</ns0:Address1>
								<ns0:Address2>Seaford</ns0:Address2>
								<ns0:City>Seaford</ns0:City>
								<ns0:CompanyName>Bayside Seaford</ns0:CompanyName>
								<ns0:Contact/>
								<ns0:Email/>
								<ns0:Fax/>
								<ns0:Phone/>
								<ns0:State>VIC</ns0:State>
								<ns0:Postcode>3198</ns0:Postcode>
								<ns0:Port>
									<ns0:Code>AUMEL</ns0:Code>
								</ns0:Port>
								<ns0:Country>
									<ns0:Code>AU</ns0:Code>
								</ns0:Country>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'NSW'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<ns0:AddressShortCode>NSW</ns0:AddressShortCode>
								<ns0:Address1>1-5 Manchester Rd</ns0:Address1>
								<ns0:Address2>Auburn</ns0:Address2>
								<ns0:City>Auburn</ns0:City>
								<ns0:CompanyName>NSW</ns0:CompanyName>
								<ns0:Contact/>
								<ns0:Email/>
								<ns0:Fax/>
								<ns0:Phone/>
								<ns0:State>NSW</ns0:State>
								<ns0:Postcode>2144</ns0:Postcode>
								<ns0:Country>
									<ns0:Code>AU</ns0:Code>
								</ns0:Country>
								<ns0:Port>
									<ns0:Code>AUSYD</ns0:Code>
								</ns0:Port>
							</ns0:OrganizationAddress>		  
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<ns0:AddressShortCode>NSW</ns0:AddressShortCode>
								<ns0:Address1>1-5 Manchester Rd</ns0:Address1>
								<ns0:Address2>Auburn</ns0:Address2>
								<ns0:City>Auburn</ns0:City>
								<ns0:CompanyName>NSW</ns0:CompanyName>
								<ns0:Contact/>
								<ns0:Email/>
								<ns0:Fax/>
								<ns0:Phone/>
								<ns0:State>NSW</ns0:State>
								<ns0:Postcode>2144</ns0:Postcode>
								<ns0:Country>
									<ns0:Code>AU</ns0:Code>
								</ns0:Country>
								<ns0:Port>
									<ns0:Code>AUSYD</ns0:Code>
								</ns0:Port>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'QLD'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<ns0:AddressShortCode>QLD</ns0:AddressShortCode>
								<ns0:Address1>Dixie Cummings QLD</ns0:Address1>
								<ns0:Address2>4 / 231 Holt St</ns0:Address2>
								<ns0:City>Pinkenba</ns0:City>
								<ns0:CompanyName>QLD</ns0:CompanyName>
								<ns0:Contact/>
								<ns0:Email/>
								<ns0:Fax/>
								<ns0:Phone/>
								<ns0:State>QLD</ns0:State>
								<ns0:Postcode>4009</ns0:Postcode>
								<ns0:Country>
									<ns0:Code>AU</ns0:Code>
								</ns0:Country>
								<ns0:Port>
									<ns0:Code>AUBNE</ns0:Code>
								</ns0:Port>
							</ns0:OrganizationAddress>		  
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<ns0:AddressShortCode>QLD</ns0:AddressShortCode>
								<ns0:Address1>Dixie Cummings QLD</ns0:Address1>
								<ns0:Address2>4 / 231 Holt St</ns0:Address2>
								<ns0:City>Pinkenba</ns0:City>
								<ns0:CompanyName>QLD</ns0:CompanyName>
								<ns0:Contact/>
								<ns0:Email/>
								<ns0:Fax/>
								<ns0:Phone/>
								<ns0:State>QLD</ns0:State>
								<ns0:Postcode>4009</ns0:Postcode>
								<ns0:Country>
									<ns0:Code>AU</ns0:Code>
								</ns0:Country>
								<ns0:Port>
									<ns0:Code>AUBNE</ns0:Code>
								</ns0:Port>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'WA'">
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<ns0:AddressShortCode>WA</ns0:AddressShortCode>
								<ns0:Address1>6 Carousel Road</ns0:Address1>
								<ns0:Address2>Cannington</ns0:Address2>
								<ns0:City>Cannington</ns0:City>
								<ns0:CompanyName>WA Warehouse</ns0:CompanyName>
								<ns0:Contact/>
								<ns0:Email/>
								<ns0:Fax/>
								<ns0:Phone/>
								<ns0:State>WA</ns0:State>
								<ns0:Postcode>6107</ns0:Postcode>
								<ns0:Country>
									<ns0:Code>AU</ns0:Code>
								</ns0:Country>
								<ns0:Port>
									<ns0:Code>AUFRE</ns0:Code>
								</ns0:Port>
							</ns0:OrganizationAddress>		  
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<ns0:AddressShortCode>WA</ns0:AddressShortCode>
								<ns0:Address1>6 Carousel Road</ns0:Address1>
								<ns0:Address2>Cannington</ns0:Address2>
								<ns0:City>Cannington</ns0:City>
								<ns0:CompanyName>WA Warehouse</ns0:CompanyName>
								<ns0:Contact/>
								<ns0:Email/>
								<ns0:Fax/>
								<ns0:Phone/>
								<ns0:State>WA</ns0:State>
								<ns0:Postcode>6107</ns0:Postcode>
								<ns0:Country>
									<ns0:Code>AU</ns0:Code>
								</ns0:Country>
								<ns0:Port>
									<ns0:Code>AUFRE</ns0:Code>
								</ns0:Port>
							</ns0:OrganizationAddress>
						</xsl:when>

						<xsl:otherwise>
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<xsl:choose>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'H/Norman Springvale'">
										<ns0:AddressShortCode>HN Springvale</ns0:AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Furniture Bazaar'">
										<ns0:AddressShortCode>FURNITURE BAZAAR</ns0:AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Auburn Furniture'">
										<ns0:AddressShortCode>HN AUBURN</ns0:AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Noarlunga Furniture'">
										<ns0:AddressShortCode>HN NOARLUNGA</ns0:AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Warehouse F/ston'">
										<ns0:AddressShortCode>HN FRANKSTON</ns0:AddressShortCode>
									</xsl:when>
									<xsl:otherwise>
										<ns0:AddressShortCode>
											<xsl:value-of select="normalize-space(POHEADER/DELCUST/text())" />
										</ns0:AddressShortCode>
									</xsl:otherwise>
								</xsl:choose>
								<!-- <ns0:Address1> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR2/text())" /> -->
								<!-- </ns0:Address1> -->
								<!-- <ns0:Address2> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR3/text())" /> -->
								<!-- </ns0:Address2> -->
								<!-- <ns0:City> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDRCTY/text())" /> -->
								<!-- </ns0:City> -->
								<!-- <ns0:CompanyName> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR1/text())" /> -->
								<!-- </ns0:CompanyName> -->
								<!-- <ns0:Contact> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_CONTACT/text())" /> -->
								<!-- </ns0:Contact> -->
								<!-- <ns0:Email> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_EMAIL/text())" /> -->
								<!-- </ns0:Email> -->
								<!-- <ns0:Fax> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_FAX/text())" /> -->
								<!-- </ns0:Fax> -->
								<!-- <ns0:Phone> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_PHONE/text())" /> -->
								<!-- </ns0:Phone> -->
							</ns0:OrganizationAddress>		  
							<ns0:OrganizationAddress>
								<ns0:AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</ns0:AddressType>
								<ns0:OrganizationCode>DIXIEC_AU</ns0:OrganizationCode>
								<xsl:choose>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'H/Norman Springvale'">
										<ns0:AddressShortCode>HN Springvale</ns0:AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Furniture Bazaar'">
										<ns0:AddressShortCode>FURNITURE BAZAAR</ns0:AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Auburn Furniture'">
										<ns0:AddressShortCode>HN AUBURN</ns0:AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Noarlunga Furniture'">
										<ns0:AddressShortCode>HN NOARLUNGA</ns0:AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Warehouse F/ston'">
										<ns0:AddressShortCode>HN FRANKSTON</ns0:AddressShortCode>
									</xsl:when>
									<xsl:otherwise>
										<ns0:AddressShortCode>
											<xsl:value-of select="normalize-space(POHEADER/DELCUST/text())" />
										</ns0:AddressShortCode>
									</xsl:otherwise>
								</xsl:choose>
								<!-- <ns0:Address1> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR2/text())" /> -->
								<!-- </ns0:Address1> -->
								<!-- <ns0:Address2> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR3/text())" /> -->
								<!-- </ns0:Address2> -->
								<!-- <ns0:City> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDRCTY/text())" /> -->
								<!-- </ns0:City> -->
								<!-- <ns0:CompanyName> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR1/text())" /> -->
								<!-- </ns0:CompanyName> -->
								<!-- <ns0:Contact> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_CONTACT/text())" /> -->
								<!-- </ns0:Contact> -->
								<!-- <ns0:Email> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_EMAIL/text())" /> -->
								<!-- </ns0:Email> -->
								<!-- <ns0:Fax> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_FAX/text())" /> -->
								<!-- </ns0:Fax> -->
								<!-- <ns0:Phone> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_PHONE/text())" /> -->
								<!-- </ns0:Phone> -->
							</ns0:OrganizationAddress>
						</xsl:otherwise>
					</xsl:choose>  

				</ns0:OrganizationAddressCollection>
			</ns0:Shipment>
		</ns0:UniversalShipment>
	</xsl:template>
	<msxsl:script language="C#" implements-prefix="userCSharp">
		<![CDATA[ 
	public string PortOfDestinationConvert(string code)
	{
    if(code.Equals("02")) 
    return "AUSYD";
    else  if(code.Equals("03")) 
    return "AUMEL";
    else  if(code.Equals("04")) 
    return "AUBNE";
    else  if(code.Equals("05")) 
    return "AUADL";
    else  if(code.Equals("07")) 
    return "AUHBA";
    else  if(code.Equals("08")) 
    return "AUFRE";
    else  if(code.Equals("09")) 
    return "AULST";
    else  if(code.Equals("10")) 
    return "AUDRW";
    else  if(code.Equals("11")) 
    return "AUTSV";
    else  if(code.Equals("12")) 
    return "AUBWT";
    else  if(code.Equals("13")) 
    return "AUDPO";
    else  if(code.Equals("14")) 
    return "SGSIN";
    else  if(code.Equals("20")) 
    return "AUZZZ";
	else
	return "AUZZZ";
	}
	public string ReplaceString(string val)
    {
    return val.Replace(" ", "");
    }
	]]>
	</msxsl:script>
</xsl:stylesheet>