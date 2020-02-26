library(shiny)
library(seoR)
library(rlist)
ui <- fluidPage(
  
 
  titlePanel("Enter your text here"),
  sidebarLayout(
    sidebarPanel(
      
      downloadButton("downloadData", "Download"),
      
      textInput("text_input","enter your keyword here")
      
    ),

    mainPanel(

      paste("your preview is"),
      textOutput("text_output")
      
      
    )
  )
)

server <- function(input, output) {
  output$text_output <- renderText({
    p = c()
    key = input$text_input
    for (i in 1:26) {
      y = paste(key,intToUtf8(i+96),sep = " ")
      p[i]=(googleSuggest(y))
    }
    (paste(p[[1]]))
    
  })
  
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("data.csv")
    },
    content = function(file) {
      p = c()
      key = input$text_input
      for (i in 1:26) {
        y = paste(key,intToUtf8(i+96),sep = " ")
        p[i]=(googleSuggest(y))
      }
      write.csv(data.frame(p[[1]],p[[2]],p[[3]],p[[4]],p[[5]],p[[6]],p[[7]],p[[8]],p[[9]],p[[10]],p[[11]],p[[12]],p[[13]],p[[14]],p[[15]],p[[16]],p[[17]],p[[18]],p[[19]],p[[20]],p[[21]],p[[22]],p[[23]],p[[24]],p[[25]],p[[26]]), file, row.names = FALSE)
    }

  )
  
  
  
}

shinyApp(ui = ui, server = server)
