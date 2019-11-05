import java.text.SimpleDateFormat;  
import java.time.temporal.ChronoUnit;

HashMap<String, SortedSet<Duration>> tickerDurationMap = new HashMap<String, SortedSet<Duration>>();

class TickerAnalysis

{
   HashMap<String, SortedSet<Duration>>  calculateTickerDuration(Table niftyTable )
   {
     niftyTable.sort("report_date");
  for (TableRow r : niftyTable.rows()){
       
    String key1 = r.getString("Symbol");
    String reportDate = r.getString("report_date");
    if (tickerDurationMap.get(key1)==null){
      SortedSet s = new TreeSet(new Comparator<Duration>() {
    @Override
    public int compare(Duration o1, Duration o2) {
      // TODO Auto-generated method stub
      return (int)(o2.getEndDate().compareTo(o1.getEndDate()));
    } 
   });
   
     DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd");
     LocalDate startDate = LocalDate.parse(reportDate,myFormatObj);
      Duration dr = new Duration(startDate, startDate);
      s.add(dr);
     tickerDurationMap.put(key1, s);
     }
   else {
     SortedSet<Duration> s = tickerDurationMap.get(key1);
     Duration val = s.first();
     DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd");
     LocalDate endDate = LocalDate.parse(reportDate,myFormatObj);
     long monthsDiff  = ChronoUnit.MONTHS.between(val.getEndDate(), endDate);
     if( Math.abs(monthsDiff) <3){
     val.setEndDate(endDate);
     }
     else {
       Duration dr = new Duration(endDate, endDate);
      s.add(dr);
     }
     tickerDurationMap.put(key1, s);
  } 
   }
       println(tickerDurationMap);
       println(tickerDurationMap.size());
  return tickerDurationMap;
  }
}
