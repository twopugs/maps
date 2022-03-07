<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var userCSharp" version="1.0" xmlns:ns0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
	<xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
	<xsl:template match="/">
		<xsl:apply-templates select="/CPPOHD_D" />
	</xsl:template>
	<xsl:template match="/CPPOHD_D">

		

		<UniversalShipment>
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
			<Shipment>
				<AdditionalTerms>
					<xsl:value-of select="normalize-space(POHEADER/DELCUST/text())" />
				</AdditionalTerms>
				<BookingConfirmationReference>
					<xsl:value-of select="normalize-space(POHEADER/CUST_REF/text())" />
				</BookingConfirmationReference>
				<DateCollection>
					<Date>
						<Value>
							<xsl:value-of select="concat(substring(normalize-space(POHEADER/ORDERDATE/text()), 1, 4), '-', substring(normalize-space(POHEADER/ORDERDATE/text()), 5, 2), '-', substring(normalize-space(POHEADER/ORDERDATE/text()), 7, 2), 'T00:00:00')"/>
						</Value>
						<Type>OrderDate</Type>
						<IsEstimate>false</IsEstimate>
					</Date>
					<Date>
						<Value>
							<xsl:value-of select="concat(substring(normalize-space(POHEADER/SHIPBEFORE/text()), 1, 4), '-', substring(normalize-space(POHEADER/SHIPBEFORE/text()), 5, 2), '-', substring(normalize-space(POHEADER/SHIPBEFORE/text()), 7, 2), 'T00:00:00')"/>
						</Value>
						<Type>ExWorksRequiredBy</Type>
						<IsEstimate>false</IsEstimate>
					</Date>
				</DateCollection>
				<DataContext>
					<DataTargetCollection>
						<DataTarget>
							<Type>OrderManagerOrder</Type>
						</DataTarget>
					</DataTargetCollection>
				</DataContext>
				<CommercialInfo>
					<CommercialInvoiceCollection>
						<CommercialInvoice>
							<InvoiceNumber>
								<xsl:value-of select="normalize-space(POHEADER/PI_NUMBER/text())" />
							</InvoiceNumber>
							<InvoiceDate>
								<xsl:value-of select="concat(substring(normalize-space(POHEADER/ORDERDATE/text()), 1, 4), '-', substring(normalize-space(POHEADER/ORDERDATE/text()), 5, 2), '-', substring(normalize-space(POHEADER/ORDERDATE/text()), 7, 2), 'T00:00:00')"/>
							</InvoiceDate>
						</CommercialInvoice>
					</CommercialInvoiceCollection>
				</CommercialInfo>
				<FreightRateCurrency>
					<Code>
						<xsl:value-of select="normalize-space(POHEADER/CURRENCY/text())" />
					</Code>
				</FreightRateCurrency>
				<LocalProcessing>
					<DeliveryRequiredBy>
						<xsl:value-of select="concat(substring(normalize-space(POHEADER/REQWHETA/text()), 1, 4), '-', substring(normalize-space(POHEADER/REQWHETA/text()), 5, 2), '-', substring(normalize-space(POHEADER/REQWHETA/text()), 7, 2), 'T00:00:00')"/>
					</DeliveryRequiredBy>
				</LocalProcessing>


				<PortOfDestination>
					<Code>
						<xsl:choose>
							<xsl:when test="POHEADER/DESTPORT/text() != ''">
								<xsl:value-of select="normalize-space(userCSharp:PortOfDestinationConvert(POHEADER/DESTPORT/text()))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$var_DEL_WHCODE"/>
							</xsl:otherwise>
						</xsl:choose>
					</Code>
				</PortOfDestination>
				<PortOfDischarge>
					<Code>
						<xsl:choose>
							<xsl:when test="POHEADER/DESTPORT/text() != ''">
								<xsl:value-of select="normalize-space(userCSharp:PortOfDestinationConvert(POHEADER/DESTPORT/text()))" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$var_DEL_WHCODE"/>
							</xsl:otherwise>
						</xsl:choose>
					</Code>
				</PortOfDischarge>
				<ShipmentIncoTerm>
					<Code>
						<xsl:value-of select="normalize-space(POHEADER/FRTTERM/text())" />
					</Code>
				</ShipmentIncoTerm>
				<TransportMode>
					<Code>
						<xsl:value-of select="normalize-space(POHEADER/SHIPMODE/text())" />
					</Code>
				</TransportMode>
				<Order>
					<OrderNumber>
						<xsl:value-of select="concat('DCE', userCSharp:ReplaceString(normalize-space(POHEADER/PONO/text())))" />
					</OrderNumber>
					<Status>
						<Code>INC</Code>
					</Status>
					<OrderLineCollection>
						<xsl:for-each select="POHEADER/PODETAILS">
							<xsl:for-each select="QUANTITY">
								<OrderLine>
									<LineNumber>
										<xsl:value-of select="normalize-space(../LINENO/text())" />
									</LineNumber>
									<OrderedQty>
										<xsl:value-of select="normalize-space(./text())" />
									</OrderedQty>
									<PackageQty>
										<xsl:value-of select="normalize-space(../PACKITEMS/text())" />
									</PackageQty>
									<xsl:for-each select="../IMPPRODCODE">
										<Product>
											<Code>
												<xsl:value-of select="normalize-space(./text())" />
											</Code>
											<Description>
												<xsl:value-of select="normalize-space(../PRODDESC/text())" />
											</Description>
										</Product>
									</xsl:for-each>
									<UnitPriceRecommended>
										<xsl:value-of select="normalize-space(../UNITPRICE/text())" />
									</UnitPriceRecommended>
									<Volume>
										<xsl:value-of select="normalize-space(../VOLUME/text())" />
									</Volume>
									<Weight>
										<xsl:value-of select="normalize-space(../WEIGHT/text())" />
									</Weight>
									<CustomizedFieldCollection>
										<xsl:for-each select="../SUPPPRODCODE">
											<CustomizedField>
												<Key>
													<xsl:text>SELLER_PID</xsl:text>
												</Key>
												<DataType>
													<xsl:text>String</xsl:text>
												</DataType>
												<Value>
													<xsl:value-of select="normalize-space(./text())" />
												</Value>
											</CustomizedField>
										</xsl:for-each>
										<xsl:for-each select="../SUPPPRODDESC">
											<CustomizedField>
												<Key>
													<xsl:text>SELLER_DESC</xsl:text>
												</Key>
												<DataType>
													<xsl:text>String</xsl:text>
												</DataType>
												<Value>
													<xsl:value-of select="normalize-space(./text())" />
												</Value>
											</CustomizedField>
										</xsl:for-each>
									</CustomizedFieldCollection>
									<AdditionalInformation>
										<xsl:value-of select="concat(normalize-space(../../DEL_ADDR1/text()), ' ', normalize-space(../../DEL_ADDR2/text()), ' ',  normalize-space(../../DEL_ADDR3/text()), ' ', normalize-space(../../DEL_ADDR4/text()), ' ', normalize-space(../../DEL_ADDRCTY/text()))"/>
									</AdditionalInformation>
								</OrderLine>
							</xsl:for-each>
						</xsl:for-each>
					</OrderLineCollection>
				</Order>

				<xsl:choose>
					<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR'">
						<ServiceLevel>
							<Code>DIR</Code>
						</ServiceLevel>
					</xsl:when>
					<xsl:otherwise>
						<ServiceLevel>
							<Code>STD</Code>
						</ServiceLevel>
					</xsl:otherwise>
				</xsl:choose>

				<OrganizationAddressCollection>

					<xsl:choose>
						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'AXFURN'">
							<AddressType>
								<xsl:text>ConsignorDocumentaryAddress</xsl:text>
							</AddressType>
							<Address1>Lot 9633, Jalan Ayer Manis</Address1>
							<Address2>Parit Jawa, 84150</Address2>
							<City/>
							<CompanyName>AX FURNITURE SDN BHD</CompanyName>
							<Contact/>
							<Email>marketing1@axfurniture.com</Email>
							<Fax>00116069868004</Fax>
							<Phone>00116069868007</Phone>
						</xsl:when>
						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'BESTBETECK'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>PTD 10636, JALAN KEMPAS 1</Address1>
								<Address2>KAWASAN PERINDUSTRIAN</Address2>
								<City/>
								<CompanyName>BEST-BETECK FURNITURE SDN BHD</CompanyName>
								<Contact/>
								<Email>marketing2@bestbeteck.com; toh@bestbeteck.com</Email>
								<Fax/>
								<Phone>6069866967</Phone>
							</OrganizationAddress>
						</xsl:when>
						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = ''">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1/>
								<Address2/>
								<City/>
								<CompanyName/>
								<Contact/>
								<Email/>
								<Fax/>
								<Phone/>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'BOAS'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>UNIT A, 16F.,</Address1>
								<Address2>88 COMMERCIAL BUILDING</Address2>
								<City>
								</City>
								<CompanyName>BOAS FURNITURE COMPANY LIMITED</CompanyName>
								<Contact>
								</Contact>
								<Email>owen@boasfurniture.com</Email>
								<Fax>25436637</Fax>
								<Phone>25435013</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'BURDEN'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>Limited</Address1>
								<Address2>Suite 2001 20F</Address2>
								<City>
								</City>
								<CompanyName>Burden Furniture (Inter'nal) L</CompanyName>
								<Contact>
								</Contact>
								<Email>lindsay@burdenfurniture.com</Email>
								<Fax>
								</Fax>
								<Phone>963807107</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'CKBAN'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>No 3799 Mk. 11. Changkat</Address1>
								<Address2>14300 Nibong Tebal.</Address2>
								<City>
								</City>
								<CompanyName>C.K. BAN SOON LEE INDUSTRIES</CompanyName>
								<Contact>
								</Contact>
								<Email>sales@ckbsl.com.my</Email>
								<Fax>00116045822999</Fax>
								<Phone>00116045822111</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'CLEMUSD'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>Unit G63, 63-85 Turner St</Address1>
								<Address2>Port Melbourne</Address2>
								<City>
								</City>
								<CompanyName>Clemenger Inter'nal Freight</CompanyName>
								<Contact>
								</Contact>
								<Email>mpavlakos@cif.com.au</Email>
								<Fax>96819338</Fax>
								<Phone>92059100</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'COMFY'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>LOT 3993 JALAN TEY MIA JEN</Address1>
								<Address2>KG. KEBUN SAYUR BUKIT BAKRI</Address2>
								<City>
								</City>
								<CompanyName>COMFY FACTOR SDN BHD</CompanyName>
								<Contact>
								</Contact>
								<Email>sam@comfyfactor.com</Email>
								<Fax>9868551</Fax>
								<Phone>9866500</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'DCEGLOBAL'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>NO5, 1ST FLOOR, JALAN PUNCAK 2</Address1>
								<Address2>PEKAN PARIT BAKAR, PARIT BAKAR</Address2>
								<City>
								</City>
								<CompanyName>DCE GLOBAL SDN BHD</CompanyName>
								<Contact>
								</Contact>
								<Email>celine@dce-global.com</Email>
								<Fax>9811177</Fax>
								<Phone>9811144</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'EDENLAND'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>EDENLAND ENTERPRISES PTY LTD</Address1>
								<Address2>ROOM 804 SINO CENTRE</Address2>
								<City>
								</City>
								<CompanyName>EDEN LAND ENTERPRISES PTD</CompanyName>
								<Contact>
								</Contact>
								<Email>yokey@edenlandmsia.com</Email>
								<Fax>78740893</Fax>
								<Phone>78740886</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'ELEGANTWOO'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>POS 356 BT 4-1/2 PARIT BAKAR</Address1>
								<Address2>JALAN TEMENGGUNG AHMAD</Address2>
								<City>
								</City>
								<CompanyName>ELEGANT WOOD-LINK SDH BHD</CompanyName>
								<Contact>
								</Contact>
								<Email>celine@dce-global.com</Email>
								<Fax>6069813853</Fax>
								<Phone>6069811328</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'EON'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>SHANGEN INDUSTRILA ESTATE</Address1>
								<Address2>XIQIAO TOWN, NANHAI DISTRICT,</Address2>
								<City>
								</City>
								<CompanyName>EON TECHNOLOGY INDUSTRY CO LTD</CompanyName>
								<Contact>
								</Contact>
								<Email>ivy@jbmfurniture.com</Email>
								<Fax>5781890079</Fax>
								<Phone>5781890078</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'FOSHAN'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>WOODEN PRODUCTS CO., LTD</Address1>
								<Address2>2ND INDUSTRIAL AREA,</Address2>
								<City>
								</City>
								<CompanyName>GUANGDONG SUNTEAM STEEL</CompanyName>
								<Contact>
								</Contact>
								<Email>lindy@sunteam.com.cn</Email>
								<Fax>75728109448</Fax>
								<Phone>75728917601</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'HAINBOYANG'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1> LTD</Address1>
								<Address2>NO 18 ZHIJIANG ROAD</Address2>
								<City>
								</City>
								<CompanyName>HAINING BOYANG FURNITURE CO LT</CompanyName>
								<Contact>
								</Contact>
								<Email>nancy@boyang-furniture.com</Email>
								<Fax>
								</Fax>
								<Phone>057387933009</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'HOMEUP'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>LOT8726, PTD 6023, BATU 8,</Address1>
								<Address2>KAWASAN PERINDUSTRIAN</Address2>
								<City>
								</City>
								<CompanyName>HOME UPHOLSTERY INDUSTRIES SDN</CompanyName>
								<Contact>
								</Contact>
								<Email>swwong@eritz.com.my</Email>
								<Fax>6069860942</Fax>
								<Phone>606986500</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'HUAXIA'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>XIAOFENG TOWN ANJI COUNTY</Address1>
								<Address2>HUZHOU CITY</Address2>
								<City>
								</City>
								<CompanyName>ZHEJIANG HUAXIA BAMBOO and WOOD</CompanyName>
								<Contact>
								</Contact>
								<Email>emily@valkahome.com</Email>
								<Fax>05725515128</Fax>
								<Phone>05725118739</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'INTERMULTI'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>NO 23M JALAN PESERAI PT LAMAN</Address1>
								<Address2>83500 PT SULONG BATU PAHAT</Address2>
								<City>
								</City>
								<CompanyName>INTER MULTI FURNITURE SDN BHD</CompanyName>
								<Contact>
								</Contact>
								<Email>jyin@imf-furniture.com</Email>
								<Fax>6074188833</Fax>
								<Phone>6074188333</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'JIASIN'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>NO.29 CHENJIANG ROAD</Address1>
								<Address2>CHENJIANG TOWN</Address2>
								<City>
								</City>
								<CompanyName>JIASIN FURNISHINGS LIMITED</CompanyName>
								<Contact>
								</Contact>
								<Email>jorgetct@126.com</Email>
								<Fax>
								</Fax>
								<Phone>8613680763616</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'JINHUABOYA'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>(CAREFREE)</Address1>
								<Address2>1399 EAST JINGANG ROAD,</Address2>
								<City>
								</City>
								<CompanyName>JINHUA BOYA FURNITURE CO.LTD.</CompanyName>
								<Contact>
								</Contact>
								<Email>dengjiemax@126.com</Email>
								<Fax>
								</Fax>
								<Phone>57982928688</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'KASEN'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>FLAT 03H, 15F, CARNIVAL COMM</Address1>
								<Address2>BUILDING 18 JAVA ROAD</Address2>
								<City>
								</City>
								<CompanyName>KASEN INDUSTRIAL(HK) LIMITED</CompanyName>
								<Contact>
								</Contact>
								<Email>13656627999@139.com</Email>
								<Fax>25089598</Fax>
								<Phone>28875858</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'KUKA'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>Factory Adds:113-11th Street,</Address1>
								<Address2>Xiasha District, Hangzhou,</Address2>
								<City>
								</City>
								<CompanyName>KUKA(HK) TRADE CO.,LIMITED</CompanyName>
								<Contact>
								</Contact>
								<Email>potter@kukahome.com</Email>
								<Fax>57185044502</Fax>
								<Phone>57185146199</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'LBFURN'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>LOT PTD 5998</Address1>
								<Address2>KAWASAN PERINDUSTRIAN BKT</Address2>
								<City>
								</City>
								<CompanyName>LB FURNITURE SDN BHD</CompanyName>
								<Contact>
								</Contact>
								<Email>jennifer@lbfurniture.com</Email>
								<Fax>6069865522</Fax>
								<Phone>6069865500</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'LIVINGWORL'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>PTD 5286 JBB 11 BATU 7 1/2</Address1>
								<Address2>JALAN BAKRI 84200</Address2>
								<City>
								</City>
								<CompanyName>LIVING WORLD (M) SDN BHD</CompanyName>
								<Contact>
								</Contact>
								<Email>lesley@livingworld.com.my</Email>
								<Fax>6069860337</Fax>
								<Phone>6069860335</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'MAGMA'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>21F, YUE THAI COMMERCIAL BLD</Address1>
								<Address2>128 CONNAUGHT ROAD</Address2>
								<City>
								</City>
								<CompanyName>MAGMA LIMITED</CompanyName>
								<Contact>
								</Contact>
								<Email>msisovic@woodnet-ltd.net</Email>
								<Fax>54135218</Fax>
								<Phone>54135157</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'MASTER'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>LOT 2325, JALAN SUGAI BURUNG</Address1>
								<Address2>81500 PEKAN NENAS , PONTIAN</Address2>
								<City>
								</City>
								<CompanyName>MASTER SOFA INDUSTRIES SDN.BHD</CompanyName>
								<Contact>
								</Contact>
								<Email>customerservice2@mastersofa.</Email>
								<Fax>76992688</Fax>
								<Phone>76991999</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'MMML'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>3RD FLOOR, OMAR HODGE BUILDING</Address1>
								<Address2>WICKHAMS CAYI</Address2>
								<City>
								</City>
								<CompanyName>MORROW MARKETING MANAGEMENT</CompanyName>
								<Contact>
								</Contact>
								<Email>craig@mmml.com</Email>
								<Fax>
								</Fax>
								<Phone>
								</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'PHAMNHATA'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>NO 57, 14 THIEN TAN STREET</Address1>
								<Address2>BLOCK 4, TAN HOA WARD</Address2>
								<City>
								</City>
								<CompanyName>PHAM NHAT ANH CO., LTD</CompanyName>
								<Contact>
								</Contact>
								<Email>phamnhatanh.furniture@gmail.</Email>
								<Fax>2513983926</Fax>
								<Phone>2513983989</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SIGGSHOME'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>LOT 5003 A, JALAN AIK HWA 19</Address1>
								<Address2>BUKIT BAKRI 84200 MUAR</Address2>
								<City>
								</City>
								<CompanyName>SIGGS HOME MANUFACTURING SDN</CompanyName>
								<Contact>
								</Contact>
								<Email>info@siggshome.com</Email>
								<Fax>6069869273</Fax>
								<Phone>6069867273</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SILVER'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>MANUFACTURE LTD</Address1>
								<Address2>YANCHENG INDUSTRIAL ZONE</Address2>
								<City>
								</City>
								<CompanyName>SILVER BEAUTY HOME DECORS MANU</CompanyName>
								<Contact>
								</Contact>
								<Email>sales1@silverbeauty.com.cn</Email>
								<Fax>00867526577730</Fax>
								<Phone>00867526577733</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SKYINTL'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>No.2 MIDDLE GONGYE DADAO</Address1>
								<Address2>LONGSHAN INDUSTRY ZONE,</Address2>
								<City>
								</City>
								<CompanyName>SKY INTERNATIONAL GROUP LTD.</CompanyName>
								<Contact>
								</Contact>
								<Email>ceo@skyintlgroup.com.cn</Email>
								<Fax>
								</Fax>
								<Phone>7565813666</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SKYLINE'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>NO 263 BEIYUAN ROAD</Address1>
								<Address2>KUNSHAN, JIANGSU 215345</Address2>
								<City>
								</City>
								<CompanyName>KUNSHAN SKYLINE INTERNATIONAL</CompanyName>
								<Contact>
								</Contact>
								<Email>nicky@skylinefurn.com</Email>
								<Fax>
								</Fax>
								<Phone>8651250130304</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SOFAX'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>No.800 Shuangbai Road</Address1>
								<Address2>Shanghai 201100</Address2>
								<City>
								</City>
								<CompanyName>Sofax Shanghai Co Ltd</CompanyName>
								<Contact>
								</Contact>
								<Email>allan@sofax.com.cn</Email>
								<Fax>862164341905</Fax>
								<Phone>862164342166</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'SUZHOUGX'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>NO. 100 FADA ROAD</Address1>
								<Address2>BANQIAO DEVELOPMENT AREA,</Address2>
								<City>
								</City>
								<CompanyName>TAICANG KANGLE SOFA and FURN</CompanyName>
								<Contact>
								</Contact>
								<Email>binder@kangle-sofa.com</Email>
								<Fax>51253440738</Fax>
								<Phone>51281601081</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'TOPGARD'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>PT MLO 2322 JALEN AYER MANIS</Address1>
								<Address2>MUKIM PARIT JAWA</Address2>
								<City>
								</City>
								<CompanyName>TOPGARD RESOURCES SDN BHD</CompanyName>
								<Contact>
								</Contact>
								<Email>csyap@topgardresources.com</Email>
								<Fax>
								</Fax>
								<Phone>00116069863313</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'VANSENINT'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>33 JIASHAN AVENUE</Address1>
								<Address2>JIASHAN COUNTY</Address2>
								<City>
								</City>
								<CompanyName>ZHEJIANG VANSEN INTELLIGENT FU</CompanyName>
								<Contact>
								</Contact>
								<Email>joyxue@vansen.net.cn</Email>
								<Fax>57384669898</Fax>
								<Phone>573-84018078</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'VEKENOJINT'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>TRADE CO..LTD</Address1>
								<Address2>ROOM 1309 PIAOYING CENTURY</Address2>
								<City>
								</City>
								<CompanyName>SHANGHAI O-J INTERNATIONAL</CompanyName>
								<Contact>
								</Contact>
								<Email>lucky-dragon@vip.163.com</Email>
								<Fax>
								</Fax>
								<Phone>862165159604</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WHITEFEAV'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>L-1-CN, ROAD DA3/NA7</Address1>
								<Address2>MY PHUOC INDUSTRIAL PARK</Address2>
								<City>
								</City>
								<CompanyName>WHITE FEATHER INTERNATIONAL CO</CompanyName>
								<Contact>
								</Contact>
								<Email>sharonkoh@whitefeathers.com.</Email>
								<Fax>
								</Fax>
								<Phone>40650553933</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODCONAK'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>TAN PHUOC KHANH TOWN</Address1>
								<Address2>TAN UYEN DISTRICT</Address2>
								<City>
								</City>
								<CompanyName>AN KHANG CO LTD.,</CompanyName>
								<Contact>
								</Contact>
								<Email>SALES@ANKHANGWOOD.COM</Email>
								<Fax>
								</Fax>
								<Phone>842743615491</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODCONLT'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>BINH CHANH WARD</Address1>
								<Address2>KHANH BINH PRE</Address2>
								<City>
								</City>
								<CompanyName>LUC THIEN PHU J.S. CO</CompanyName>
								<Contact>
								</Contact>
								<Email>lethienphu9999@gmail.com</Email>
								<Fax>
								</Fax>
								<Phone>0914148698</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODHK'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>21F, YUE THAI COMMERCIAL BUIL</Address1>
								<Address2>128 CONNAUGHT ROAD</Address2>
								<City>
								</City>
								<CompanyName>WOODNET LIMITED</CompanyName>
								<Contact>
								</Contact>
								<Email>msisovic@woodnet-ltd.net</Email>
								<Fax>62811496</Fax>
								<Phone>66848260</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNET'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>WOODNET LIMITED HCMC (FACTORY)</Address1>
								<Address2>RM101 SOUTHERN CROSS SKY VIEW</Address2>
								<City>
								</City>
								<CompanyName>LE HOANG MINH CO. LTD</CompanyName>
								<Contact>
								</Contact>
								<Email>woodnet1@woodnet-ltd.net</Email>
								<Fax>54135218</Fax>
								<Phone>54135157</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETCL'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>343 TRAN KHAT CHAN STREET</Address1>
								<Address2>THANH NHAN WARD</Address2>
								<City>
								</City>
								<CompanyName>CUU LONG JOINT STOCK COMPANY</CompanyName>
								<Contact>
								</Contact>
								<Email>woodnet1@woodnet-ltd.net</Email>
								<Fax>988465789</Fax>
								<Phone>439722227</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETDOH'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>LY THUONG KIET ST-DI AN WARD</Address1>
								<Address2>BINH DUONG PROVINCE</Address2>
								<City>
								</City>
								<CompanyName>DONG HOA WOOD PROCESS. CO.,LTD</CompanyName>
								<Contact>
								</Contact>
								<Email>admin@rbcdonghoa.vn</Email>
								<Fax>
								</Fax>
								<Phone>6503734363</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETDU'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>NO.12,27A STREET</Address1>
								<Address2>PHUOC LONG B WARD</Address2>
								<City>
								</City>
								<CompanyName>DAI THUAN FURNITURE COMPANY</CompanyName>
								<Contact>
								</Contact>
								<Email>info@daifuco.vn</Email>
								<Fax>02516280307</Fax>
								<Phone>02516280309</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETEW'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>TAN PHUOC KHANNH TAN UYEN</Address1>
								<Address2>BINH DUONG VIET NAM</Address2>
								<City>
								</City>
								<CompanyName>EASTWESTFURN LTD</CompanyName>
								<Contact>
								</Contact>
								<Email>woodnet1@woodnet-ltd.net</Email>
								<Fax>
								</Fax>
								<Phone>846503612723</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETGM'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>Hamlet 1B, An Phu Ward</Address1>
								<Address2>Thuan An District</Address2>
								<City>
								</City>
								<CompanyName>GIANG MINH CO.,LTD</CompanyName>
								<Contact>
								</Contact>
								<Email>woodnet1@woodnet-ltd.net</Email>
								<Fax>
								</Fax>
								<Phone>8406503713172</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETHT'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>LOT A1-A4</Address1>
								<Address2>NORTHEAST SONG CAU INDUSTRIAL</Address2>
								<City>
								</City>
								<CompanyName>THAI THINH COMPANY LTD</CompanyName>
								<Contact>
								</Contact>
								<Email>woodnet1@woodnet-ltd.net</Email>
								<Fax>001108457372115</Fax>
								<Phone>001108457372117</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETHU'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>KM20 - HIGHWAY 19 -</Address1>
								<Address2>NHON HOA WARD, AN NHON TOWN</Address2>
								<City>
								</City>
								<CompanyName>HUU THINH PRODUCTION and TRADING</CompanyName>
								<Contact>
								</Contact>
								<Email>woodnet1@woodnet-ltd.net</Email>
								<Fax>563838704</Fax>
								<Phone>563838547</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETTHA'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>59D/1 AN PHU WARD</Address1>
								<Address2>THUAN AN TOWN</Address2>
								<City>
								</City>
								<CompanyName>THINH AN WOOD LTD</CompanyName>
								<Contact>
								</Contact>
								<Email>woodnet1@woodnet-ltd.net</Email>
								<Fax>
								</Fax>
								<Phone>06503777924</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETVB'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>Lot C2, Street N4,</Address1>
								<Address2>Nam Tan Uyen IZ</Address2>
								<City>
								</City>
								<CompanyName>VIETBOARD JOINT STOCK COMPANY</CompanyName>
								<Contact>
								</Contact>
								<Email>woodnet1@woodnet-ltd.net</Email>
								<Fax>6503652960</Fax>
								<Phone>6503652887</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETVI'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>G.5, Binh Khanh</Address1>
								<Address2>Khanh Binh</Address2>
								<City>
								</City>
								<CompanyName>VIENA HANDICRAFT CO.LTD.</CompanyName>
								<Contact>
								</Contact>
								<Email>vienaco@gmail.com</Email>
								<Fax>2743652744</Fax>
								<Phone>2743652744</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'WOODNETVN'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>60/8 ROAD 18, HIEP BINH CHANH</Address1>
								<Address2>THU DUC DIS HCM CITY</Address2>
								<City>
								</City>
								<CompanyName>VIETNAM CONNECTION CO. LTD</CompanyName>
								<Contact>
								</Contact>
								<Email>woodnet1@woodnet-ltd.net</Email>
								<Fax>837263110</Fax>
								<Phone>83726310405</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'XINHE'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>LOT 3951 LORONG PAYA</Address1>
								<Address2>JALAN KEBUN SAYUR</Address2>
								<City>
								</City>
								<CompanyName>XINHE FURNITURE INDUSTRIES SDN</CompanyName>
								<Contact>
								</Contact>
								<Email>ivy@xinhefurniture.com</Email>
								<Fax>175342220</Fax>
								<Phone>195950222</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'XINYUAN'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>GUGAO ROAD</Address1>
								<Address2>AGRICULTURAL PRODUCT</Address2>
								<City>
								</City>
								<CompanyName>TAIZHOU XINYUAN FURNITURE CO</CompanyName>
								<Contact>
								</Contact>
								<Email>justin@tz-xinyuan.com</Email>
								<Fax>
								</Fax>
								<Phone>52387499886</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'YEWH'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>LOT 1950 BATU 1 1/2</Address1>
								<Address2>JALAN BANGI 43500</Address2>
								<City>
								</City>
								<CompanyName>YEW HOONG SOFA PRODUCTS (M)</CompanyName>
								<Contact>
								</Contact>
								<Email>marketing@hugosofa.com</Email>
								<Fax>60387249890</Fax>
								<Phone>60387235676</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'ZAGOLEBET'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>HO CHI MINH</Address1>
								<Address2>PRO-LIVING ASIA</Address2>
								<City>
								</City>
								<CompanyName>ZAGO'S STUDIO LE BETON FACTORY</CompanyName>
								<Contact>
								</Contact>
								<Email>nhon.nguyen@pro-living.asia</Email>
								<Fax>
								</Fax>
								<Phone>+06503639162</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/VENDCODE/text()) = 'ZHEJ HAPPY'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>NO.100 LONGXING ROAD</Address1>
								<Address2>HAINING, ZHEJIANG</Address2>
								<City>
								</City>
								<CompanyName>ZHEJIANG HAPPY FURNISHINGS CO</CompanyName>
								<Contact>
								</Contact>
								<Email>happyleather_03@ounoya.com</Email>
								<Fax>57387800118</Fax>
								<Phone>57387501620</Phone>
							</OrganizationAddress>
						</xsl:when>

						<xsl:otherwise>
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsignorDocumentaryAddress</xsl:text>
								</AddressType>
								<Address1>
									<xsl:value-of select="normalize-space(POHEADER/VEND_ADDR2/text())" />
								</Address1>
								<Address2>
									<xsl:value-of select="normalize-space(POHEADER/VEND_ADDR3/text())" />
								</Address2>
								<City>
									<xsl:value-of select="normalize-space(POHEADER/VEND_ADDRCTY/text())" />
								</City>
								<CompanyName>
									<xsl:value-of select="normalize-space(POHEADER/VEND_ADDR1/text())" />
								</CompanyName>
								<Contact>
									<xsl:value-of select="normalize-space(POHEADER/VEND_CONTACT/text())" />
								</Contact>
								<Email>
									<xsl:value-of select="normalize-space(POHEADER/VEND_EMAIL/text())" />
								</Email>
								<Fax>
									<xsl:value-of select="normalize-space(POHEADER/VEND_FAX/text())" />
								</Fax>
								<Phone>
									<xsl:value-of select="normalize-space(POHEADER/VEND_PHONE/text())" />
								</Phone>
							</OrganizationAddress>  
						</xsl:otherwise>
					</xsl:choose>

					<xsl:choose>
						<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'BAYS'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<AddressShortCode>BAYS</AddressShortCode>
								<Address1>80 Hartnett Dve</Address1>
								<Address2>Seaford</Address2>
								<City>Seaford</City>
								<CompanyName>Bayside Seaford</CompanyName>
								<Contact/>
								<Email/>
								<Fax/>
								<Phone/>
								<State>VIC</State>
								<Postcode>3198</Postcode>
								<Port>
									<Code>AUMEL</Code>
								</Port>
								<Country>
									<Code>AU</Code>
								</Country>
							</OrganizationAddress>		  
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<AddressShortCode>BAYS</AddressShortCode>
								<Address1>80 Hartnett Dve</Address1>
								<Address2>Seaford</Address2>
								<City>Seaford</City>
								<CompanyName>Bayside Seaford</CompanyName>
								<Contact/>
								<Email/>
								<Fax/>
								<Phone/>
								<State>VIC</State>
								<Postcode>3198</Postcode>
								<Port>
									<Code>AUMEL</Code>
								</Port>
								<Country>
									<Code>AU</Code>
								</Country>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'NSW'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<AddressShortCode>NSW</AddressShortCode>
								<Address1>1-5 Manchester Rd</Address1>
								<Address2>Auburn</Address2>
								<City>Auburn</City>
								<CompanyName>NSW</CompanyName>
								<Contact/>
								<Email/>
								<Fax/>
								<Phone/>
								<State>NSW</State>
								<Postcode>2144</Postcode>
								<Country>
									<Code>AU</Code>
								</Country>
								<Port>
									<Code>AUSYD</Code>
								</Port>
							</OrganizationAddress>		  
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<AddressShortCode>NSW</AddressShortCode>
								<Address1>1-5 Manchester Rd</Address1>
								<Address2>Auburn</Address2>
								<City>Auburn</City>
								<CompanyName>NSW</CompanyName>
								<Contact/>
								<Email/>
								<Fax/>
								<Phone/>
								<State>NSW</State>
								<Postcode>2144</Postcode>
								<Country>
									<Code>AU</Code>
								</Country>
								<Port>
									<Code>AUSYD</Code>
								</Port>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'QLD'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<AddressShortCode>QLD</AddressShortCode>
								<Address1>Dixie Cummings QLD</Address1>
								<Address2>4 / 231 Holt St</Address2>
								<City>Pinkenba</City>
								<CompanyName>QLD</CompanyName>
								<Contact/>
								<Email/>
								<Fax/>
								<Phone/>
								<State>QLD</State>
								<Postcode>4009</Postcode>
								<Country>
									<Code>AU</Code>
								</Country>
								<Port>
									<Code>AUBNE</Code>
								</Port>
							</OrganizationAddress>		  
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<AddressShortCode>QLD</AddressShortCode>
								<Address1>Dixie Cummings QLD</Address1>
								<Address2>4 / 231 Holt St</Address2>
								<City>Pinkenba</City>
								<CompanyName>QLD</CompanyName>
								<Contact/>
								<Email/>
								<Fax/>
								<Phone/>
								<State>QLD</State>
								<Postcode>4009</Postcode>
								<Country>
									<Code>AU</Code>
								</Country>
								<Port>
									<Code>AUBNE</Code>
								</Port>
							</OrganizationAddress>
						</xsl:when>

						<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'WA'">
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<AddressShortCode>WA</AddressShortCode>
								<Address1>6 Carousel Road</Address1>
								<Address2>Cannington</Address2>
								<City>Cannington</City>
								<CompanyName>WA Warehouse</CompanyName>
								<Contact/>
								<Email/>
								<Fax/>
								<Phone/>
								<State>WA</State>
								<Postcode>6107</Postcode>
								<Country>
									<Code>AU</Code>
								</Country>
								<Port>
									<Code>AUFRE</Code>
								</Port>
							</OrganizationAddress>		  
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<AddressShortCode>WA</AddressShortCode>
								<Address1>6 Carousel Road</Address1>
								<Address2>Cannington</Address2>
								<City>Cannington</City>
								<CompanyName>WA Warehouse</CompanyName>
								<Contact/>
								<Email/>
								<Fax/>
								<Phone/>
								<State>WA</State>
								<Postcode>6107</Postcode>
								<Country>
									<Code>AU</Code>
								</Country>
								<Port>
									<Code>AUFRE</Code>
								</Port>
							</OrganizationAddress>
						</xsl:when>

						<xsl:otherwise>
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneePickupDeliveryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<xsl:choose>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'H/Norman Springvale'">
										<AddressShortCode>HN Springvale</AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Furniture Bazaar'">
										<AddressShortCode>FURNITURE BAZAAR</AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Auburn Furniture'">
										<AddressShortCode>HN AUBURN</AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Noarlunga Furniture'">
										<AddressShortCode>HN NOARLUNGA</AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Warehouse F/ston'">
										<AddressShortCode>HN FRANKSTON</AddressShortCode>
									</xsl:when>
									<xsl:otherwise>
										<AddressShortCode>
											<xsl:value-of select="normalize-space(POHEADER/DELCUST/text())" />
										</AddressShortCode>
									</xsl:otherwise>
								</xsl:choose>
								<!-- <Address1> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR2/text())" /> -->
								<!-- </Address1> -->
								<!-- <Address2> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR3/text())" /> -->
								<!-- </Address2> -->
								<!-- <City> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDRCTY/text())" /> -->
								<!-- </City> -->
								<!-- <CompanyName> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR1/text())" /> -->
								<!-- </CompanyName> -->
								<!-- <Contact> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_CONTACT/text())" /> -->
								<!-- </Contact> -->
								<!-- <Email> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_EMAIL/text())" /> -->
								<!-- </Email> -->
								<!-- <Fax> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_FAX/text())" /> -->
								<!-- </Fax> -->
								<!-- <Phone> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_PHONE/text())" /> -->
								<!-- </Phone> -->
							</OrganizationAddress>		  
							<OrganizationAddress>
								<AddressType>
									<xsl:text>ConsigneeDocumentaryAddress</xsl:text>
								</AddressType>
								<OrganizationCode>DIXIEC_AU</OrganizationCode>
								<xsl:choose>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'H/Norman Springvale'">
										<AddressShortCode>HN Springvale</AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Furniture Bazaar'">
										<AddressShortCode>FURNITURE BAZAAR</AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Auburn Furniture'">
										<AddressShortCode>HN AUBURN</AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Noarlunga Furniture'">
										<AddressShortCode>HN NOARLUNGA</AddressShortCode>
									</xsl:when>
									<xsl:when test="normalize-space(POHEADER/DEL_WHCODE/text()) = 'DIR' and normalize-space(POHEADER/DEL_ADDR1/text()) = 'Harvey Norman Warehouse F/ston'">
										<AddressShortCode>HN FRANKSTON</AddressShortCode>
									</xsl:when>
									<xsl:otherwise>
										<AddressShortCode>
											<xsl:value-of select="normalize-space(POHEADER/DELCUST/text())" />
										</AddressShortCode>
									</xsl:otherwise>
								</xsl:choose>
								<!-- <Address1> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR2/text())" /> -->
								<!-- </Address1> -->
								<!-- <Address2> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR3/text())" /> -->
								<!-- </Address2> -->
								<!-- <City> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDRCTY/text())" /> -->
								<!-- </City> -->
								<!-- <CompanyName> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_ADDR1/text())" /> -->
								<!-- </CompanyName> -->
								<!-- <Contact> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_CONTACT/text())" /> -->
								<!-- </Contact> -->
								<!-- <Email> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_EMAIL/text())" /> -->
								<!-- </Email> -->
								<!-- <Fax> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_FAX/text())" /> -->
								<!-- </Fax> -->
								<!-- <Phone> -->
								<!-- <xsl:value-of select="normalize-space(POHEADER/DEL_PHONE/text())" /> -->
								<!-- </Phone> -->
							</OrganizationAddress>
						</xsl:otherwise>
					</xsl:choose>  

				</OrganizationAddressCollection>
			</Shipment>
		</UniversalShipment>
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
