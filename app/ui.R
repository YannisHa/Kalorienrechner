  ui <- fluidPage(
    # Hintergrundfarbe und Stile
    tags$head(
      tags$style(HTML("
            body {background-color: #f7f7f7;}
            .well {background-color: #ffffff; border-radius: 10px; padding: 20px; box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);}
            h2 {color: black; font-weight: bold;}
        "))
    ),
    
    # Titel der App mit FontAwesome-Icon
    titlePanel(
      div(
        style = "display: flex; align-items: center;",
        tags$h2("Kalorienrechner", style = "margin: 0;"),
        icon("apple-alt", style = "color: black; font-size: 30px; padding-left: 10px;")
      )
    ),
    
    # Sidebar Panel
    sidebarLayout(
      sidebarPanel(
        numericInput(
          "alter", 
          label = tags$span("Alter in Jahren: ", icon("user")), 
          value = 25,
          min = 1, 
          max = 120
        ),
        numericInput(
          "gewicht", 
          label = tags$span("Körpergewicht in kg: ", icon("weight")), 
          60,
          min = 1, 
          max = 350
        ),
        numericInput(
          "größe", 
          label = tags$span("Körpergröße in cm: ", icon("arrows-alt-v")), 
          175,
          min = 100, 
          max = 250
        ),
        pickerInput(
          "fett",
          "Körperfettanteil:",
          choices = paste0(1:50, "%"),
          selected = "20%",
          multiple = FALSE
        ),
        pickerInput(
          "pal",
          "PAL-Wert:",
          choices = c(
            "1.2: Immobile/Bettlägerig", 
            "1.3: Sehr leichte Tätigkeit", 
            "1.4: Leichte Bürotätigkeit", 
            "1.5: Leichte Bürotätigkeit mit mehr Bewegung", 
            "1.6: Leichte körperliche Arbeit", 
            "1.7: Moderate Arbeit", 
            "1.8: Stehende Tätigkeit", 
            "1.9: Aktive Berufe", 
            "2.0: Sehr aktive Berufe", 
            "2.1: Körperlich fordernd", 
            "2.2: Schwere Arbeit", 
            "2.3: Sehr schwere Arbeit", 
            "2.4: Extrem anstrengend"
          ),
          selected = "1.5: Leichte Bürotätigkeit mit mehr Bewegung",
          multiple = FALSE
        ),
        pickerInput(
          "sport",
          "Sportliche Aktivität:", 
          choices = c("Nicht aktiv", 
                      "Leicht aktiv", 
                      "Moderat aktiv", 
                      "Sehr aktiv", 
                      "Extrem aktiv"),
          selected = "Nicht aktiv"
        ),
        tags$hr(style="border-top: 1px solid black;"),
        actionButton(
          "berechnen",
          label = tags$span("Kalorienbedarf berechnen ", icon("calculator"))
        )
      ),
      
      # Main Panel
      mainPanel(
        textOutput("katch_überschrift"),
        verbatimTextOutput("katch_grund"),
        verbatimTextOutput("katch_komplett"),
        textOutput("harris_überschrift"),
        verbatimTextOutput("harris_grund"),
        verbatimTextOutput("harris_komplett")
      )
    ),
    
    # Creator Credits
    tags$footer(
      style = "position: fixed; left: 0; bottom: 0; width: 100%; background-color: white; text-align: left; padding: 10px;",
      "Created by ",
      tags$a(href = "https://www.linkedin.com/in/yannishasert/", "Yannis", target = "_blank"),
      " © 2023"
    )
  ) # Ende Fluid Page