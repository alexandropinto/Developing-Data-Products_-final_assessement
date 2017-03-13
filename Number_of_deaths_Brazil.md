Number of deaths in Brazil
========================================================
author: Alexandro Pinto 
date: 03/13/2017
autosize: true

The problem
========================================================

Brazil is a continental country, with a variety of state capabilities between the federation units.
Although information is a crucial tool for the management of government programs, it is unfortunately not available to all states.
In the health area, the lack of information can lead to the concentration of investments in areas with greater capacity, leaving other regions that have difficulties in the operation of the programs with poor or none investments.

The application
========================================================
The application is a prototype of how a simple tool can take information to all parts of the country at a super low cost.

It was used the Brazilian Health Ministry's Dataset.
Below is a overview of the dataset:



```r
library(reshape2)
a<-read.csv("./data/morbi.csv", sep = ";", nrows = 27)
var_melt<-names(a[,3:21])
a<-melt(a, id.vars = c("UF", "UF_cod"), measure.vars = var_melt)
names(a)<-c("UF", "id", "Year", "Mort")
a$Year<-as.numeric(sub("X", "", a$Year))

table(a$Year)
```



The application (cont)
========================================================


```

1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 
  27   27   27   27   27   27   27   27   27   27   27   27   27   27   27 
2011 2012 2013 2014 
  27   27   27   27 
```


As it can see, for each year, there are 27 (number of state in Brazil) row.

Let's try it!
========================================================
![Caption for the picture.](/app.png)

URL:https://alexandropinto.shinyapps.io/deaths_in_brazil/
