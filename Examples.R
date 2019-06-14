
# insert data into the spreadsheet for each of the region, with each site treated
# as an "impact", and run the analysis.
#options(java.parameters = "-Xmx16g" )
#require(rJava)
#require(XLConnect)
require(epower)

setwd("C:/Users/rfisher/Dropbox/EPower/Toobox_paper_draft1/Examples")
fitData(excelInFile="Most_complex_simulated.xlsx") # takes a while to run

setwd("C:/Users/rfisher/Dropbox/EPower/Toobox_paper_draft1/Examples")
fitData(excelInFile="DBCA_fixed_transect_Tantabiddi.xlsx")
assessPower()

setwd("C:/Users/rfisher/Dropbox/EPower/Toobox_paper_draft1/Examples")
fitData(excelInFile="Simple_gaussian_simulated.xlsx")
assessPower()



### example using only R to interface with the package
dat<-read.csv("C:/Users/rfisher/Dropbox/EPower/Toobox_paper_draft1/Revision1/DBCA_fixed_transect_Tantabiddi.csv")





