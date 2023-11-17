function(input, output, session) {
  
  observeEvent(input$berechnen, {
    
    output$katch_überschrift <- renderText({
      "Kalorienbedarf nach Katch McArdle:"
      })
    
    output$katch_grund <- renderPrint({
      
      gewicht <- input$gewicht  
      
      fett <- input$fett
      fett <- as.numeric(gsub("[^0-9]", "", fett))
      
      magergewicht <- gewicht * (1 - (fett / 100))
      
      grundkalorien <<- 370 + (21.6 * magergewicht)
      
      # Rückgabe des berechneten Wertes
      paste("Grundbedarf:", round(grundkalorien, digits = 0), "Kalorien")
    }) 
    
    output$katch_komplett <- renderPrint({
      
      pal <- input$pal
      pal <- as.numeric(gsub("[^0-9.]", "", pal))
      
      if (input$sport == "Nicht aktiv") {
        pal <- pal + 0
      } else if (input$sport == "Leicht aktiv") {
        pal <- pal + 0.1
      }
      else if (input$sport == "Moderat aktiv") {
        pal <- pal + 0.2
      }
      else if (input$sport == "Sehr aktiv") {
        pal <- pal + 0.275
      }
      else if (input$sport == "Extrem aktiv") {
        pal <- pal + 0.35
      }
      
      pal_harris <<- pal
      
      kalorien <- grundkalorien * pal
      
      # Rückgabe des berechneten Wertes
      paste("Kalorienbedarf:", round(kalorien, digits = 0), "Kalorien")
    })
      
      
    output$harris_überschrift <- renderText({
      "Kalorienbedarf nach Harris Benedict:"
    })
    
    
    output$harris_grund <- renderPrint({
      
      gewicht_harris <- input$gewicht
      groesse <- input$größe
      alter <- input$alter
      
      fett_harris <- input$fett
      fett_harris <- as.numeric(gsub("[^0-9]", "", fett_harris))
      
      grundkalorien_harris <<- 655.1 + (9.6 * gewicht_harris) + (1.8 * groesse) - (4.7 * alter)
      
      # Rückgabe des berechneten Wertes
      paste("Grundbedarf:", round(grundkalorien_harris, digits = 0), "Kalorien")
    }) 
    
    output$harris_komplett <- renderPrint({
      
      kalorien_harris <- grundkalorien_harris * pal_harris
      
      # Rückgabe des berechneten Wertes
      paste("Kalorienbedarf:", round(kalorien_harris, digits = 0), "Kalorien")
    })
    
    
  })

}
