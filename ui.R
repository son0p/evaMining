library(shiny)
library(leaflet)

ui <- function(request) {
  bootstrapPage(
    tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
     # App title ----
  titlePanel("Mineria"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(position = "right",
    sidebarPanel(
      strong(" ===== Variables de ocasión ======== "),
      sliderInput("cambio", "Tasa de cambio", min = 2000, max = 5000, value = 3816 ),
      strong(" ==== Costos instalación ==== "),
      sliderInput("acometida", "Acometida Electrica", min = 200000, max = 5000000, value = 500000),
       sliderInput("minero", "Costo Minero US", min = 700, max = 3000,value = 1400 ),
      strong(" ==== Costos fijos Mes ===="),
       sliderInput("kwh", "Costo KW/h", min = 195, max = 700,value = 590 ),
      a("Tarifas EPM",  href="https://www.epm.com.co/site/clientes_usuarios/clientes-y-usuarios/hogares-y-personas/energ%C3%ADa/tarifas"),
      sliderInput("internet", "Costo Internet", min = 50000, max = 500000, value = 200000),
      strong(" === Costos Variables Mes ====  "),
      sliderInput("uptime", "Uptime (Horas)", min = 40, max = (24*30), value = 680),
      strong("==== Calculador de utilidad ==== " ),
      sliderInput("hasrate", "Hash Rate GH/s", min = 5000, max = 30000, value = 8000),
      sliderInput("power", "Power (Watts)", min = 1000, max = 30000, value = 2600),
      numericInput("poolFees", "Pool Fees %", value = 2),
      numericInput("dificulty", "Bitcoin dificulty",  value = 18415156832118.00 ),
      numericInput("blockReward", "Block Reward",  value = 6.25 ),
      numericInput("bitcoin2USD", "Bitcoin en dolares",  value = 8533  )
    ),
# Main panel for displaying outputs ----
    mainPanel(
      tableOutput("values"),
      tableOutput("total")
    )
    )
)
}
