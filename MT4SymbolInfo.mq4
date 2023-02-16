//+------------------------------------------------------------------+
//|                                                MT4SymbolInfo.mq4 |
//|                                                     Yasser Mahdi |
//|                                   https://github.com/YasserMahdi |
//+------------------------------------------------------------------+
#property copyright "Yasser Mahdi"
#property link      "https://github.com/YasserMahdi"
#property version   "1.00"
#property strict
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   ObjectCreate("Symbol", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Symbol",Symbol()+ " " +GetMyPeriod(),14, "Verdana", Yellow);
   ObjectSet("Symbol", OBJPROP_CORNER, 0);
   ObjectSet("Symbol", OBJPROP_XDISTANCE, 20);
   ObjectSet("Symbol", OBJPROP_YDISTANCE, 20);

   ObjectCreate("Spread", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Spread","Spread: " + MarketInfo(Symbol(), MODE_SPREAD),14, "Verdana", Yellow);
   ObjectSet("Spread", OBJPROP_CORNER, 0);
   ObjectSet("Spread", OBJPROP_XDISTANCE, 20);
   ObjectSet("Spread", OBJPROP_YDISTANCE, 50);

   ObjectCreate("Bid", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Bid","Bid " + NormalizeDouble(Bid,Digits),14, "Verdana", Yellow);
   ObjectSet("Bid", OBJPROP_CORNER, 0);
   ObjectSet("Bid", OBJPROP_XDISTANCE, 20);
   ObjectSet("Bid", OBJPROP_YDISTANCE, 80);

   ObjectCreate("Ask", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("Ask","Ask "+ NormalizeDouble(Ask,Digits),14, "Verdana", Yellow);
   ObjectSet("Ask", OBJPROP_CORNER, 0);
   ObjectSet("Ask", OBJPROP_XDISTANCE, 20);
   ObjectSet("Ask", OBJPROP_YDISTANCE, 110);


//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
string GetMyPeriod()
  {
   if(Period() == 43200)
     {
      return "MN";
     }
   else
      if(Period() == 10080)
        {
         return "1W";
        }
      else
         if(Period()==1440)
           {
            return "1D";
           }
         else
            if(Period() == 60 ||Period() == 240)
              {
               return "H"+(Period()/ 60);
              }
            else
              {
               return "M"+(Period());
              }
  }
//+------------------------------------------------------------------+
