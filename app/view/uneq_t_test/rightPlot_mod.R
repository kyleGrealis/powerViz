box::use(
  shiny[moduleServer, NS, tagList, reactive, renderUI, uiOutput]
)

box::use(
  app/logic/plotCard,
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("rightPlot"))
  )
}

#' @export
server <- function(id, data, inputs){
  moduleServer(id, function(input, output, session) {
    
    plot <- reactive({
      plotCard$power_bar(
        data=data(), 
        n=inputs()$n1,
        effect_values=c(0.2, 0.5, 0.8),
        equal=FALSE,
        n2=inputs()$n2
      )
    })
    
    output$rightPlot <- renderUI({
      plotCard$plotting_cards(
        "Power at selected group sample sizes",
        plot()
      )
    })
    
  })
}
