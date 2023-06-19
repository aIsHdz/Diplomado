library(shiny)
library(shinythemes)
library(datasets)
library(readr)
library(ggplot2)

UsuariosLenguasExtranjeras2017 <- read_csv("UsuariosLenguasExtranjeras2017.csv")

ui <- fluidPage(theme = shinytheme("slate"),
                navbarPage(
                  "Usuarios de lenguas extranjeras atendidos",
                  
                  #Panel 1
                  
                  tabPanel(
                    
                    #Titulo del panel
                    
                    titlePanel("Atendidos por CENLEX"),
                    
                    #Menu desplegable
                    
                    sidebarLayout(
                      sidebarPanel(
                        selectInput("gender", "Genero:",
                                    choices=list("CENLEX_HOMBRES","CENLEX_MUJERES")
                                    )
                        ),
                      mainPanel(
                        plotOutput("cenlex")
                        )
                      )
                    ),
                  
                  #Panel 2
                  
                  tabPanel(
                    titlePanel("Atendidos por CELEX"),
                    
                    #Menu desplegable
                    
                    sidebarLayout(
                      sidebarPanel(
                        selectInput("genero", "Genero:",
                                            choices=list("CELEX_HOMBRES","CELEX_MUJERES")
                                            )
                              ),
                              mainPanel(
                                plotOutput("celex")
                              )
                            )
                  ),
                  
                  #Panel 3
                  
                  tabPanel(
                    titlePanel("Under construction"),
                    
                    mainPanel(
                      plotOutput("idioma1")
                      )
                    )
                  )

)

# Servidor
server <- function(input, output) {
  
  #Plot panel 1
  
  output$cenlex <- renderPlot({
    plot(as.matrix(UsuariosLenguasExtranjeras2017[,input$gender]),
         type="b",
         col="#09A9A0",
         cex=3,
         main=input$gender,
         xlab="Idioma")
    
    axis(1,at=1:6,labels=c("Ingles","Frances","Aleman","Italiano","Japones","Otro"))
    })
  
  #Plot panel 2
  
  output$celex <- renderPlot({
    plot(as.matrix(UsuariosLenguasExtranjeras2017[,input$genero]),
         type="b",
         col="#09A9A0",
         cex=3,
         main=input$genero,
         xlab="Idioma")
    
    axis(1,at=1:6,labels=c("Ingles","Frances","Aleman","Italiano","Japones","Otro"))
  })
  
  #Plot panel 3
  
  output$idioma1 <- renderPlot({
    
    par(mfrow=c(2,2)) # indica que los graficos van en la misma ventana
    

      plot(as.matrix(UsuariosLenguasExtranjeras2017[,"CENLEX_HOMBRES"]),
           type="b",
           col="blue",
           cex=3,
           main=input$genero,
           ylab="Grupo",
           xlab="Idioma")
      
      axis(1,at=1:6,labels=c("Ingles","Frances","Aleman","Italiano","Japones","Otro"))
    
      plot(as.matrix(UsuariosLenguasExtranjeras2017[,"CENLEX_MUJERES"]),
           type="b",
           col="red",
           cex=3,
           main=input$genero,
           ylab="Grupo",
           xlab="Idioma")
      
      axis(1,at=1:6,labels=c("Ingles","Frances","Aleman","Italiano","Japones","Otro"))
      
      plot(as.matrix(UsuariosLenguasExtranjeras2017[,"CELEX_HOMBRES"]),
           type="b",
           col="#09A9A0",
           cex=3,
           main=input$genero,
           ylab="Grupo",
           xlab="Idioma")
      
      axis(1,at=1:6,labels=c("Ingles","Frances","Aleman","Italiano","Japones","Otro"))
      
      plot(as.matrix(UsuariosLenguasExtranjeras2017[,"CELEX_MUJERES"]),
           type="b",
           col="pink",
           cex=3,
           main=input$genero,
           ylab="Grupo",
           xlab="Idioma")
      
      axis(1,at=1:6,labels=c("Ingles","Frances","Aleman","Italiano","Japones","Otro"))
    
    })
  }

# 
shinyApp(ui = ui, server = server)
