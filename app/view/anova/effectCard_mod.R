box::use(
  bsicons[bs_icon],
  bslib[value_box],
  shiny[moduleServer, NS, tagList, reactive, renderUI, uiOutput],
)

box::use(
  app/logic/anova,
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("effectInfo"))
  )
  
}

#' @export
server <- function(id, inputs){
  moduleServer(id, function(input, output, session) {
    
    effect <- reactive({ inputs()$effect })
    
    output$effectInfo <- renderUI({
      value_box(
        title = "Effect size:",
        value = effect(),
        showcase = bs_icon("graph-up-arrow"),
        theme = "white", full_screen = FALSE, fill = TRUE, height = 100L,
        class = "info-box"
      )
    })
    
  })
}
