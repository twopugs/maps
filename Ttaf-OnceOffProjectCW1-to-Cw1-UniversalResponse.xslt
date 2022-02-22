<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalResponse" />
  </xsl:template>
  <xsl:template match="/s0:UniversalResponse">
	<!--	<UniversalResponse version="1.1" xmlns="http://www.cargowise.com/Schemas/Universal/2011/11">
		
			<Status>
				<xsl:value-of select="s0:Status"/>
			</Status>
			<Data>-->
			<Native xmlns="http://www.cargowise.com/Schemas/Native/2011/11">
			 <Body>
				<Product>
					<OrgSupplierPart>
						<PK>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:PK"/>
						</PK>
						<IsActive>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:IsActive"/>
						</IsActive>
						<IsWarehouseProduct>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:IsWarehouseProduct"/>
						</IsWarehouseProduct>
						<PartNum>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:PartNum"/>
						</PartNum>
						<Desc>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Desc"/>
						</Desc>
						<StockKeepingUnit>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:StockKeepingUnit"/>
						</StockKeepingUnit>
						<CountDecimalPlaces>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CountDecimalPlaces"/>
						</CountDecimalPlaces>
						<StockTakeCycle>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:StockTakeCycle"/>
						</StockTakeCycle>
						<IsResource>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:IsResource"/>
						</IsResource>
						<Weight>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Weight"/>
						</Weight>
						<NetWeight>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:NetWeight"/>
						</NetWeight>
						<WeightUQ>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:WeightUQ"/>
						</WeightUQ>
						<Cubic>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Cubic"/>
						</Cubic>
						<CubicUQ>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CubicUQ"/>
						</CubicUQ>
						<Depth>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Depth"/>
						</Depth>
						<Height>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Height"/>
						</Height>
						<Width>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Width"/>
						</Width>
						<MeasureUQ>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:MeasureUQ"/>
						</MeasureUQ>
						<LastCost>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:LastCost"/>
						</LastCost>
						<WeightedCost>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:WeightedCost"/>
						</WeightedCost>
						<QtyInStock>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:QtyInStock"/>
						</QtyInStock>
						<VendorPackQty>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:VendorPackQty"/>
						</VendorPackQty>
						<VPReorderMinimum>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:VPReorderMinimum"/>
						</VPReorderMinimum>
						<VPReorderMaximum>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:VPReorderMaximum"/>
						</VPReorderMaximum>
						<OrderMultipleQty>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:OrderMultipleQty"/>
						</OrderMultipleQty>
						<OrderMultipleUnit>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:OrderMultipleUnit"/>
						</OrderMultipleUnit>
						<AutoPrintAssemblyInstructions>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:AutoPrintAssemblyInstructions"/>
						</AutoPrintAssemblyInstructions>
						<CanDisassembleKit>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CanDisassembleKit"/>
						</CanDisassembleKit>
						<CanResell>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CanResell"/>
						</CanResell>
						<Division>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Division"/>
						</Division>
						<Department>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Department"/>
						</Department>
						<CustomDecimal1>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDecimal1"/>
						</CustomDecimal1>
						<CustomDecimal2>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDecimal2"/>
						</CustomDecimal2>
						<CustomDecimal3>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDecimal3"/>
						</CustomDecimal3>
						<CustomDecimal4>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDecimal4"/>
						</CustomDecimal4>
						<CustomDecimal5>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDecimal5"/>
						</CustomDecimal5>
						<CustomAttrib1>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomAttrib1"/>
						</CustomAttrib1>
						<CustomAttrib2>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomAttrib2"/>
						</CustomAttrib2>
						<CustomAttrib3>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomAttrib3"/>
						</CustomAttrib3>
						<CustomAttrib4>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomAttrib4"/>
						</CustomAttrib4>
						<CustomAttrib5>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomAttrib5"/>
						</CustomAttrib5>
						<CustomFlag1>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomFlag1"/>
						</CustomFlag1>
						<CustomFlag2>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomFlag2"/>
						</CustomFlag2>
						<CustomFlag3>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomFlag3"/>
						</CustomFlag3>
						<CustomFlag4>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomFlag4"/>
						</CustomFlag4>
						<CustomFlag5>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomFlag5"/>
						</CustomFlag5>
						<CustomDate1>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDate1"/>
						</CustomDate1>
						<CustomDate2>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDate2"/>
						</CustomDate2>
						<CustomDate3>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDate3"/>
						</CustomDate3>
						<CustomDate4>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDate4"/>
						</CustomDate4>
						<CustomDate5>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CustomDate5"/>
						</CustomDate5>
						<IsBarcoded>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:IsBarcoded"/>
						</IsBarcoded>
						<IsComponentPickedOnSalesOrder>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:IsComponentPickedOnSalesOrder"/>
						</IsComponentPickedOnSalesOrder>
						<KitIsAutoReplenished>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:KitIsAutoReplenished"/>
						</KitIsAutoReplenished>
						<Brand>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Brand"/>
						</Brand>
						<Model>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:Model"/>
						</Model>
						<KeepUpright>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:KeepUpright"/>
						</KeepUpright>
						<UnitsPerPallet>
							<xsl:value-of select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:UnitsPerPallet"/>
						</UnitsPerPallet>
						
						<CusClassPartPivotCollection>
						
						<xsl:for-each select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CusClassPartPivotCollection/s0:CusClassPartPivot[s0:ChildType='HTB']">
							<HTBEXIST>
								<xsl:value-of select="string('True')"/>
							</HTBEXIST>
						</xsl:for-each>
						
							<xsl:for-each select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:CusClassPartPivotCollection/s0:CusClassPartPivot">
								<xsl:variable name='ChildType' select="s0:ChildType"/>
								
								<xsl:if test="s0:ChildType = ''">
									<CusClassPartPivot Action="BLANKDELETE">
												<PK>
													<xsl:value-of select="s0:PK"/>
												</PK>
												<TariffNum>
													<xsl:value-of select="s0:TariffNum"/>
												</TariffNum>
												<xsl:if test="s0:AddInfoCollection != ''">
													<AddInfoCollection>
														<AddInfo>
															<Key>
																<xsl:value-of select="s0:AddInfoCollection/s0:AddInfo/s0:Key"/>
															</Key>
															<Value>
																<xsl:value-of select="s0:AddInfoCollection/s0:AddInfo/s0:Value"/>
															</Value>
														</AddInfo>
													</AddInfoCollection>
												</xsl:if>
												<SupplementalTariff>
													<xsl:value-of select="s0:SupplementalTariff"/>
												</SupplementalTariff>
												<ChildType>
													<xsl:value-of select="s0:ChildType"/>
												</ChildType>
												<ChildQtyType>
													<xsl:value-of select="s0:ChildQtyType"/>
												</ChildQtyType>
												<ChildQty>
													<xsl:value-of select="s0:ChildQty"/>
												</ChildQty>
												<ChildListOrder>
													<xsl:value-of select="s0:ChildListOrder"/>
												</ChildListOrder>
												<TariffChangePending>
													<xsl:value-of select="s0:TariffChangePending"/>
												</TariffChangePending>
												<LastAuditedUser>
													<xsl:value-of select="s0:LastAuditedUser"/>
												</LastAuditedUser>
												<LastAuditedDate>
													<xsl:value-of select="s0:LastAuditedDate"/>
												</LastAuditedDate>
												<DateStart>
													<xsl:value-of select="s0:DateStart"/>
												</DateStart>
												<DateEnd>
													<xsl:value-of select="s0:DateEnd"/>
												</DateEnd>
												<ConcessionOrder>
													<xsl:value-of select="s0:ConcessionOrder"/>
												</ConcessionOrder>
												<PrimaryPreference>
													<xsl:value-of select="s0:PrimaryPreference"/>
												</PrimaryPreference>
												<RelatedIndicator>
													<xsl:value-of select="s0:RelatedIndicator"/>
												</RelatedIndicator>
												<SecondaryPreference>
													<xsl:value-of select="s0:SecondaryPreference"/>
												</SecondaryPreference>
												<ValuationCode>
													<xsl:value-of select="s0:ValuationCode"/>
												</ValuationCode>
												<ValuationMarkup>
													<xsl:value-of select="s0:ValuationMarkup"/>
												</ValuationMarkup>
												<UsageComment>
													<xsl:value-of select="s0:UsageComment"/>
												</UsageComment>
												<NAddInfo>
													<xsl:value-of select="s0:NAddInfo"/>
												</NAddInfo>
												<NDescription>
													<xsl:value-of select="s0:NDescription"/>
												</NDescription>
												<Description>
													<xsl:value-of select="s0:Description"/>
												</Description>
												<PartPivotUOM>
													<xsl:value-of select="s0:PartPivotUOM"/>
												</PartPivotUOM>
												<OrgHeader />
												<Country TableName="RefCountry">
													<Code>
														<xsl:value-of select="s0:Country/s0:Code"/>
													</Code>
													<PK>
														<xsl:value-of select="s0:Country/s0:PK"/>
													</PK>
												</Country>
											    <CusClassification />
											    <CountryOfExport TableName="RefCountry" />
												<CountryOfOrigin TableName="RefCountry" />
												<OriginState TableName="RefCountryStates" />
												 <TaxType TableName="RefDbEntZZ_RefCusTaxOrFee" />
											</CusClassPartPivot>
								</xsl:if>
								
								<xsl:if test="s0:ChildType != ''">
									<xsl:choose>
									
										<xsl:when test="$ChildType = 'HTI'"> 
											<CusClassPartPivot Action="DELETE">
												<PK>
													<xsl:value-of select="s0:PK"/>
												</PK>
												<TariffNum>
													<xsl:value-of select="s0:TariffNum"/>
												</TariffNum>
												<xsl:if test="s0:AddInfoCollection != ''">
													<AddInfoCollection>
														<AddInfo>
															<Key>
																<xsl:value-of select="s0:AddInfoCollection/s0:AddInfo/s0:Key"/>
															</Key>
															<Value>
																<xsl:value-of select="s0:AddInfoCollection/s0:AddInfo/s0:Value"/>
															</Value>
														</AddInfo>
													</AddInfoCollection>
												</xsl:if>
												<SupplementalTariff>
													<xsl:value-of select="s0:SupplementalTariff"/>
												</SupplementalTariff>
												<ChildType>
													<xsl:value-of select="s0:ChildType"/>
												</ChildType>
												<ChildQtyType>
													<xsl:value-of select="s0:ChildQtyType"/>
												</ChildQtyType>
												<ChildQty>
													<xsl:value-of select="s0:ChildQty"/>
												</ChildQty>
												<ChildListOrder>
													<xsl:value-of select="s0:ChildListOrder"/>
												</ChildListOrder>
												<TariffChangePending>
													<xsl:value-of select="s0:TariffChangePending"/>
												</TariffChangePending>
												<LastAuditedUser>
													<xsl:value-of select="s0:LastAuditedUser"/>
												</LastAuditedUser>
												<LastAuditedDate>
													<xsl:value-of select="s0:LastAuditedDate"/>
												</LastAuditedDate>
												<DateStart>
													<xsl:value-of select="s0:DateStart"/>
												</DateStart>
												<DateEnd>
													<xsl:value-of select="s0:DateEnd"/>
												</DateEnd>
												<ConcessionOrder>
													<xsl:value-of select="s0:ConcessionOrder"/>
												</ConcessionOrder>
												<PrimaryPreference>
													<xsl:value-of select="s0:PrimaryPreference"/>
												</PrimaryPreference>
												<RelatedIndicator>
													<xsl:value-of select="s0:RelatedIndicator"/>
												</RelatedIndicator>
												<SecondaryPreference>
													<xsl:value-of select="s0:SecondaryPreference"/>
												</SecondaryPreference>
												<ValuationCode>
													<xsl:value-of select="s0:ValuationCode"/>
												</ValuationCode>
												<ValuationMarkup>
													<xsl:value-of select="s0:ValuationMarkup"/>
												</ValuationMarkup>
												<UsageComment>
													<xsl:value-of select="s0:UsageComment"/>
												</UsageComment>
												<NAddInfo>
													<xsl:value-of select="s0:NAddInfo"/>
												</NAddInfo>
												<NDescription>
													<xsl:value-of select="s0:NDescription"/>
												</NDescription>
												<Description>
													<xsl:value-of select="s0:Description"/>
												</Description>
												<PartPivotUOM>
													<xsl:value-of select="s0:PartPivotUOM"/>
												</PartPivotUOM>
												<OrgHeader />
												<Country TableName="RefCountry">
													<Code>
														<xsl:value-of select="s0:Country/s0:Code"/>
													</Code>
													<PK>
														<xsl:value-of select="s0:Country/s0:PK"/>
													</PK>
												</Country>
											    <CusClassification />
											    <CountryOfExport TableName="RefCountry" />
												<CountryOfOrigin TableName="RefCountry" />
												<OriginState TableName="RefCountryStates" />
												 <TaxType TableName="RefDbEntZZ_RefCusTaxOrFee" />
											</CusClassPartPivot>
										</xsl:when>
										
										<xsl:when test="$ChildType = 'HTB'"> 
											<CusClassPartPivot Action="MERGE">
												<PK>
													<xsl:value-of select="s0:PK"/>
												</PK>
												<TariffNum>
													<xsl:value-of select="s0:TariffNum"/>
												</TariffNum>
												<xsl:if test="s0:AddInfoCollection != ''">
													<AddInfoCollection>
														<AddInfo>
															<Key>
																<xsl:value-of select="s0:AddInfoCollection/s0:AddInfo/s0:Key"/>
															</Key>
															<Value>
																<xsl:value-of select="s0:AddInfoCollection/s0:AddInfo/s0:Value"/>
															</Value>
														</AddInfo>
													</AddInfoCollection>
												</xsl:if>
												<SupplementalTariff>
													<xsl:value-of select="s0:SupplementalTariff"/>
												</SupplementalTariff>
												<ChildType>
													<xsl:value-of select="s0:ChildType"/>
												</ChildType>
												<ChildQtyType>
													<xsl:value-of select="s0:ChildQtyType"/>
												</ChildQtyType>
												<ChildQty>
													<xsl:value-of select="s0:ChildQty"/>
												</ChildQty>
												<ChildListOrder>
													<xsl:value-of select="s0:ChildListOrder"/>
												</ChildListOrder>
												<TariffChangePending>
													<xsl:value-of select="s0:TariffChangePending"/>
												</TariffChangePending>
												<LastAuditedUser>
													<xsl:value-of select="s0:LastAuditedUser"/>
												</LastAuditedUser>
												<LastAuditedDate>
													<xsl:value-of select="s0:LastAuditedDate"/>
												</LastAuditedDate>
												<DateStart>
													<xsl:value-of select="s0:DateStart"/>
												</DateStart>
												<DateEnd>
													<xsl:value-of select="s0:DateEnd"/>
												</DateEnd>
												<ConcessionOrder>
													<xsl:value-of select="s0:ConcessionOrder"/>
												</ConcessionOrder>
												<PrimaryPreference>
													<xsl:value-of select="s0:PrimaryPreference"/>
												</PrimaryPreference>
												<RelatedIndicator>
													<xsl:value-of select="s0:RelatedIndicator"/>
												</RelatedIndicator>
												<SecondaryPreference>
													<xsl:value-of select="s0:SecondaryPreference"/>
												</SecondaryPreference>
												<ValuationCode>
													<xsl:value-of select="s0:ValuationCode"/>
												</ValuationCode>
												<ValuationMarkup>
													<xsl:value-of select="s0:ValuationMarkup"/>
												</ValuationMarkup>
												<UsageComment>
													<xsl:value-of select="s0:UsageComment"/>
												</UsageComment>
												<NAddInfo>
													<xsl:value-of select="s0:NAddInfo"/>
												</NAddInfo>
												<NDescription>
													<xsl:value-of select="s0:NDescription"/>
												</NDescription>
												<Description>
													<xsl:value-of select="s0:Description"/>
												</Description>
												<PartPivotUOM>
													<xsl:value-of select="s0:PartPivotUOM"/>
												</PartPivotUOM>
												<OrgHeader />
												<Country TableName="RefCountry">
													<Code>
														<xsl:value-of select="s0:Country/s0:Code"/>
													</Code>
													<PK>
														<xsl:value-of select="s0:Country/s0:PK"/>
													</PK>
												</Country>
											    <CusClassification />
											    <CountryOfExport TableName="RefCountry" />
												<CountryOfOrigin TableName="RefCountry" />
												<OriginState TableName="RefCountryStates" />
												 <TaxType TableName="RefDbEntZZ_RefCusTaxOrFee" />
											</CusClassPartPivot>
										</xsl:when>
										<xsl:otherwise>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:if>
								
								
							</xsl:for-each>
						</CusClassPartPivotCollection>
						<OrgPartRelationCollection>
							<xsl:for-each select="s0:Data/s0:Native/s0:Body/s0:Product/s0:OrgSupplierPart/s0:OrgPartRelationCollection/s0:OrgPartRelation">
								<OrgPartRelation>
									<PK>
										<xsl:value-of select="s0:PK"/>
									</PK>
									<Relationship>
										<xsl:value-of select="s0:Relationship"/>
									</Relationship>
									<LocalPartNumber>
										<xsl:value-of select="s0:LocalPartNumber"/>
									</LocalPartNumber>
									<Ti>
										<xsl:value-of select="s0:Ti"/>
									</Ti>
									<Hi>
										<xsl:value-of select="s0:Hi"/>
									</Hi>
									<ClientUQ>
										<xsl:value-of select="s0:ClientUQ"/>
									</ClientUQ>
									<ReleaseUQ>
										<xsl:value-of select="s0:ReleaseUQ"/>
									</ReleaseUQ>
									<ReceiveUQ>
										<xsl:value-of select="s0:ReceiveUQ"/>
									</ReceiveUQ>
									<RoyaltyPercent>
										<xsl:value-of select="s0:RoyaltyPercent"/>
									</RoyaltyPercent>
									<RoyaltyFlatAmount>
										<xsl:value-of select="s0:RoyaltyFlatAmount"/>
									</RoyaltyFlatAmount>
									<LandedCostMarginPercent1>
										<xsl:value-of select="s0:LandedCostMarginPercent1"/>
									</LandedCostMarginPercent1>
									<LandedCostMarginPercent2>
										<xsl:value-of select="s0:LandedCostMarginPercent2"/>
									</LandedCostMarginPercent2>
									<LandedCostMarginPercent3>
										<xsl:value-of select="s0:LandedCostMarginPercent3"/>
									</LandedCostMarginPercent3>
									<FormLayoutController>
										<xsl:value-of select="s0:FormLayoutController"/>
									</FormLayoutController>
									<JulianBatchNoFormat>
										<xsl:value-of select="s0:JulianBatchNoFormat"/>
									</JulianBatchNoFormat>
									<PickMode>
										<xsl:value-of select="s0:PickMode"/>
									</PickMode>
									<UseExpiryDate>
										<xsl:value-of select="s0:UseExpiryDate"/>
									</UseExpiryDate>
									<UsePackingDate>
										<xsl:value-of select="s0:UsePackingDate"/>
									</UsePackingDate>
									<UsePartAttrib1>
										<xsl:value-of select="s0:UsePartAttrib1"/>
									</UsePartAttrib1>
									<UsePartAttrib2>
										<xsl:value-of select="s0:UsePartAttrib2"/>
									</UsePartAttrib2>
									<UsePartAttrib3>
										<xsl:value-of select="s0:UsePartAttrib3"/>
									</UsePartAttrib3>
									<RFAttributeConfirm>
										<xsl:value-of select="s0:RFAttributeConfirm"/>
									</RFAttributeConfirm>
									<ExpiryDateFormatString>
										<xsl:value-of select="s0:ExpiryDateFormatString"/>
									</ExpiryDateFormatString>
									<PackingDateFormatString>
										<xsl:value-of select="s0:PackingDateFormatString"/>
									</PackingDateFormatString>
									<CompletePalletPicking>
										<xsl:value-of select="s0:CompletePalletPicking"/>
									</CompletePalletPicking>
									<RollUpAttributesOnDocuments>
										<xsl:value-of select="s0:RollUpAttributesOnDocuments"/>
									</RollUpAttributesOnDocuments>
									<IsPartAttrib1ReleaseCaptured>
										<xsl:value-of select="s0:IsPartAttrib1ReleaseCaptured"/>
									</IsPartAttrib1ReleaseCaptured>
									<IsPartAttrib2ReleaseCaptured>
										<xsl:value-of select="s0:IsPartAttrib2ReleaseCaptured"/>
									</IsPartAttrib2ReleaseCaptured>
									<IsPartAttrib3ReleaseCaptured>
										<xsl:value-of select="s0:IsPartAttrib3ReleaseCaptured"/>
									</IsPartAttrib3ReleaseCaptured>
									<LocalPartDescription>
										<xsl:value-of select="s0:LocalPartDescription"/>
									</LocalPartDescription>
									<ConsigneeMinShelfLifeAccepted>
										<xsl:value-of select="s0:ConsigneeMinShelfLifeAccepted"/>
									</ConsigneeMinShelfLifeAccepted>
									<UnitPrice>
										<xsl:value-of select="s0:UnitPrice"/>
									</UnitPrice>
									<IsSerialNumberReleaseCaptured>
										<xsl:value-of select="s0:IsSerialNumberReleaseCaptured"/>
									</IsSerialNumberReleaseCaptured>
									<UseSerialNumber>
										<xsl:value-of select="s0:UseSerialNumber"/>
									</UseSerialNumber>
									<OrgHeader>
										<Code>
											<xsl:value-of select="s0:OrgHeader/s0:Code"/>
										</Code>
										<PK>
											<xsl:value-of select="s0:OrgHeader/s0:PK"/>
										</PK>
										<OrgCusCodeCollection>
											<xsl:for-each select="s0:OrgHeader/s0:OrgCusCodeCollection/s0:OrgCusCode">
												<OrgCusCode>
													<PK>
														<xsl:value-of select="s0:PK"/>
													</PK>
													<CustomsRegNo>
														<xsl:value-of select="s0:CustomsRegNo"/>
													</CustomsRegNo>
													<CodeType>
														<xsl:value-of select="s0:CodeType"/>
													</CodeType>
													<CountryDefault>
														<xsl:value-of select="s0:CountryDefault"/>
													</CountryDefault>
													<CodeCountry TableName="RefCountry">
														<Code>
															<xsl:value-of select="s0:CodeCountry/s0:Code"/>
														</Code>
														<PK>
															<xsl:value-of select="s0:CodeCountry/s0:PK"/>
														</PK>
													</CodeCountry>
												</OrgCusCode>
											</xsl:for-each>
										</OrgCusCodeCollection>
									</OrgHeader>
									<RoyaltyCurrency TableName="RefCurrency" />
									<Category TableName="OrgPartCategory" />
									<CartonGroup TableName="WhsCartonGroup" />
									<DefaultInventoryHoldCode TableName="WhsInventoryHeldCode" />
									<UnitPriceCurrency TableName="RefCurrency" />
								</OrgPartRelation>
							</xsl:for-each>
						</OrgPartRelationCollection>
						<ProductStyleColour TableName="WhsProductStyleColour" />
						<ProductStyleSize TableName="WhsProductStyleSize" />
						<CommodityCode TableName="RefCommodityCode" />
						<LastWeightedCostCurr TableName="RefCurrency" />
						<PackType TableName="RefPackType" />
					</OrgSupplierPart>
				</Product>
			</Body>
			</Native><!--</Data>
				<ProcessingLog>
					<xsl:value-of select="s0:ProcessingLog"/>
				</ProcessingLog>
		</UniversalResponse>-->
	</xsl:template>
</xsl:stylesheet>
