public class EquityRecord {

  public String getSymbol() {
    return symbol;
  }
  public void setSymbol(String symbol) {
    this.symbol = symbol;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getIndustry() {
    return industry;
  }
  public void setIndustry(String industry) {
    this.industry = industry;
  }
  public float getEquityCapital() {
    return equityCapital;
  }
  public void setEquityCapital(float equityCapital) {
    this.equityCapital = equityCapital;
  }
  public float getFreeFloatMarketCap() {
    return freeFloatMarketCap;
  }
  public void setFreeFloatMarketCap(float freeFloatMarketCap) {
    this.freeFloatMarketCap = freeFloatMarketCap;
  }
  public float getWeightage() {
    return weightage;
  }
  public void setWeightage(float weightage) {
    this.weightage = weightage;
  }
  public float getBeta() {
    return beta;
  }
  public void setBeta(float beta) {
    this.beta = beta;
  }
  public float getR2() {
    return r2;
  }
  public void setR2(float r2) {
    this.r2 = r2;
  }
  public float getVolatalityPerc() {
    return volatalityPerc;
  }
  public void setVolatalityPerc(float volatalityPerc) {
    this.volatalityPerc = volatalityPerc;
  }
  public float getMonthlyReturn() {
    return monthlyReturn;
  }
  public void setMonthlyReturn(float monthlyReturn) {
    this.monthlyReturn = monthlyReturn;
  }
  public float getAvgImpact() {
    return avgImpact;
  }
  public void setAvgImpact(float avgImpact) {
    this.avgImpact = avgImpact;
  }
  public String getReportDate() {
    return reportDate;
  }
  public void setReportDate(String reportDate) {
    this.reportDate = reportDate;
  }
  String symbol;
  String name;
  String industry;
  float equityCapital;
  float freeFloatMarketCap;
  float weightage;
  float beta;
  float r2;
  float volatalityPerc;
  float monthlyReturn;
  float avgImpact;
  String reportDate;
  
  public EquityRecord(String symbol, String name, String industry, float equityCapital, float freeFloatMarketCap,
      float weightage, float beta, float r2, float volatalityPerc, float monthlyReturn, float avgImpact,
      String reportDate) {
    super();
    this.symbol = symbol;
    this.name = name;
    this.industry = industry;
    this.equityCapital = equityCapital;
    this.freeFloatMarketCap = freeFloatMarketCap;
    this.weightage = weightage;
    this.beta = beta;
    this.r2 = r2;
    this.volatalityPerc = volatalityPerc;
    this.monthlyReturn = monthlyReturn;
    this.avgImpact = avgImpact;
    this.reportDate = reportDate;
  }
  
  public EquityRecord(){
  }
  
  public EquityRecord(EquityRecord other ){
    super();
    this.symbol = other.symbol;
    this.name = other.name;
    this.industry = other.industry;
    this.equityCapital = other.equityCapital;
    this.freeFloatMarketCap = other.freeFloatMarketCap;
    this.weightage = other.weightage;
    this.beta = other.beta;
    this.r2 = other.r2;
    this.volatalityPerc = other.volatalityPerc;
    this.monthlyReturn = other.monthlyReturn;
    this.avgImpact = other.avgImpact;
    this.reportDate = other.reportDate;
  }
  
  @Override
public String toString() {
  return "EquityRecord [symbol=" + symbol + ", name=" + name + ", industry=" + industry + ", equityCapital="
      + equityCapital + ", freeFloatMarketCap=" + freeFloatMarketCap + ", weightage=" + weightage + ", beta="
      + beta + ", r2=" + r2 + ", volatalityPerc=" + volatalityPerc + ", monthlyReturn=" + monthlyReturn
      + ", avgImpact=" + avgImpact + ", reportDate=" + reportDate + "]";
}

@Override
public int hashCode() {
  final int prime = 31;
  int result = 1;
  result = prime * result + ((industry == null) ? 0 : industry.hashCode());
  result = prime * result + ((name == null) ? 0 : name.hashCode());
  result = prime * result + ((reportDate == null) ? 0 : reportDate.hashCode());
  result = prime * result + ((symbol == null) ? 0 : symbol.hashCode());
  return result;
}
@Override
public boolean equals(Object obj) {
  if (this == obj)
    return true;
  if (obj == null)
    return false;
  if (getClass() != obj.getClass())
    return false;
  EquityRecord other = (EquityRecord) obj;
  if (industry == null) {
    if (other.industry != null)
      return false;
  } else if (!industry.equals(other.industry))
    return false;
  if (name == null) {
    if (other.name != null)
      return false;
  } else if (!name.equals(other.name))
    return false;
  if (reportDate == null) {
    if (other.reportDate != null)
      return false;
  } else if (!reportDate.equals(other.reportDate))
    return false;
  if (symbol == null) {
    if (other.symbol != null)
      return false;
  } else if (!symbol.equals(other.symbol))
    return false;
  return true;
}
  
}
