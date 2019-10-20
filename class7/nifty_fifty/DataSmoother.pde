HashMap<Integer, SortedSet<EquityRecord>> niftySymbolListVis = new HashMap<Integer, SortedSet<EquityRecord>>();

  class DataSmoother {
    HashMap<Integer, SortedSet<EquityRecord>> smoothenData(int numPoints) {
      
      keys = new ArrayList<Integer>(niftySymbolList.keySet());
      
      Collections.sort(keys);
      
      for (int i = 0; i < keys.size() - 1; i++) {
        
        int j = i + 1;
        
        SortedSet<EquityRecord> curr_rec = niftySymbolList.get(keys.get(j));
        
        SortedSet<EquityRecord> prev_rec = niftySymbolList.get(keys.get(i));
        
        for (EquityRecord rec : curr_rec) {
          
          String[] dateArr = rec.getReportDate().split("-");
  
           int year = Integer.parseInt(dateArr[0]);
                int month = Integer.parseInt(dateArr[1]);
          
          for (EquityRecord p_rec : prev_rec) {
            
            if (rec.getSymbol().equals(p_rec.getSymbol())) {
              
              float speed = (rec.getFreeFloatMarketCap() - p_rec.getFreeFloatMarketCap()) / numPoints;
              
              SortedSet<EquityRecord> s;

              for (int k = 0; k < numPoints; k++) {
                              int key1 = year * 10000 + 100 * month + k;

                EquityRecord record = new EquityRecord(rec);
                
                record.setFreeFloatMarketCap(rec.getFreeFloatMarketCap() + speed * k);
                println(record.getFreeFloatMarketCap()+"  speed "+ speed + " symbol " + rec);
                
                if (niftySymbolListVis.get(key1) == null) {
                  s = new TreeSet<EquityRecord>(
                      new Comparator<EquityRecord>() {
                        @Override
                        public int compare(EquityRecord o1, EquityRecord o2) {
                          // TODO Auto-generated method stub
                          return (int) (o2.getFreeFloatMarketCap()
                              - o1.getFreeFloatMarketCap());
                        }
                      });
                  
                } else {
                   s = niftySymbolListVis.get(key1);
                 
                }
                
                s.add(record);
                  niftySymbolListVis.put(key1, s);
                  
              }
            }
          }
        }
      }
      return niftySymbolListVis;
    }

  }
