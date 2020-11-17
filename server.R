library(shiny)
library(ggplot2)
library(MASS)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
    #----- PART I: HISTOGRAM
  
    # Extract the column of interest from the Boston Dataset and save the column
    # Reactive is used like a function!

    histVal <- reactive({
        Boston[, input$histX]
    })
  
    # Make the histogram
    output$HistOneVar <- renderPlot({
        hist(Boston[, input$histX],
            # Set the breaks according the number of bins
            breaks = seq(min(histVal()) , max(histVal()), length.out = input$bins + 1),
            # Get the min and max for each column - call histVal AS A FUNCTION!
            xlab = input$histX, 
            main = paste('Distribution of', input$histX),
            col = 'darkgray', 
            border = 'white')
    })
  
  
    #----- PART II: SCATTER PLOT
    
    # Extract the columns of intersect from the Boston dataset and save the data
    scatX <- reactive({
        Boston[, input$scatterX]
    })
  
    scatY <- reactive({
        Boston[, input$scatterY]
    })
    
    scatCol <- reactive({
        Boston[, input$scatterCol]
    })
  
    # Make the Scatter Plot
    output$ScatThreeVar <- renderPlot({
        ggplot(data = Boston, aes(x = scatX(), y = scatY(), color = scatCol())) +
        geom_point() +
        xlab(input$scatterX) + ylab(input$scatterY) +
        labs(colour = input$scatterCol) +
        ggtitle(paste('Scatter plot of', input$scatterX, 'vs', input$scatterY)) +
        theme(plot.title = element_text(hjust = 0.5))
    })


})
