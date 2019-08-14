# epower conducts a power analysis on beyond BACI sampling designs through 
# INLA based inference and Monte Carlo simulation. Currently epower considers 
# only univariate responses. The analysis allows for cross random effects between 
# Time and Site in the design. The epower toolbox has been designed for use by 
# ecologists with a sound understanding of the statistical principles of BACI designs. 
# To assist the non-R user, BACI parameters are defined in an excel workbook template.
# 
# Here how to use the function with and without the excel interface.
# Date: 14-Aug-2019
# Authors: 
# Rebecca Fisher
# Glenn R Shiell
# Rohan J Sadler
# Karina Inostroza 
# George Shedrawi
# Thomas H Holmes
# James M McGree7

#### - Using excel workbook interface ------------------------------------------
# insert data into the spreadsheet for each of the region, with each site treated
# as an "impact", and run the analysis.
#options(java.parameters = "-Xmx16g" )
#require(rJava)
#require(XLConnect)

devtools::install_github("bmtglobal/epower")
require(epower)

setwd("C:/Users/rfisher/OneDrive - Australian Institute of Marine Science/Documents/AIMS/EcologicalRiskModelling/EPower/epower_examples")
#fitData(excelInFile="Most_complex_simulated.xlsx") # takes a while to run

fitData(excelInFile="DBCA_fixed_transect_Tantabiddi.xlsx")
assessPower()


fitData(excelInFile="Simple_gaussian_simulated.xlsx")
assessPower()



### example using only R to interface with the package
require(epower)
dat<-read.csv("epower_interface_V1.3_pilot_data.csv")

dataComponents<-supplyData(
	dat=dat,
  variableType="binomial",
  design.matrix=list(
      Response="CORAL",
      Trials="n.scored",
      Location="Site",
      sublocation="Replicate",
      Time="SurveyID",
      "subtime"=NA,
      BvA="BvA",
      CvI="CvI"),
  levels.dat=list(
      Before="Before",
      Control="control",
      After="After",
      Impact="impact"),
  scenario.data=list(
      Number.of.iterations=500,
      filename="test",
      Number.of.Impact.Locations=1,
      Number.of.Control.Locations=3,
      Number.of.sublocations.within.Location="3;4",
      Number.of.sample.times.Before=3,
      Number.of.sample.times.After=2,
      Number.of.subtimes.within.Time=1,
      Number.of.trials="100;200",
      Number.of.replicate.measurements=1),
  effect.info=list(
      Multiplicative=1,
      Fixed.change=0,
      Effect.values=-0.3))
# now run powerScenario
require(INLA,quietly=TRUE)
scenarioParams<-powerScenario(inputData=dataComponents)
assessPower()




