library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
    output$out1 <- renderText(input$sliderCarat)
    model <- lm(price ~ carat, diamonds)
    model1pred <- reactive({
        caratInput <- input$sliderCarat
        predict(model, newdata = data.frame(carat = caratInput))
    })
    output$plot1 <- renderPlot({
        caratInput <- input$sliderCarat
        g <- ggplot(diamonds, aes(x= carat, y = price)) + geom_point(alpha=0.1, colour = "#00928B", shape =21) + geom_smooth(method=lm, se = FALSE, colour = "#A0097D")
        g <- g + xlim(0, 6) + ylim(300, 20000)
        dff <- data.frame(carat = caratInput,price = model1pred())
        g <- g + geom_point(data = dff, fill = "#FFBA49", colour="#A0097D", shape = 21, size = 2, stroke = 1) 
        g
    })
    output$pred1 <- renderText({
        model1pred()
    })
    
})