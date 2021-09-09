if(!require(shiny)) install.packages('shiny')
if(!require(dplyr)) install.packages('dplyr')
if(!require(dplyr)) install.packages('leaflet')
require(readr)
require(lubridate)

shinyServer(function(input, output) {
  sliderValues <- reactive({
    data.frame(
      Name = c("Tasa de Cambio",
               "Acometida",
               "Minero US",
               "KW/h",
               "Internet",
               "Uptime"),

      Value = as.character(c(input$cambio,
                             input$acometida,
                             input$minero,
                             input$kwh,
                             input$internet,
                             input$uptime
                             )),
      TotalPesos =  c(input$cambio,
                      input$acometida,
                      input$minero*input$cambio,
                      input$kwh,
                      input$internet,
                      input$uptime
                      ),
      stringsAsFactors = FALSE )
  })
  total <- reactive({
    data.frame(
      Totales = c("Total instalación",
                  "Costo por mes"),
      Valor = as.character(c(
        (input$minero * input$cambio + input$acometida) ,
        (input$kwh * input$uptime + input$internet)
      )),
      stringsAsFactors = FALSE)
  })

  output$values <- renderTable({
    sliderValues()
    #total()
 
  })
  output$total <- renderTable({
    total()
  })
})


