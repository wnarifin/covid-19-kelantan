# covid-19-kelantan
- Obtain recovery data from the Facebook page of JKN Kelantan. Other important state data e.g. new cases and death are already available from https://github.com/wnarifin/covid-19-malaysia
- Combined with baseline data for analysis and modeling starting from 1/4/2021.
- 12/6/2021 started using OCR, bcs they no longer provides text summary
- there are many discrepancies in the daily report by JKN Kelantan, the calculated cumulative sum of the reported number of recovery contradicts the cumulative sum reported by the agency. I relied on calculated cumulative sum. For example can refer to the difference in total number recovered on 18/7 (34257) and 19/7 (35611), while the reported number recovered was 131. Supposed to be 1354 on that day.
- on 20/7 and 21/7, the agency did not report daily recovery. They came up with a report on 22/7 though. So, I just take (total recover 22/7 - recover on 22/7 - total recover 19/7)/2 to get the daily recovered for 20/7 and 21/7.
