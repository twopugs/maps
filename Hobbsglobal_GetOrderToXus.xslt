
                    <!-- </OrderedQty> -->
					<xsl:if test="quantity != ''">
						<PackageQTY>
							<!-- <xsl:value-of select="quantity/text()"/> -->
							<xsl:choose>
									<xsl:when test="substring-after(quantity,'.') !=''">
										<xsl:value-of select="concat(substring-before(quantity,'.'),'.',substring(substring-after(quantity,'.'),1,2))"/>
									</xsl:when>
									<xsl:when test="substring-after(quantity,'.') =''">
										<xsl:value-of select="concat(quantity,'.00')"/>
									</xsl:when>	
									<xsl:otherwise>	
									</xsl:otherwise>
								</xsl:choose>
						</PackageQTY>
					</xsl:if>
					
					<xsl:variable name="Code">
						<xsl:choose>
							<xsl:when test="string-length(sku/text())>0">
								<xsl:value-of select="substring(sku/text(),(string-length(sku/text())-1),2)"/>
							</xsl:when>				
							<xsl:otherwise>	
								<xsl:value-of select="string('NULL')" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<!-- <TEST> -->
                        <!-- <xsl:value-of select="substring($Code,2,1)"/> -->
                      <!-- </TEST> -->
					<xsl:if test="$Code !='NULL'">
						<xsl:choose>
							<xsl:when test="$Code ='CS'">
								<Product>
									<Code>
										<xsl:value-of select="substring(sku/text(),1,(string-length(sku/text())-2))"/>
									</Code>
								</Product>
								<PackageQtyUnit>
									<Code>CTN</Code>
								</PackageQtyUnit>
							</xsl:when>
							<xsl:when test="substring($Code,2,1) ='C'">
								<Product>
									<Code>
										<xsl:value-of select="substring(sku/text(),1,(string-length(sku/text())-1))"/>
									</Code>
								</Product>
								<PackageQtyUnit>
									<Code>CTN</Code>
								</PackageQtyUnit>
							</xsl:when>
							<xsl:when test="$Code ='RD'">
								<Product>
									<Code>
										<xsl:value-of select="substring(sku/text(),1,(string-length(sku/text())-2))"/>
									</Code>
								</Product>
								<PackageQtyUnit>
									<Code>PKG</Code>
								</PackageQtyUnit>
							</xsl:when>
							<xsl:otherwise>
								<Product>
									<Code>
										<xsl:value-of select="sku/text()"/>
									</Code>
								</Product>
								<PackageQtyUnit>
									<Code>UNT</Code>
								</PackageQtyUnit>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:if>
					
					
                    <UnitPriceAfterDiscount>
                      <xsl:value-of select="price/text()"/>
                    </UnitPriceAfterDiscount>
                  </OrderLine>
                </xsl:for-each>
              </OrderLineCollection>                   
            </Order>
  <CustomizedFieldCollection>
                <CustomizedField>
                  <Value>
                    <xsl:value-of select ="id/text()"/>
                  </Value>
                  <Key>ID</Key>
                <DataType>String</DataType>
                </CustomizedField>
              </CustomizedFieldCollection>   
          </Shipment>
        </xsl:if>
    </UniversalShipment>
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


]]></msxsl:script>
</xsl:stylesheet>
