library(shiny)
library(MASS)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel( h1("Housing Values in Suburbs of Boston", align = "center"), ),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       #Set Parameters for Varirables
       strong('Histogram Parameters'), p(''),
       sliderInput("bins", "Numbero f Bins for Histogram:", min = 1, max = 100, value = 50),
       selectInput('histX', 'Select Variable for Histogram', names(Boston), selected = 'medv'),
       p(''), 
       p(''), 
       p(''),
       
       #Set Parameters for Scatterplot
       strong('Scatter Plot Parameters'), p(''),
       selectInput('scatterX', 'Select x Axis for Scatter Plot', 
                   names(Boston), selected = 'crim'),
       selectInput('scatterY', 'Select y Axis for Scatter Plot', 
                   names(Boston), selected = 'medv'),
       selectInput('scatterCol', 'Select Color for Scatter Plot', 
                   names(Boston), selected = 'age'),
       
       
       #Brief Variables Description
       strong("Variable Description"),
       tags$ul(
         tags$li('CRIM: per capita crime rate by town'),
         tags$li('ZN: proportion of residential land zoned for lots over 25,000 sq.ft.'),
         tags$li('INDUS: proportion of non-retail business acres per town.'),
         tags$li('CHAS: Charles River dummy variable (1 if tract bounds river; 0 otherwise'),
         tags$li('NOX: nitric oxides concentration (parts per 10 million'),
         tags$li('RM: average number of rooms per dwelling'),
         tags$li('AGE: proportion of owner-occupied units built prior to 1940'),
         tags$li('DIS: weighted distances to five Boston employment centres'),
         tags$li('RAD: index of accessibility to radial highways'),
         tags$li('TAX: full-value property-tax rate per $10,000'),
         tags$li('PTRATIO - pupil-teacher ratio by town'),
         tags$li('B: 1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town'),
         tags$li('LSTAT: % lower status of the population'),
         tags$li('MEDV: Median value of owner-occupied homes in $1000s')
       )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      p('This app explores the Boston dataset, which contains information collected by the 
        U.S Census Service concerning housing in the area of Boston Mass. The data was 
        originally published by Harrison, D. and Rubinfeld, 1978.'),
      p(''),
      p('This app allows the exploration of the following:'),
      p('(1) Display the distribution of one selected variable in a histogram'),
      p('(2) Display the correleation of three selected variable in a scatter plot'),

       plotOutput('HistOneVar'),
       plotOutput('ScatThreeVar')
    )
  )
))


