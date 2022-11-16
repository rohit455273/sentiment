library(shiny)
library(shiny)
library(tm)
library(SentimentAnalysis)
library(SnowballC)
library(ggplot2)


options(cores=4)
#x=readtext::readtext("WWW/xe.xls")

s=magick::image_read("WWW/s.jpg")
f=magick::image_read("WWW/f.png")
n=magick::image_read("WWW/n.png")


ui <- fluidPage(
  
  titlePanel("Sentiment Analysis App")
  ,
tags$link(rel="stylesheet",href="l.css"),tags$br(),tags$br(),tags$br(),tags$br(),tags$br(),tags$br(),
  
   fluidRow(column(6,textAreaInput("i","copy paste text here"),offset=3), 
            fluidRow(column(6,verbatimTextOutput("l"),offset=3)))

)

server <- function(input, output, session) {
  
  
  q=reactiveValues(q=s)
  x=reactive({
    req(input$i)
    x=SentimentAnalysis::analyzeSentiment(( input$i))
    xx=convertToBinaryResponse(x)$SentimentQDAP
    xx})
  
 c= reactive({
    cx=paste("Your text is" ,x())
    cx
  })
 
  output$l<-renderPrint({
    
    c()
    
  })
  
  
}

shinyApp(ui, server)