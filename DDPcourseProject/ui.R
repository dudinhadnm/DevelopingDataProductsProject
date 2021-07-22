library(shiny)
shinyUI(fluidPage(
    tags$head(
        # Note the wrapping of the string in HTML()
        tags$style(HTML("
      body {
        background-color: #D3D4D9;
        color: black;
      }
      h2 {
        font-family: 'Yusei Magic', sans-serif;
        color: #A0097D
      }
      h3 {
        font-family: 'Yusei Magic', sans-serif;
        color: #A0097D
      }
      h4 {
        font-family: 'Yusei Magic', sans-serif;
        color: #A0097D
      }
      .shiny-input-container {
        color: #00928B;
      }"))
    ),
    titlePanel("Developing data products Course project"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderCarat", "How many carats in your diamond?", 0, 3, value = 0.4, step = 0.1),
            submitButton("Submit")
        ),
        mainPanel(
            tabsetPanel(type = "tabs", 
                        tabPanel("App page", 
                                 br(), 
                                 plotOutput("plot1"),
                                 br(),
                                 h4("Carat:"),
                                 textOutput("out1"), 
                                 br(), 
                                 h4("Predicted price from Model:"),
                                 textOutput("pred1")), 
                        tabPanel("Documentation", 
                                 br(), 
                                 h3("Documentation"), 
                                 h4("How to use this shiny app:"),
                                 p("Use the slider on the left side bar to 
                                   input a value for the weight of a diamond 
                                   (in carat), and click the Submit button to 
                                   see how much that diamond would cost according 
                                   to a linear regression calculated used from the 
                                   'diamonds' dataset"),
                                 h4("Model"),
                                 p("It calculates the price of a diamond with weight 
                                 x in carats, based on the diamonds database. The model 
                                 used is a simple linear regression:"),
                                 code("model <- lm(price ~ carat, diamonds)"),
                                 p("Given the model and the 
                                   value of carats that was input in the slider 
                                   on the side bar, the price is predicted as shown:"),
                                 code("predict(model, newdata = data.frame(carat = caratInput))"),
                                 h4("Other material"),
                                 tags$a(href="https://github.com/dudinhadnm/DevelopingDataProductsProject/blob/master/DDPcourseProject/ui.R", "ui.R code on GitHub"),
                                 br(),
                                 tags$a(href="https://github.com/dudinhadnm/DevelopingDataProductsProject/blob/master/DDPcourseProject/server.R", "server.R code on GitHub"))
            )
        )
    )
))
