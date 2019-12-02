library(shinythemes)
library("ggpubr")


shinyUI(fluidPage(
  theme = shinytheme("simplex"),
  navbarPage(
    title = "",
    ####################################################################################################################################
    tabPanel("About",
             
             column(3),
             column(
               7,
               br(),
               br(),
               br(),
               withMathJax(
                 h3("Task"),
                 p(
                   "The main task here is to create an app which suits for Statistics and data analytics. It means that the app should allow you to do some descriptive or predictive analytics on a real dataset. "
                 ),
                 h3("Instruction"),
                 p(
                   strong("1)"),
                   "Import the data into app. Equivalently, In-built dataset might be used for analytics. "
                 ),
                 p(
                   strong("2)"),
                   "Apply some descriptive analytics techniques on the dataset and visualize the quick insights"
                 ),
                 p(
                   strong("3)"),
                   "Apply at least one probabilistic model e.g. discrete or continuous probability models on the dataset and visualize the insight"
                 ),
                 p(
                   strong("4)"),
                   "Implement at least one hypothesis testing context and print out the decision in the shiny dashboard."
                 ),
                 p(
                   strong("5)"),
                   "Apply at least one type of GLMs e.g. linear regression, logistic regression, Poisson regression on the dataset and visualize the model performance using an appropriate graph, e.g. ROC, performance plot, etc.  "
                 ),
                 p(
                   strong("5)"),
                   "Visualize the deep insight in dashboard environment."
                 ),
                 br(),
                 br(),
                 tags$img(src = "https://www.dbs.ie/images/default-source/logos/dbs-logo-2019-small.png", align =
                            "top")
               )
             )),
    
    ####################################################################################################################################
    
    
    tabPanel("Descriptive Analytics",
             tabsetPanel(
               tabPanel("Dataset Summary",
                        fluidRow(
                          column(2, br(),
                                 wellPanel(
                                   selectInput(
                                     inputId = "dataset",
                                     label = "Select a DataSet",
<<<<<<< HEAD
                                     choices = c("iris","warpbreaks","mtcars","faithful","beavers"),
                                     selected = "iris")
                                 )
                          ),
                          column(
                            10,
                            h4("Summary", align = "middle"),
                            conditionalPanel(condition = "input.dataset == 'iris'",
                                             verbatimTextOutput("headeriris")
                            ),
                            conditionalPanel(condition = "input.dataset == 'mtcars'",
                                             verbatimTextOutput("headermt")
                            ),
                            conditionalPanel(condition = "input.dataset == 'warpbreaks'",
                                             verbatimTextOutput("headerwb")
                            ),
                            conditionalPanel(condition = "input.dataset == 'faithful'",
                                             verbatimTextOutput("headerfait")
                            ),
                            conditionalPanel(condition = "input.dataset == 'beavers'",
                                             h2("Beavers1"),
                                             verbatimTextOutput("headerbeav1"),
                                             h2("beavers2"),
                                             verbatimTextOutput("headerbeav2")
                            )
                          ),
                          br(),
                          br()
=======
                                     choices = "iris"
                                   )
                                   
                                 )),
                          
                          column(
                            5,
                            h4("Summary", align = "middle"),
                            verbatimTextOutput("header")
                          ),
                          br(),
                          br()
                          
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                        )),
               
               ####################################################################################################################################
               
<<<<<<< HEAD
               tabPanel("Graphical Representation",
=======
               tabPanel("Box Plots",
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                        fluidRow(
                          column(2, br(),
                                 wellPanel(
                                   selectInput(
<<<<<<< HEAD
                                     inputId = "dataset2",
                                     label = "Select a DataSet",
                                     choices = c("iris","warpbreaks","mtcars","faithful","beavers"),
                                     selected = "iris")
                                 )
                          ),
                          column(10,
                                 conditionalPanel(condition = "input.dataset2 == 'iris'",
                                                  h3("Boxplot of the Iris Dataset", align = "middle"),
                                                  plotOutput("plot1"),
                                                  plotOutput("plot2")
                                 ),
                                 conditionalPanel(condition = "input.dataset2 == 'warpbreaks'",
                                                  h3("Boxplot of Warpbreaks" ,align = "middle"),
                                                  plotOutput("plotwb"),
                                                  plotOutput("plotwb1")
                                 ),
                                 conditionalPanel(condition = "input.dataset2 == 'mtcars'",
                                                  h3("Boxplot of mtcars",align = "middle"),
                                                  plotOutput("plotmt")
                                 ),
                                 conditionalPanel(condition = "input.dataset2 == 'faithful'",
                                                  h3("Boxplot of faitful",align = "middle"),
                                                  plotOutput("plotfaith")
                                 ),
                                 conditionalPanel(condition = "input.dataset2 == 'beavers'",
                                                  h3("Graph of Beavers",align = "middle"),
                                                  plotOutput("plotbeavers")
                                 ) 
                          )
=======
                                     "dataset",
                                     h5("Choose a dataset:"),
                                     choices = c("iris"),
                                     selected = "iris"
                                   ),
                                   
                                   conditionalPanel(
                                     condition = "input.dataset == 'iris'",
                                     selectInput(
                                       "var",
                                       label = "Choose a variable (a):",
                                       choice = c(
                                         "Sepal.Length" = 1,
                                         "Sepal.Width" =
                                           2,
                                         "Petal.Length" =
                                           3,
                                         "Petal.Width" =
                                           4
                                       ),
                                       selectize = FALSE
                                     ),
                                     selectInput(
                                       "varb",
                                       label = "Choose a variable",
                                       choice = c(
                                         "Sepal.Length" = 1,
                                         "Sepal.Width" =
                                           2,
                                         "Petal.Length" =
                                           3,
                                         "Petal.Width" =
                                           4
                                       ),
                                       selectize = FALSE
                                     )
                                   )
                                   
                                 )),
                          column(
                            8,
                            h4("Boxplot of the Iris", align = "middle"),
                            plotOutput("plot1"),
                            h4("Boxplot of the Variable A", align = "middle"),
                            plotOutput("plot")
                          )
                          
                          
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                        ))
             )),
    ####################################################################################################################################
    
    tabPanel(
      "Discrete Probability Model",
      tabsetPanel(
        tabPanel("Hypergeometric",
                 fluidRow(
                   column(
                     2,
                     br(),
                     wellPanel(
                       selectInput(
                         "variable",
                         "Comparison Variable",
                         choices = c(
                           "Cylinder" = "cyl",
                           "Gear" = "gear",
                           "Carbon" = "carb"
                         ),
                         selected = "gear"
                       ),
                       
                       numericInput("j", "Numbers of cars sampled", 5, min = 1, max = 32),
                       numericInput(
                         "a",
                         "Numbers of cars with selected variable (a)",
                         2,
                         min = 1,
                         max = 32
                       ),
                       
                       conditionalPanel(condition = "input.variable == 'cyl'",
                                        radioButtons(
                                          "cyl", "Choose Cylinder :",
                                          c("4" = 4,
                                            "6" = 6,
                                            "8" = 8)
                                        )),
                       
                       conditionalPanel(condition = "input.variable == 'gear'",
                                        radioButtons(
                                          "gear", "Choose Gear :",
                                          c("3" = 3,
                                            "4" = 4,
                                            "5" = 5)
                                        )),
                       
                       conditionalPanel(condition = "input.variable == 'carb'",
                                        radioButtons(
                                          "carb",
                                          "Choose Carbon :",
                                          c(
<<<<<<< HEAD
                                            "1" = 1,"2" = 2,"3" = 3,"4" = 4, "6" = 6, "8" = 8
                                          )
                                        )
                       )
=======
                                            "1" = 1,
                                            "2" = 2,
                                            "3" = 3,
                                            "4" = 4,
                                            "6" = 6,
                                            "8" = 8
                                          )
                                        ))
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                     )
                   ),
                   
                   column(
                     7,
                     h4("Geometric Histogram", align = "middle"),
<<<<<<< HEAD
                     plotOutput("histogram")
=======
                     plotOutput("histogram"),
                     h4("Table", align = "middle"),
                     tableOutput("prob")
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                   )
                 )),
        
        #column(7,h4("Boxplot of the Iris",align = "middle"),verbatimTextOutput("prt"))
        
        tabPanel("Poisson",
                 fluidRow(
                   column(
                     2,
                     br(),
                     wellPanel(
                       numericInput("Y", "Input Y for Exp prob model", value = 1),
<<<<<<< HEAD
                       numericInput("lam", "parameter lambda for dist. graph", value = 1),
                       numericInput("max1", "upper limit for x for dist. graph" , value = 10)
=======
                       #selectInput(inputId = "columns", label = "Select a Column", choices = ""),
                       numericInput("lam", "parameter lambda for dist. graph", value = 1),
                       numericInput("max1", "upper limit for x for dist. graph" , value = 10),
                       
                       
                       
                       
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                     )
                   ),
                   column(
                     8,br(),
<<<<<<< HEAD
                     h4("Poisson Probability Model - Warpbreaks Dataset"),
                     p(
                       "The probability the amount of warpbreaks in the loom is less than",
=======
                     h4("Poisson Probability Model - IRIS Dataset"),
                     p(
                       "The probability the next poisson modelled",
                       strong("var"),
                       "is less than",
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                       strong("y"),
                       "is:"
                     ),
                     verbatimTextOutput("Poisprob"),
<<<<<<< HEAD
                     paste("The prediction for the amount of warpbreaks in the next loom is:"),
                     verbatimTextOutput("PoisX"),
                     h3("Poisson Graphs"),
                     plotOutput("plotpois"),
                     plotOutput("plotpois1")
                   )
=======
                     
                     p("The prediction for the next var modelled by poisson is:"),
                     verbatimTextOutput("PoisX"),
                     
                     h4("Poisson Graphs"),
                     plotOutput("plotpois"),
                     plotOutput("plotpois1")
                   )
                   
                   
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                 ))
      )
    ),
    tabPanel(
      "Continuous Probability Model",
      tabsetPanel(
        tabPanel("Expenential Probability Model",
                 fluidRow(
                   column(
                     2,
                     br(),
<<<<<<< HEAD
                     wellPanel( 
                       numericInput("X", "Input X for Exp prob model", value = 1),
                       numericInput("lam1", "parameter lambda for dist. graph", value = 1),
                       numericInput("max2", "upper limit for x for dist. graph" , value = 10)
                     )
=======
                     wellPanel(
                       conditionalPanel(
                         condition = "input.dataset == 'warpbreaks'",
                         selectInput(
                           "var1",
                           label = "Choose a variable",
                           choice = c(
                             "breaks" = 1,
                             "wool" = 2,
                             "tension" =
                               3
                           ),
                           selectize = FALSE
                         ),
                         numericInput("X", "Input X for Pois prob model", value = 1),
                       ),
                       
                       
                       numericInput("lam", "parameter lambda for dist. graph", value = 1),
                       numericInput("max1", "upper limit for x for dist. graph" , value = 10)
                       
                       
                       
                       
                     )
                     
                     
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                   ),
                   column(
                     9,
                     br()
                     ,
<<<<<<< HEAD
                     h4("Exponential Probability Model - Faithful Dataset"),
                     p("The probability the next erruption is in less in X minutes is:"),
                     verbatimTextOutput("Expprob"),
                     paste("The Prediction for the waiting time until the next eruption is:"),
                     verbatimTextOutput("ExpX"),
                     h3("Exponential Graphs"),
                     plotOutput("plotexp")
                   )
=======
                     h4("Exponential Probability Model - WARPBREAKS Dataset"),
                     
                     p(
                       "The probability the next Exponentially modelled var is less than X is:"
                     ),
                     verbatimTextOutput("Expprob"),
                     h4("The Prediction for the next var is:"),
                     verbatimTextOutput("ExpX"),
                     h4("Exponential Graphs"),
                     plotOutput("plotexp"),
                     plotOutput("plotexp1")
                   )
                   
                   
                   
                   
                   
                   
                   
                   
                   
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                 )),
        tabPanel(
          "Chi-Square",
          fluidRow(
<<<<<<< HEAD
            column(2, br()),
=======
            column(2, br(),),
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
            
            h3("Chi Square Probability Model:"),
            paste("The probability the next Chi-Square modelled var is less than y is:"),
            paste("The prediction for the next var modelled by Chi-Square is:"),
            plotOutput('chiPlot')
            
            
          )
        ),
        
        tabPanel(
          "Normal Distribution",
          fluidRow(
            column(2, br(),
                   #Three inputs. Two numeric for probability calc and 1 slider for histogram. Default value 1.
                   wellPanel(
<<<<<<< HEAD
                     numericInput("lower", "Input 1", value = 15),
                     numericInput("upper", "Input 2", value = 30)
=======
                     numericInput("input1", "Input 1", value = 1),
                     numericInput("input2", "Input 2", value = 1),
                     sliderInput(
                       "barslider",
                       "Select # of bins",
                       min = 1,
                       max = 20,
                       value = 10
                     )
                     
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                   )),
            
            #Show summary of chosen dataset
            
            h2("Summary of MtCars (mpg) Data Set:"),
            verbatimTextOutput("summary"),
            
            #Show probability of getting a mpg between two inputs
            
            h3("Normal Probability Model - MtCars (mpg) Dataset"),
<<<<<<< HEAD
            p("The probability of getting between lower and upper is:"),
            verbatimTextOutput("normprob"),
            
            #Histogram showing distribution of mpg variable
            plotOutput("map")   
          )
        )
=======
            p("The probability of getting between input 1 and input 2 is:"),
            verbatimTextOutput("normprob"),
            
            #Histogram showing distribution of mpg variable
            
            plotOutput("chart1"),
            
            
          )
        )
        
        
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
      )
    ),
    
    tabPanel("Hypothesis Test",
             tabsetPanel(
               tabPanel("One Population",
                        fluidRow(
                          column(2, br(),
                                 wellPanel(
                                   selectInput(
                                     "Alpha",
                                     h5("Alpha for Hypothesis Test"),
                                     choices = c("0.01", "0.05", "0.025")
                                   ),
                                   selectInput(
                                     "testtype",
                                     h5("Type of Hypothesis Test"),
                                     choices = c("less", "greater", "two.sided")
                                   ),
<<<<<<< HEAD
                                   selectInput(
                                     "iv",
                                     h5("Variable to be tester"),
                                     choice=c("Sepal.Length"=1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4), selectize= FALSE),
                                   numericInput("mu", "mu for mean hypothesis test", value = 5)
                                 )),
                          column(
                            7,
                            h4("Test of mean with one population"),
                            h5("Testing the mean of the input variable"),
                            verbatimTextOutput("MeanHyp"),
                            p("t-test"),
                            verbatimTextOutput("ttest1"),
                            p("Outcome"),
                            verbatimTextOutput("hypresult")
                          )
                        )),
               tabPanel("Two Population",
                        fluidRow(
                          column(2, br(),
                                 wellPanel(
                                   selectInput(
                                     "Alpha1",
                                     h5("Alpha for Hypothesis Test"),
                                     choices = c("0.01", "0.05", "0.025")
                                   ),
                                   selectInput(
                                     "testtype1",
                                     h5("Type of Hypothesis Test"),
                                     choices = c("less", "greater", "two.sided")
                                   )
                                 )),
                          column(
                            7,
                            h4("Test of Mean with two population"),
                            h5("Testing the mean temperature of Beavers1 and Beavers2"),
=======
                                   numericInput("mu", "mu for mean hypothesis test", value = 5),
                                   
                                   
                                   
                                 )),
                          
                          column(
                            5,
                            h4("Test of Hypothesis with one population"),
                            h4("Mean of Input Variable "),
                            p("The P-Value is:"),
                            verbatimTextOutput("MeanHyp"),
                            h4("Variance of Input Variable"),
                            p("The P-Value is:"),
                            verbatimTextOutput("VarHyp")
                          ),
                          
                          
                        )),
               tabPanel("Two Population",
                        fluidRow(
                          column(
                            5,
                            h4("Test of Hypothesis with two population"),
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
                            p("SAMPLE 1"),
                            verbatimTextOutput("HypS1"),
                            p("SAMPLE 2"),
                            verbatimTextOutput("HypS2"),
                            p("Welch Two Sample t-test"),
                            verbatimTextOutput("ttest"),
                            p("Outcome"),
                            verbatimTextOutput("hyp2result")
<<<<<<< HEAD
                          )
                        ))
=======
                            
                            
                          )
                        ))
               
               
               
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
             )),
    
    
    tabPanel("Regression Model",
<<<<<<< HEAD
             tabsetPanel(
               tabPanel("Linear Regression",
                        fluidRow(
                          column(2, br(),
                                 
                                 wellPanel(
                                   sliderInput(
                                     "sliderMPG",
                                     "Input MPG for regression model?",
                                     min = 10,
                                     max = 35,
                                     value = 20
                                   ),
                                   checkboxInput("showmodel", 'Show/hide the predicted model', value = TRUE)
                                 )),
                          column(
                            5,
                            br(),
                            h4("Linear Regression Model", align = "middle"),
                            plotOutput("lmplot"),
                            p("Predicted Horsepower"),
                            verbatimTextOutput("pred", placeholder = TRUE)
                          )
                        )
               ),
               tabPanel("Poisson Regression",
                        fluidRow(
                          column(2, br(),
                                 wellPanel(
                                   numericInput("Age", "Enter Age:", value = 41 , min = 27, max=58),
                                   radioButtons("SocialDrinker","Social Drinker?:",c("No"=0, "Yes"=1 )),
                                   radioButtons("SocialSmoker","Social Smoker?:",c("No"=0, "Yes"=1 )),
                                   numericInput("BMI", "Enter BMI:", value = 23, min = 19, max =40)
                                   
                                 )),
                          column(
                            10,
                            br(),
                            h4("Details of Data set used:", align = "middle"),
                            h5("Dataset used has informtion on the count of absences of employees in a company in one year. 
                             We will use the data provided to predict the amount of leave days a person takes based on some of their health and social factors."),
                            h5("Some of the summary statistics can be seen below:"),
                            h5("The data set also contained "),
                            verbatimTextOutput("sumfile"),
                            h5("Count of social smokers"),
                            verbatimTextOutput("smokercount"),
                            h5("Count of social drinkers"),
                            verbatimTextOutput("drinkercount"),
                            h4("Poisson Regression Model", align = "middle"),
                            verbatimTextOutput("p_model"),
                            p("Prediction of days absent per year - based on input selected"),
                            verbatimTextOutput("ppred", placeholder = TRUE)
                          )
                        )
               )
             ) 
             
    )
  )
))
=======
             tabsetPanel(tabPanel(
               "Linear Regression",
               fluidRow(
                 column(2, br(),
                        
                        wellPanel(
                          sliderInput(
                            "sliderMPG",
                            "Input MPG for regression model?",
                            min = 10,
                            max = 35,
                            value = 20
                          ),
                          checkboxInput("showmodel", 'Show/hide the predicted model', value = TRUE)
                          
                          
                          
                          
                        )),
                 
                 column(
                   5,
                   br(),
                   h4("Linear Regression Model", align = "middle"),
                   plotOutput("lmplot"),
                   p("Predicted Horsepower"),
                   verbatimTextOutput("pred", placeholder = TRUE),
                   
                 )
                 
                 
               )
             ))),
    
    
    tabPanel("Deep Insights",
             fluidRow(column(2, br(
             ),)))
    
    
    
    
    
    
  )
))
>>>>>>> 9e44f716e02b8b11173bae98569ee80f25262519
