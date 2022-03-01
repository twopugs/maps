<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://www.cargowise.com/Schemas/Universal/2011/11" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" indent="yes" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:UniversalShipment" />
  </xsl:template>
  <xsl:template match="/s0:UniversalShipment">
		<UniversalShipment xmlns="http://www.cargowise.com/Schemas/Universal/2011/11">
		
		<xsl:variable name='TotalWeight' select="s0:Shipment/s0:TotalWeight"/>
		<xsl:variable name='GoodsDescription' select="s0:Shipment/s0:GoodsDescription"/>
		
			<Shipment>
				<DataContext>
					<DataTargetCollection>
						<DataTarget>
							<Type>CustomsDeclaration</Type>
							<Key>
								<xsl:value-of select="s0:Shipment/s0:DataContext/s0:DataSourceCollection/s0:DataSource/s0:Key"/>
							</Key>
						</DataTarget>
						
					</DataTargetCollection>
				</DataContext>
				<CommercialInfo>
					<CommercialInvoiceCollection>
						<xsl:for-each select="s0:Shipment/s0:CommercialInfo/s0:CommercialInvoiceCollection/s0:CommercialInvoice">	
							<xsl:variable name='InvoiceAmount' select="s0:InvoiceAmount"/>
							<xsl:variable name='NetWeight' select="s0:NetWeight"/>
							
							
							
							<CommercialInvoice>
								<InvoiceNumber>
									<xsl:value-of select="s0:InvoiceNumber"/>
								</InvoiceNumber>
								<IncoTerm>
									<Code>
										<xsl:value-of select="s0:IncoTerm/s0:Code"/>
									</Code>
								</IncoTerm>
								<InvoiceAmount>
									<xsl:value-of select="s0:InvoiceAmount"/>
								</InvoiceAmount>
								<InvoiceCurrency>
									<Code>
										<xsl:value-of select="s0:InvoiceCurrency/s0:Code"/>
									</Code>
								</InvoiceCurrency>
								<InvoiceDate>
									<xsl:value-of select="s0:InvoiceDate"/>
								</InvoiceDate>
					
								<CommercialInvoiceLineCollection>
									<xsl:for-each select="s0:CommercialInvoiceLineCollection/s0:CommercialInvoiceLine">
										<xsl:variable name='UnitCode' select="s0:CustomsQuantityUnit/s0:Code"/>
										<xsl:variable name='CustomsQuantity' select="s0:CustomsQuantity"/>
										<xsl:variable name='LinePrice' select="s0:LinePrice"/>
										<xsl:variable name='Weight' select="s0:Weight"/>
											
										<CommercialInvoiceLine>
											<LineNo>
												<xsl:value-of select="s0:LineNo"/>
											</LineNo>
											<PrimaryPreference>
												<xsl:value-of select="s0:PrimaryPreference"/>
											</PrimaryPreference>
											<EntryInstructionLink>
												<xsl:value-of select="s0:EntryInstructionLink"/>
											</EntryInstructionLink>
											<CountryOfOrigin>
												<Code>
													<xsl:value-of select="s0:CountryOfOrigin/s0:Code"/>
												</Code>
										   </CountryOfOrigin>
										   <LinePrice>
												<xsl:value-of select="s0:LinePrice"/>
										   </LinePrice>
										   
											<InvoiceQuantity>
												<xsl:value-of select="s0:InvoiceQuantity"/>
											</InvoiceQuantity>
											<InvoiceQuantityUnit>
												<Code>
													<xsl:value-of select="s0:InvoiceQuantityUnit/s0:Code"/>
												</Code>
											</InvoiceQuantityUnit>
												
													
													
												
												<xsl:choose>
													<!-- NETWEIGHT  0  and GoodsDesciption  0 Use Total Weight-->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.00000' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription='' or number($GoodsDescription)!= $GoodsDescription or  $GoodsDescription='0' or $GoodsDescription='0.0' or $GoodsDescription='0.00' or $GoodsDescription='0.000' or substring($GoodsDescription,0,7)='0.0000')">  -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($TotalWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.0000' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription='' or number($GoodsDescription)!= $GoodsDescription or  $GoodsDescription='0' or $GoodsDescription='0.0' or $GoodsDescription='0.00' or $GoodsDescription='0.000' or substring($GoodsDescription,0,7)='0.0000')"> -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($TotalWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription='' or number($GoodsDescription)!= $GoodsDescription or  $GoodsDescription='0' or $GoodsDescription='0.0' or $GoodsDescription='0.00' or $GoodsDescription='0.000' or substring($GoodsDescription,0,7)='0.0000')">  -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($TotalWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.00' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription='' or number($GoodsDescription)!= $GoodsDescription or  $GoodsDescription='0' or $GoodsDescription='0.0' or $GoodsDescription='0.00' or $GoodsDescription='0.000' or substring($GoodsDescription,0,7)='0.0000')"> -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($TotalWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.000' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription='' or number($GoodsDescription)!= $GoodsDescription or  $GoodsDescription='0' or $GoodsDescription='0.0' or $GoodsDescription='0.00' or $GoodsDescription='0.000' or substring($GoodsDescription,0,7)='0.0000')"> -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($TotalWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when>															   -->
													<!-- <xsl:when test="$UnitCode = 'KG' and substring($CustomsQuantity,0,9)='0.000000' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription='' or number($GoodsDescription)!= $GoodsDescription or  $GoodsDescription='0' or $GoodsDescription='0.0' or $GoodsDescription='0.00' or $GoodsDescription='0.000' or substring($GoodsDescription,0,7)='0.0000')"> -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($TotalWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- NETWEIGHT  0  and GoodsDesciption not 0 Use GoodsDesciption-->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.00000' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription!='' or number($GoodsDescription)= $GoodsDescription) and  ($GoodsDescription!='0' or $GoodsDescription!='0.0' or $GoodsDescription!='0.00' or $GoodsDescription!='0.000' or substring($GoodsDescription,0,7)!='0.0000')">  -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($GoodsDescription div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.0000' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription!='' or number($GoodsDescription)= $GoodsDescription) and  ($GoodsDescription!='0' or $GoodsDescription!='0.0' or $GoodsDescription!='0.00' or $GoodsDescription!='0.000' or substring($GoodsDescription,0,7)!='0.0000')"> -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($GoodsDescription div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription!='' or number($GoodsDescription)= $GoodsDescription) and  ($GoodsDescription!='0' or $GoodsDescription!='0.0' or $GoodsDescription!='0.00' or $GoodsDescription!='0.000' or substring($GoodsDescription,0,7)!='0.0000')"> -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($GoodsDescription div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.00' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription!='' or number($GoodsDescription)= $GoodsDescription) and  ($GoodsDescription!='0' or $GoodsDescription!='0.0' or $GoodsDescription!='0.00' or $GoodsDescription!='0.000' or substring($GoodsDescription,0,7)!='0.0000')"> -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($GoodsDescription div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.000' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription!='' or number($GoodsDescription)= $GoodsDescription) and  ($GoodsDescription!='0' or $GoodsDescription!='0.0' or $GoodsDescription!='0.00' or $GoodsDescription!='0.000' or substring($GoodsDescription,0,7)!='0.0000')"> -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($GoodsDescription div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when>															   -->
													<!-- <xsl:when test="$UnitCode = 'KG' and substring($CustomsQuantity,0,9)='0.000000' and ($NetWeight='' or $NetWeight='0' or $NetWeight='0.0' or $NetWeight='0.00' or $NetWeight='0.000' or substring($NetWeight,0,7)='0.0000') and ($GoodsDescription!='' or number($GoodsDescription)= $GoodsDescription) and  ($GoodsDescription!='0' or $GoodsDescription!='0.0' or $GoodsDescription!='0.00' or $GoodsDescription!='0.000' or substring($GoodsDescription,0,7)!='0.0000')"> -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($GoodsDescription div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- NETWEIGHT NOT 0 -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.00000' and ($NetWeight!='0' or $NetWeight!='0.0' or $NetWeight!='0.00' or $NetWeight!='0.000' or substring($NetWeight,0,7)!='0.0000')">  -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($NetWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.0000' and ($NetWeight!='0' or $NetWeight!='0.0' or $NetWeight!='0.00' or $NetWeight!='0.000' or substring($NetWeight,0,7)!='0.0000')">   -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($NetWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0' and ($NetWeight!='0' or $NetWeight!='0.0' or $NetWeight!='0.00' or $NetWeight!='0.000' or substring($NetWeight,0,7)!='0.0000')">  -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($NetWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.00' and ($NetWeight!='0' or $NetWeight!='0.0' or $NetWeight!='0.00' or $NetWeight!='0.000' or substring($NetWeight,0,7)!='0.0000')">    -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($NetWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													<!-- <xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.000' and ($NetWeight!='0' or $NetWeight!='0.0' or $NetWeight!='0.00' or $NetWeight!='0.000' or substring($NetWeight,0,7)!='0.0000')">  -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($NetWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when>															   -->
													<!-- <xsl:when test="$UnitCode = 'KG' and substring($CustomsQuantity,0,9)='0.000000' and ($NetWeight!='0' or $NetWeight!='0.0' or $NetWeight!='0.00' or $NetWeight!='0.000' or substring($NetWeight,0,7)!='0.0000')">  -->
														<!-- <CustomsQuantity> -->
															<!-- <xsl:value-of select="($NetWeight div $InvoiceAmount) * $Weight"/> -->
														<!-- </CustomsQuantity> -->
													<!-- </xsl:when> -->
													
													<xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.00000'"> 
														<CustomsQuantity>
															<xsl:value-of select="($GoodsDescription div $TotalWeight) * $Weight"/>
														</CustomsQuantity>
													</xsl:when>
													<xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.0000'">  
														<CustomsQuantity>
															<xsl:value-of select="($GoodsDescription div $TotalWeight) * $Weight"/>
														</CustomsQuantity>
													</xsl:when>
													<xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0'"> 
														<CustomsQuantity>
															<xsl:value-of select="($GoodsDescription div $TotalWeight) * $Weight"/>
														</CustomsQuantity>
													</xsl:when>
													<xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.00'">   
														<CustomsQuantity>
															<xsl:value-of select="($GoodsDescription div $TotalWeight) * $Weight"/>
														</CustomsQuantity>
													</xsl:when>
													<xsl:when test="$UnitCode = 'KG' and $CustomsQuantity='0.000'"> 
														<CustomsQuantity>
															<xsl:value-of select="($GoodsDescription div $TotalWeight) * $Weight"/>
														</CustomsQuantity>
													</xsl:when>															  
													<xsl:when test="$UnitCode = 'KG' and substring($CustomsQuantity,0,9)='0.000000'"> 
														<CustomsQuantity>
															<xsl:value-of select="($GoodsDescription div $TotalWeight) * $Weight"/>
														</CustomsQuantity>
													</xsl:when>
													<xsl:otherwise>
														<CustomsQuantity>
															<xsl:value-of select="$CustomsQuantity"/>
														</CustomsQuantity>
													</xsl:otherwise>
												</xsl:choose>
											<CustomsQuantityUnit>
												<Code>
													<xsl:value-of select="s0:CustomsQuantityUnit/s0:Code"/>
												</Code>
											</CustomsQuantityUnit>
											<CustomsValue>
												<xsl:value-of select="s0:CustomsValue"/>
											</CustomsValue>
											<PartNo>
												<xsl:value-of select="s0:PartNo"/>
											</PartNo>
											<Weight>
												<xsl:value-of select="s0:Weight"/>
											</Weight>
											<HarmonisedCode>
												<xsl:value-of select="s0:HarmonisedCode"/>
											</HarmonisedCode>
										</CommercialInvoiceLine>
									</xsl:for-each>	
								</CommercialInvoiceLineCollection>
							</CommercialInvoice>
						</xsl:for-each>	
					</CommercialInvoiceCollection>
				</CommercialInfo>
				<EntryInstructionCollection>
					<xsl:for-each select="s0:Shipment/s0:EntryInstructionCollection/s0:EntryInstruction">
						<EntryInstruction>
							<Style>
								<xsl:value-of select="s0:Style"/>
							</Style>
							<Link>
								<xsl:value-of select="s0:Link"/>
							</Link>
							<Description>
								<xsl:value-of select="s0:Description"/>
							</Description>
							<AddInfoCollection>
								<xsl:for-each select="s0:AddInfoCollection/s0:AddInfo">
									<AddInfo>
										 <Value>
											<xsl:value-of select="s0:Value"/>
										 </Value>
										 <Key>
											<xsl:value-of select="s0:Key"/>
										 </Key>
									</AddInfo>
								</xsl:for-each>	
							</AddInfoCollection>
						</EntryInstruction>
					</xsl:for-each>	
				</EntryInstructionCollection>
			</Shipment>
		</UniversalShipment>
	</xsl:template>
</xsl:stylesheet>
