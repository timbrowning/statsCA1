
shinyUI(fluidPage(
  theme = shinytheme("simplex"),
  navbarPage(title = "",
             ####################################################################################################################################
             tabPanel("About",
                      
                      column(3),
                      column(7,br(),br(),br(),
                             withMathJax(h3("Task"),
                                         p("The main task here is to create an app which suits for Statistics and data analytics. It means that the app should allow you to do some descriptive or predictive analytics on a real dataset. "),
                                         h3("Instruction"),
                                         p(strong("1)"),"Import the data into app. Equivalently, In-built dataset might be used for analytics. "),
                                         p(strong("2)"),"Apply some descriptive analytics techniques on the dataset and visualize the quick insights"),
                                         p(strong("3)"),"Apply at least one probabilistic model e.g. discrete or continuous probability models on the dataset and visualize the insight"),
                                         p(strong("4)"),"Implement at least one hypothesis testing context and print out the decision in the shiny dashboard."),
                                         p(strong("5)"),"Apply at least one type of GLMs e.g. linear regression, logistic regression, Poisson regression on the dataset and visualize the model performance using an appropriate graph, e.g. ROC, performance plot, etc.  "),
                                         p(strong("5)"),"Visualize the deep insight in dashboard environment."),br(),br(),
                                         tags$img(src = "https://www.dbs.ie/images/default-source/logos/dbs-logo-2019-small.png",align="top")
                             ))),
             
             ####################################################################################################################################
             
             
             tabPanel("Descriptive Analytics",
                      tabsetPanel(
                        tabPanel("Dataset Summary",
                                 fluidRow(
                                   column(2,
                                          wellPanel(
                                            selectInput(inputId = "dataset", label = "Select a DataSet", choices = "iris") 
             
                                          )),
                                   
                                   column(5,h4("Summary", align = "middle"),verbatimTextOutput("header")),br(),br()
                                   
                                  )),
                        
                 ####################################################################################################################################
                        
                        tabPanel("Box Plots",
                                 fluidRow(
                                   column(2,
                                          wellPanel(
                                            
                                            selectInput(
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
                                   column(7,h4("Boxplot of the Iris",align = "middle"),plotOutput("plot1"),
                                   h4("Boxplot of the Variable A", align = "middle"),plotOutput("plot"))
                                   
                                   
                          ))
                        )),
             ####################################################################################################################################
             
             tabPanel("Discrete Probability Model",
                      tabsetPanel(
                        tabPanel("Hypergeometric",
                            fluidRow(
                              column(2,
                                     wellPanel(
                                     selectInput("variable", "Comparison Variable",
                                                 choices = c("Cylinder" = "cyl",
                                                             "Gear" = "gear",
                                                             "Carbon" = "carb"),
                                                 selected = "gear"
                                     ),
                                     
                                     numericInput("j", "Numbers of cars sampled", 5, min = 1, max = 32), 
                                     numericInput("a", "Numbers of cars with selected variable (a)", 2, min = 1, max = 32),
                                     
                                     conditionalPanel(
                                       condition = "input.variable == 'cyl'",
                                       radioButtons("cyl", "Choose Cylinder :",
                                                    c("4" = 4,
                                                      "6" = 6,
                                                      "8" = 8))
                                     ),
                                     
                                     conditionalPanel(
                                       condition = "input.variable == 'gear'",
                                       radioButtons("gear", "Choose Gear :",
                                                    c("3" = 3,
                                                      "4" = 4,
                                                      "5" = 5))
                                     ),
                                     
                                     conditionalPanel(
                                       condition = "input.variable == 'carb'",
                                       radioButtons("carb", "Choose Carbon :",
                                                    c("1" = 1, 
                                                      "2" = 2,
                                                      "3" = 3,
                                                      "4" = 4,
                                                      "6" = 6,
                                                      "8" = 8))
                                     ))),
                              
                              column(7,h4("Geometric Histogram",align = "middle"),plotOutput("histogram"),
                              h4("Table",align = "middle"),tableOutput("prob")))),
                            
                              #column(7,h4("Boxplot of the Iris",align = "middle"),verbatimTextOutput("prt"))
                              
                              tabPanel("Poisson",
                                       fluidRow(column(2,
                                                       wellPanel(
                                                      
                                                         numericInput("Y", "Input Y for Exp prob model", value = 1)

                                                         
                                                         
                                                         
                                                         
                                                       )
                                                       
                                                       ),
                                         column(4,h4("Poisson Probability Model - IRIS Dataset"),
                                         p("The probability the next poisson modelled", strong("var"), "is less than", strong("y"), "is:"),
                                         verbatimTextOutput("Poisprob"),
                                         
                                         p("The prediction for the next var modelled by poisson is:"),
                                         verbatimTextOutput("PoisX"))
                                         
                                         
                                       ))
                              
                          
                        
)))))