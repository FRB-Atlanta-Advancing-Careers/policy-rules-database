
# Ellie & Elias Benefits Calculator----
# This program reads-in input data and runs Benefits Calculator

# PREAMBLE----


rm(list=ls())

## Setting your working directory----
current_directory<-getwd()

## Load expense parameters ----
load(paste0(current_directory,"/prd_parameters/expenses.rdata"))

## Load benfits parameters ----
load(paste0(current_directory,"/prd_parameters/benefit.parameters.rdata"))

## Load eligible tables of SMI,FPL / crosswalks ----
load(paste0(current_directory,"/prd_parameters/tables.rdata"))

## Load default parameters for the PRD----
load(paste0(current_directory,"/prd_parameters/parameters.defaults.rdata"))

# verify that everything is loaded in the console

## Call all the functions----

source(paste0(current_directory,"/libraries.R"), local=TRUE) # Load required packages
source(paste0(current_directory,"/functions/benefits_functions.R"), local=TRUE) # Benefits calculations
source(paste0(current_directory,"/functions/expense_functions.R"), local=TRUE) # Expenses calculations
source(paste0(current_directory,"/functions/BenefitsCalculator_functions.R"), local=TRUE) # Benefits Calculator functions

# SPECIFY PROJECT----
PROJECT<-"TEST"

## 1. Settings----

# Load inputs YAML file
inputs <- read_yaml(paste0(current_directory,"/projects/",PROJECT,".yml"))


# Global settings
k_ftorpt <- inputs$k_ftorpt 
schoolagesummercare <- inputs$schoolagesummercare 
headstart_ftorpt <- inputs$headstart_ftorpt  
preK_ftorpt <- inputs$preK_ftorpt 
contelig.headstart <- inputs$contelig.headstart 
contelig.earlyheadstart <- inputs$contelig.earlyheadstart 
contelig.ccdf <- inputs$contelig.ccdf 

# Transfer programs switches
APPLY_CHILDCARE<-inputs$APPLY_CHILDCARE #Childcare block - Head Start and CCDF
APPLY_CCDF<-inputs$APPLY_CCDF
APPLY_HEADSTART<-inputs$APPLY_HEADSTART 
APPLY_PREK<-inputs$APPLY_PREK 
APPLY_LIHEAP<-inputs$APPLY_LIHEAP 
APPLY_HEALTHCARE<-inputs$APPLY_HEALTHCARE 
APPLY_MEDICAID_ADULT<-inputs$APPLY_MEDICAID_ADULT 
APPLY_MEDICAID_CHILD<-inputs$APPLY_MEDICAID_CHILD 
APPLY_ACA<-inputs$APPLY_ACA 
APPLY_SECTION8<-inputs$APPLY_SECTION8 
APPLY_RAP<-inputs$APPLY_RAP 
APPLY_FRSP<-inputs$APPLY_FRSP  
APPLY_SNAP<-inputs$APPLY_SNAP 
APPLY_SLP<-inputs$APPLY_SLP 
APPLY_WIC<-inputs$APPLY_WIC 
APPLY_EITC<-inputs$APPLY_EITC 
APPLY_TAXES<-inputs$APPLY_TAXES 
APPLY_CTC<-inputs$APPLY_CTC
APPLY_CDCTC<-inputs$APPLY_CDCTC 
APPLY_FATES<-inputs$APPLY_FATES 
APPLY_TANF<-inputs$APPLY_TANF 
APPLY_SSI<-inputs$APPLY_SSI 
APPLY_SSDI<-inputs$APPLY_SSDI


## 2. Create data from inputs----
data<-function.createData(inputs)

## 3. Attach default expenses----
data<-BenefitsCalculator.DefaultExpenses(data)

## 4. Apply Benefits Calculator (block-by-block)----

# Apply other benefits block 
data<-BenefitsCalculator.OtherBenefits(data, APPLY_TANF, APPLY_SSI, APPLY_SSDI) # OPTION TO END WITH APPLY_SSDI

# Apply child care block
data<-BenefitsCalculator.Childcare(data, APPLY_CHILDCARE, APPLY_HEADSTART, APPLY_PREK, APPLY_CCDF,APPLY_FATES) # OPTION TO END WITH APPLY_FATES

# Apply public health insurance block
data<-BenefitsCalculator.Healthcare(data, APPLY_HEALTHCARE, APPLY_MEDICAID_ADULT, APPLY_MEDICAID_CHILD, APPLY_ACA) # OPTION TO END WITH APPLY_ACA

# Apply food and housing block
data<-BenefitsCalculator.FoodandHousing(data, APPLY_SECTION8, APPLY_LIHEAP, APPLY_SNAP, APPLY_SLP, APPLY_WIC, APPLY_RAP, APPLY_FRSP) # OPTION TO END WITH APPLY_FRSP

# Apply taxes and tax credits block
data<-BenefitsCalculator.TaxesandTaxCredits(data, APPLY_EITC, APPLY_CTC, APPLY_CDCTC)

# Generate Additional Variables
data<-function.createVars(data)


## 5. Select variables of interest and save results----
data2<-data %>% 
  
  select(ruleYear, stateFIPS, stateName, stateAbbrev, countyortownName, famsize, numadults, numkids
         , agePerson1, agePerson2, agePerson3, agePerson4, agePerson5, agePerson6, agePerson7, agePerson8, agePerson9, agePerson10, agePerson11, agePerson12,empl_healthcare
         , income, assets.cash
         , exp.childcare, exp.food, exp.rentormortgage, exp.healthcare, exp.utilities, exp.misc, exp.transportation
         , netexp.childcare, netexp.food, netexp.rentormortgage, netexp.healthcare, netexp.utilities
         , value.snap, value.schoolmeals, value.section8, value.liheap
         , value.medicaid.adult, value.medicaid.child, value.aca, value.employerhealthcare
         , value.CCDF, value.HeadStart, value.PreK
         , value.cdctc.fed, value.cdctc.state, value.ctc.fed, value.ctc.state, value.eitc.fed, value.eitc.state
         , value.eitc, value.ctc, value.cdctc, value.ssdi, value.ssi, value.wic, value.tanf,
         , AfterTaxIncome, NetResources)


write.csv(data2, file = paste0(current_directory,"/output/results_",PROJECT, ".csv"), row.names = FALSE)


