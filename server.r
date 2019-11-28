library(shiny)
library("ggpubr")

shinyServer(function(input, output)
{
  #Descriptive Analytics
  output$header <- renderPrint({
    summary(iris)
  })
  
  # Box plot colored by groups: Species
  output$plot1 <- renderPlot({
    y <- (iris[, as.numeric(input$var)])
    ggboxplot(
      iris,
      x = "Species",
      y = "Sepal.Length",
      color = "Species",
      palette = c("#00AFBB", "#E7B800", "#FC4E07")
    )
  })
  
  
  #Descriptive Analytics
  output$plot <- renderPlot({
    x <- summary(iris[, as.numeric(input$var)])
    boxplot(x,
            col = "sky blue",
            border = "purple",
            main = names(iris[as.numeric(input$var)]))
  })
  
  output$histogram <- renderPlot({
    # CYLINDER
    
    if (input$variable == 'cyl') {
      # Create the dataset for calculation
      set.seed(length(mtcars$cyl))
      k <- length(which(mtcars$cyl == input$cyl))
      Data = rhyper(length(mtcars$cyl), k, length(mtcars$cyl) - k, input$j)
      
      # Put data into table format
      tab = table(Data)
      
      # Plot said table
      barplot(
        tab,
        col = 'darkslateblue',
        border = NA,
        main = c(
          "Probability of getting (a) cars from sample: ",
          round(dhyper(
            input$a, k, length(mtcars$cyl) - k, input$j
          ), 3)
        )
      )
    }
    
    if (input$variable == 'gear') {
      # Create the dataset for calculation
      set.seed(length(mtcars$gear))
      k <- length(which(mtcars$gear == input$gear))
      Data = rhyper(length(mtcars$gear), k, length(mtcars$gear) - k, input$j)
      
      # Put data into table format
      tab = table(Data)
      
      # Plot said table
      barplot(
        tab,
        col = 'darkslateblue',
        border = NA,
        main = c(
          "Probability of getting (a) cars from sample: ",
          round(dhyper(
            input$a, k, length(mtcars$gear) - k, input$j
          ), 3)
        )
      )
    }
    
    if (input$variable == 'carb') {
      # Create the dataset for calculation
      set.seed(length(mtcars$carb))
      k <- length(which(mtcars$carb == input$carb))
      Data = rhyper(length(mtcars$carb), k, length(mtcars$carb) - k, input$j)
      
      # Put data into table format
      tab = table(Data)
      
      # Plot said table
      barplot(
        tab,
        col = 'darkslateblue',
        border = NA,
        main = c(
          "Probability of getting (a) cars from sample: ",
          round(dhyper(
            input$a, k, length(mtcars$carb) - k, input$j
          ), 3)
        )
      )
    }
    
    output$prob <- renderPrint({
      print(paste('Selected Variable :', input$variable))
    })
    
  })
  #Exponential Probability Model
  output$Expprob <- renderPrint({
    lamda1 <- 1 / mean(warpbreaks[, as.numeric(input$var)])
    prob <- pexp(input$X, lamda1)
    print(prob)
  })
  output$ExpX <- renderPrint({
    lamda1 <- 1 / mean(warpbreaks[, as.numeric(input$var1)])
    pred1 = mean(rexp(1000, lamda1))
    print(pred1)
  })
  output$plotexp <- renderPlot ({
    par(mfrow = c(1, 2))
    lower <- floor(qexp(0.001, rate = 0.2))
    t <- seq(lower, input$max1, 0.1)
    plot(t, pexp(t, input$lam), type = 'b', main = "Plot of CDF")
    x1 = 0:input$max1
    y1 = dexp(x1, input$lam)
    plot(x1, y1, type = 'b', main = "pdf exp")
  })
  #Poisson Probability Model
  output$Poisprob <- renderPrint({
    lamda1 <- mean(iris[, as.numeric(input$var)])
    prob <- ppois(input$Y, lamda1)
    print(prob)
  })
  output$PoisX <- renderPrint({
    lamda1 <- mean(iris[, as.numeric(input$var)])
    pred1 = mean(rpois(1000, lamda1))
    print(pred1)
  })
  output$plotpois <- renderPlot ({
    par(mfrow = c(1, 2))
    x1 = 0:input$max1
    y1 = dpois(x1, input$lam)
    plot(
      x1,
      ppois(x1, input$lam),
      type = "b",
      ylab = "F(x)",
      main = "Poisson CDF"
    )
    plot(x1, y1, type = 'b', main = "pdf poisson")
  })
  #summary output created, retuning summ of mtcars$mpg variable
  
  output$summary <- renderPrint({
    summary(mtcars$mpg)
  })
  
  #pnorm function used to calculate difference from two input figures, returning result using print function
  
  output$normprob <- renderPrint({
    probability <- pnorm(input$input1,mean = mean(mtcars$mpg), sd = sd(mtcars$mpg)) - pnorm(input$input2,mean = mean(mtcars$mpg), sd = sd(mtcars$mpg))
    print(probability)
  })
  
  
  
  output$chart1 <- renderPlot({
    bars <- seq(min(x), max(x), length.out = input$barslider + 1)
    hist(mtcars$mpg, breaks = bars, col = 'blue', border = 'white')
  })
  
  
  #Hypothesis Test - One Pop
  output$MeanHyp <- renderPrint({
    x = iris[, as.numeric(input$var)]
    #y = data$Blocked
    t = t.test(x, mu = input$mu, alternative = input$testtype)
    if (t$p.value < as.numeric(input$Alpha)) {
      decision = "reject H_o"
    } else{
      decision = "accept H_o"
    }
    print(t$p.value)
    print(decision)
  })
  
  output$VarHyp <- renderPrint({
    x = (iris[, as.numeric(input$var1)])
    y = (iris[, as.numeric(input & var2)])
    #y = data$Blocked
    t1 = var.test(x, y, alternative = input$testtype)
    if (t1$p.value < as.numeric(input$Alpha)) {
      decision1 = "reject H_o"
    } else{
      decision1 = "accept H_o"
    }
    print(t1$p.value)
    print(decision1)
  })
  
  
  ########################################### Changes ####################################################################
  #Hypothesis Test - Two Pop
  
  
  output$HypS1 <- renderPrint({
    observations1 = nrow(beaver1)
    mean1 = mean(beaver1$temp)
    sd1 = sd(beaver1$temp)
    print(paste('Observations:', observations1))
    print(paste('Mean:', mean1))
    print(paste('Standard Deviation:', sd1))
    
    
  })
  
  output$HypS2 <- renderPrint({
    observations2 = nrow(beaver2)
    mean2 = mean(beaver2$temp)
    sd2 = sd(beaver2$temp)
    print(paste('Observations:', observations2))
    print(paste('Mean:', mean2))
    print(paste('Standard Deviation:', sd2))
    
    
  })
  output$ttest <- renderPrint({
    welch.test <- t.test(beaver1$temp, beaver2$temp)
    welch.test
    
    
  })
  
  output$hyp2result <- renderPrint({
    welch.test <- t.test(beaver1$temp, beaver2$temp)
    if (welch.test$p.value < as.numeric(input$Alpha)) {
      decision2 = "reject H_o"
    } else{
      decision2 = "accept H_o"
    }
    
    print(decision2)
    
    
    
    
  })
  
  ###############################################################################################################
  
  
  
  
  
  
  
  output$table <- renderTable({
    table(mtcars$cyl) / length(mtcars$cyl)
  })
  
  #Chi Square Plot
  
  output$chiPlot <- renderPlot({
    chi.values <- seq(0, 25, .1)
    plot(
      x = chi.values,
      y = dchisq(chi.values, df = 4),
      type = "l",
      xlab = expression(chi ^ 2),
      ylab = ""
    )
    mtext(side = 2, expression(f(chi ^ 2)), line = 2.5)
    lines(x = chi.values, y = dchisq(chi.values, df = 10))
    text(x = 6, y = .15, label = "df=4")
    text(x = 16, y = .07, label = "df=10")
  })
  
  model_lm <- lm(hp ~ mpg, data = mtcars)
  model_lm_pred <- reactive({
    mpgInput <- input$sliderMPG
    predict(model_lm, newdata = data.frame(mpg = mpgInput))
  })
  
  output$lmplot <- renderPlot({
    mpgInput <- input$sliderMPG
    plot(
      mtcars$mpg,
      mtcars$hp,
      xlab = "MPG",
      ylab = "Hoursepower",
      type = "p"
    )
    if (input$showmodel)
    {
      abline(model_lm, col = "red", lwd = 4)
    }
    points(
      mpgInput,
      model_lm_pred(),
      col = "blue",
      pch = 16,
      cex = 2
    )
  })
  output$pred <- renderText({
    model_lm_pred()
  })
  
})
