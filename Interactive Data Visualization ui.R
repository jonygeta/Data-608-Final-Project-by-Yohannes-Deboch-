

library(ggvis)

fluidPage(
  titlePanel("United States Medicare Data Visualization by Hospital Provider: Exploring overall health care status by Period and Claim Type"),
  h3("Yohannes Deboch"),
  h3("Data 608 Final Project , November 14 2019 "),
  h4("General Introduction"),
  p("According to the definition provided by ", a("https://www.medicare.gov", href="https://www.medicare.gov"),". Medicare is the federal health insurance program for people who are 65 or older, certain younger people with disabilities and people with End-Stage Renal Disease (permanent kidney failure requiring dialysis or a transplant, sometimes called ESRD).  Having a clear visualization of Medicare data is relevant in identifying the available providers and help policy makers in decision making . 
I want to show overall Status of Health Care by Hospital provider in a Dashboard. Using this dashboard, we can get overview of total number of medications prescribed in each state, most prescribed medications in each state, average cost of inpatient and outpatient treatment, common inpatient diagnostic conditions in USA hospitals etc.
    I'll choose important variables to show in the dashboard to get an overall health care status by period and claim type ."),
  h4("Relevance of this Study to Current Health System's"),
  p("From ", a("https://www.rand.org/health-care/key-topics/health-policy.html", href="https://www.rand.org/health-care/key-topics/health-policy.html")," we can see that USA has The Patient Protection and Affordable Care Act (ACA) since 2010.  Getting an overview in the healthcare in dashboard will help us  to understand how the policy aligns with the current situation of healthcare system and policy makers can take better decision about the old ACA policy and weather any new policy needed or not. We can see Medicaid, essential health benefits etc. from the dashboard which is a key part of the current policy. The convergence of big data, analytics, and transparency will bring a sea change to the world of health care by necessitating new ways to communicate information to end users, such as payers, providers, researchers, and consumers. If health care payers can analyze large amounts of claims data effectively, they can improve service and care delivery for their recipients."),
  h4("Data Source and  Description"),
  p("Medical information per beneficiary data and data description was obtained from ", a("https://healthdata.gov/dataset/medicare-hospital-spending-claim", href="https://healthdata.gov/dataset/medicare-hospital-spending-claim")," The data displayed here shows average spending levels during hospitals' Medicare Spending per Beneficiary (MSPB) episodes. An MSPB episode includes all Medicare Part A and Part B claims paid during the period from 3 days prior to a hospital admission through 30 days after discharge. These average Medicare payment amounts have been price-standardized to remove the effect of geographic payment differences and add-on payments for indirect medical education (IME) and disproportionate share hospitals (DSH)."),
  h4("Interactive Visualization of the Data through Apps and its Purpose"),
  p("The aim of this dashboard is to explore the differences on average spending across providers by period and claim type within states. The average spending was compared across states in the following scatter plot helps to visualize Medicare average spending per episode among different providers. You can explore average spending within each state for a given period and type of claim by selecting the state from the drop-down box, and period and claim type from the radio buttons. 
Summary statistics of average spending for a given selection is provided on the top of the application, followed by scatter plot of average spending. Provider with highest average spending are listed under the scatter plot. You can see the name of provider and the average spending by hovering the cursor on each observation. 
In summary the top ten highest average spending was for inpatient claims during index hospital admission in the state of Texas (3 providers), Ohio, Nebraska, Indiana, Kansas (each 1 provider) and Oklahoma (2 provider).
"),
  p("Note that if a given period and type of claim for a given state have no data, no observation appears on the scatter plot. "),
  fluidRow(
    column(3,
      wellPanel(
		selectInput("state", "USA States:", c("AK","AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY")),
		radioButtons("period", "Period: ", c("During Index Hospital Admission", "30 days After Discharge from Index Hospital Admission", "1 to 3 days Prior to Index Hospital Admission")),
		radioButtons("clmType", "Claim Type: ", c("Inpatient", "Skilled Nursing Facility", "Durable Medical Equipment Carrier", "Home Health Agency", "Hospice", "Outpatient"))
      )
    ),	
    column(9,
      verbatimTextOutput("smryTable"),
      ggvisOutput("sctrPlot"),
      wellPanel(
        span(h4("Total number of Providers:"),  textOutput("nmbrProviders") ),
        span(h4("Top 10 Providers with highest average spending in decreasing order:"),  textOutput("topProviders") )
	  )	
	)
  )
)