import java.time.*;
import java.time.format.*; // Import the DateTimeFormatter class

class Duration{
  
   public Duration(LocalDate startDate, LocalDate endDate) {
    super();
    this.startDate = startDate;
    this.endDate = endDate;
  }
  
  LocalDate startDate;
  LocalDate endDate;
  
  public LocalDate getStartDate() {
  return startDate;
}
public void setStartDate(LocalDate startDate) {
  this.startDate = startDate;
}
public LocalDate getEndDate() {
  return endDate;
}
public void setEndDate(LocalDate endDate) {
  this.endDate = endDate;
}
  @Override
public String toString() {
  return "Duration [startDate=" + startDate + ", endDate=" + endDate + "]";
}
}
