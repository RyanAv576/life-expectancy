/* Adapted from code/01_Analyze-life-expectancy.sas (RyanAv576/life-expectancy) */
/* PROC IMPORT's hardcoded YourFilePathHere\...\.csv is replaced with an inline
   DATALINES sample of the repo's own data/Life-expectancy-by-state-long.csv,
   restricted to the California / black / Female rows the script's own WHERE
   clause selects. The regression itself (model le = year) is unchanged. */

data le_data;
  length state $10 stabbrs $2 sex $6 Census_Region $4 Census_Division $7 race $5;
  state="California"; stabbrs="CA"; sex="Female";
  Census_Region="West"; Census_Division="Pacific"; race="black";
  input year le;
  datalines;
1969 71.10310647
1970 71.35243258
1971 71.77241331
1972 71.99438306
1973 72.32209002
1974 72.67063521
1975 73.11947934
1976 73.43814774
1977 73.72797768
1978 73.97073551
1979 73.96876302
1980 73.88139405
1981 74.03942180
1982 74.14397981
1983 74.22103200
1984 74.21745285
1985 74.19714598
1986 74.12922623
1987 73.90033274
1988 73.79585782
1989 73.90156964
1990 74.29218404
1991 74.54225137
1992 74.67413291
1993 74.66835475
1994 74.77256206
1995 74.99748704
1996 75.17495965
1997 75.43224764
1998 75.54895930
1999 75.65830827
2000 76.00859666
2001 76.12897060
2002 76.23299073
2003 76.41567602
2004 76.68942427
2005 76.94012872
2006 77.16840620
2007 77.52958555
2008 77.94230564
2009 78.49702067
2010 78.93503185
2011 79.05075371
2012 79.29561860
2013 79.50595175
;
run;

/*Run a regression model with time coded using a linear term*/
proc reg data=le_data;
	model le = year;
	where state="California" and race="black" and sex="Female";
	run;
	quit;
