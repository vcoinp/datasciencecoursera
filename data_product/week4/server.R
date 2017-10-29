library(shiny)


shinyServer(function(input, output) {
  dataSelected <- reactive({
  Setosa <- ifelse(input$showSetosa,"setosa","")
  Versicolor <- ifelse(input$showVersicolor,"versicolor","")
  Virginica <- ifelse(input$showVirginica,"virginica","")
  
  selection <- c(Setosa,Versicolor,Virginica)
  
  irisDataSet <- iris[ which(iris$Species %in% selection),]})
  output$distPlot <- renderPlot({
    irisDataSet <- dataSelected()
    # draw scatterplot based on selection of species
    plot(irisDataSet$Petal.Length, irisDataSet$Petal.Width, pch=21, bg = irisDataSet$Species
         , main = "Species by Petal length and Petal width"
         , xlab = "Petal length", ylab = "Petal width", xlim =c(1,7),ylim =c(0,3))
    legend("bottomright",title="Species",legend=c("Setosa","Versicolor","Virginica"), pch=19, col=c("black","red", "green"))
    
  })
  output$numSamples <- renderText({
    irisDataSet <- dataSelected()   
    length(irisDataSet$Species)
  })
  
})
