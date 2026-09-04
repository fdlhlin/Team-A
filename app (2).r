library(shiny)
library(bslib)
library(bsicons)
library(DT)
library(ggplot2)

ui <- navbarPage(
  id = "main_nav",
  title = span("StatVision", style = "font-weight: 700; font-size: 20px; letter-spacing: 0.5px;"),
  theme = bs_theme(
    version = 5,
    bootswatch = "flatly",
    primary = "#2C3E50",
    secondary = "#18BC9C",
    base_font = font_google("Inter"),
    heading_font = font_google("Outfit")
  ),
  
  header = tags$head(
    tags$style(HTML("
      body {
        background-color: #F8F9FA;
        color: #333333;
      }

      .custom-card {
        background: #FFFFFF;
        border-radius: 12px;
        border: 1px solid #E2E8F0;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
        padding: 24px;
        margin-bottom: 20px;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
      }
      .custom-card-header {
        font-weight: 700;
        font-size: 16px;
        color: #2C3E50;
        padding-bottom: 12px;
        margin-bottom: 16px;
        border-bottom: 2px solid #F1F3F5;
        display: flex;
        align-items: center;
      }

      .feature-card {
        background: #FFFFFF;
        border-radius: 12px;
        border: 1px solid #E2E8F0;
        padding: 28px 20px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
        text-align: center;
        height: 100%;
      }
      .feature-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
      }

      .form-control, .form-select {
        border-radius: 8px;
        border: 1px solid #CED4DA;
        padding: 8px 12px;
      }
      .form-control:focus, .form-select:focus {
        border-color: #18BC9C;
        box-shadow: 0 0 0 0.2rem rgba(24, 188, 156, 0.15);
      }

      pre.result-box {
        background-color: #F8F9FA;
        border: 1px solid #E9ECEF;
        border-left: 5px solid #18BC9C;
        border-radius: 8px;
        padding: 18px;
        font-family: 'Inter', sans-serif;
        font-size: 14px;
        color: #2C3E50;
        line-height: 1.6;
        white-space: pre-wrap;
      }

      @keyframes floatIcon {
        0% { transform: translateY(0px); }
        50% { transform: translateY(-12px); }
        100% { transform: translateY(0px); }
      }

      .hero-text {
        position: relative;
        z-index: 2;
        animation: wiggleText 5s ease-in-out infinite;
      }

      @keyframes wiggleText {
        0% { transform: translateY(0px) rotate(0deg); }
        25% { transform: translateY(-3px) rotate(-0.4deg); }
        50% { transform: translateY(0px) rotate(0.4deg); }
        75% { transform: translateY(3px) rotate(-0.3deg); }
        100% { transform: translateY(0px) rotate(0deg); }
      }

      .how-box {
        background: linear-gradient(135deg, #F4FCF9 0%, #ECF9F5 100%) !important;
        border: 1px solid #CFE3F8 !important;
        border-top: 4px solid #18BC9C !important;
        border-radius: 14px !important;
        padding: 22px 30px 26px 30px !important;
        margin-top: 25px !important;
        margin-bottom: 18px !important;
        box-shadow: 0 5px 18px rgba(44, 62, 80, 0.06) !important;
      }

      .how-title {
        text-align: center;
        font-size: 20px;
        color: #102B4D;
        font-weight: 800;
        letter-spacing: 0.5px;
        margin-bottom: 22px;
      }

      .how-grid {
        display: grid;
        grid-template-columns: 1fr 48px 1fr 48px 1fr;
        align-items: center;
        gap: 10px;
      }

      .how-step {
        display: flex;
        align-items: center;
        gap: 16px;
        padding: 4px 8px;
      }

      .how-icon {
        width: 70px;
        height: 70px;
        min-width: 70px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 28px;
      }

      .icon-blue { color: #2488E8; background: #EDF6FF; }
      .icon-teal { color: #19AFA3; background: #EDF9F7; }
      .icon-purple { color: #7356D8; background: #F2EFFE; }

      .step-text strong {
        color: #000000 !important;
        display: block;
        margin-bottom: 5px;
        font-size: 15px;
      }

      .step-text span {
        color: #333333 !important;
        font-size: 13px;
        line-height: 1.5;
      }

      .step-number {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 25px;
        height: 25px;
        border-radius: 50%;
        color: white !important;
        font-weight: 700;
        margin-right: 7px;
      }

      .num-blue { background: #2488E8; }
      .num-teal { background: #19AFA3; }
      .num-purple { background: #7356D8; }

      .how-arrow {
        color: #8FA9C2;
        font-size: 25px;
        text-align: center;
      }

      .guide-banner {
        display: flex;
        align-items: center;
        gap: 22px;
        background: linear-gradient(90deg, #F2F7FC 0%, #E6EFF8 100%);
        border: 1px solid #BFEDE3;
        border-radius: 14px;
        padding: 22px 28px;
        margin-top: 18px;
        margin-bottom: 20px;
        box-shadow: 0 5px 18px rgba(44, 62, 80, 0.04);
      }

      .guide-icon {
        width: 72px;
        height: 72px;
        min-width: 72px;
        border-radius: 50%;
        background: white;
        color: #2C3E50;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 30px;
      }

      .guide-title {
        margin: 0 0 5px 0;
        color: #102B4D;
        font-size: 26px;
        font-weight: 800;
      }

      .guide-copy {
        margin: 0;
        color: #65758B;
        font-size: 15px;
      }

      .guide-button {
        margin-left: auto;
        background: #2C3E50 !important;
        border-color: #2C3E50 !important;
        color: white !important;
        border-radius: 12px !important;
        padding: 11px 20px !important;
        font-weight: 600 !important;
      }

      .guide-button:hover {
        background: #213547 !important;
        border-color: #213547 !important;
      }

      .team-strip {
        background: #FFFFFF;
        border: 1px solid #E4EBF3;
        border-radius: 12px;
        padding: 14px 24px;
        margin: 15px 0 18px 0;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 25px;
        box-shadow: 0 3px 12px rgba(44, 62, 80, 0.04);
      }

      .team-heading {
        display: flex;
        align-items: center;
        gap: 12px;
        color: #102B4D;
        font-size: 17px;
        font-weight: 800;
        white-space: nowrap;
      }

      .team-main-icon {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        background: #EAF4FF;
        color: #2488E8;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
      }

      .team-members {
        display: flex;
        align-items: center;
        justify-content: flex-end;
        gap: 10px;
        flex: 1;
        flex-wrap: nowrap;
        min-width: 0;
      }

      .team-member {
        display: flex;
        align-items: center;
        gap: 7px;
        color: #1F4E8C;
        font-size: 13px;
        font-weight: 500;
        background: #EEF6FF;
        border: 1px solid #B9D8FF;
        border-radius: 10px;
        padding: 8px 12px;
        white-space: nowrap;
        flex-shrink: 0;
      }

      .btn-primary, .btn-default {
        border-radius: 8px !important;
        font-weight: 600 !important;
      }
      
      .nav-tabs .nav-link.active {
        border-bottom: 3px solid #18BC9C !important;
        font-weight: bold;
      }
    "))
  ),
  
  tabPanel(
    title = "Home",
    div(
      class = "team-strip",
      div(
        class = "team-heading",
        div(class = "team-main-icon", icon("users")),
        span("Project Team & Members")
      ),
      div(
        class = "team-members",
        div(class = "team-member", icon("user"), span("Diyarshni Prakash")),
        div(class = "team-member", icon("user"), span("Fadlhlin Basyirah")),
        div(class = "team-member", icon("user"), span("Fahimah Aqilah")),
        div(class = "team-member", icon("user"), span("Muhammad Fitrie Iman")),
        div(class = "team-member", icon("user"), span("PKDT Fakhrul Hazim"))
      )
    ),
    div(
      style = "background: linear-gradient(135deg, #2C3E50 0%, #34495E 100%); 
               color: white; 
               padding: 50px 30px; 
               border-radius: 12px; 
               margin: 15px 0 30px 0; 
               text-align: center; 
               box-shadow: 0 6px 20px rgba(44, 62, 80, 0.15);
               position: relative;
               overflow: hidden;",
      
      div(
        icon("chart-bar"),
        style = "position: absolute; left: 65px; top: 75px; font-size: 110px; color: #4A90E2; opacity: 0.28; pointer-events: none; animation: floatIcon 4s ease-in-out infinite;"
      ),
      div(
        icon("chart-pie"),
        style = "position: absolute; right: 75px; top: 70px; font-size: 120px; color: #20B8AE; opacity: 0.32; pointer-events: none; animation: floatIcon 5s ease-in-out infinite;"
      ),
      
      div(
        class = "hero-text",
        h1("Data Insight Hub", style = "font-weight: 700; margin-bottom: 12px; font-size: 2.4rem;"),
        h4("Interactive Statistical Analysis Platform", style = "opacity: 0.85; margin-bottom: 24px; font-weight: 300;"),
        p(
          "Upload your dataset to perform descriptive statistics, dynamic visual analysis, hypothesis testing, and regression modeling seamlessly.",
          style = "font-size: 16px; max-width: 680px; margin: 0 auto 28px auto; line-height: 1.6; opacity: 0.95;"
        ),
        span(
          "⚡ Begin by selecting the Data Input tab and uploading a CSV dataset.",
          style = "background-color: rgba(255, 255, 255, 0.15); backdrop-filter: blur(5px); padding: 10px 24px; border-radius: 30px; font-size: 14px; font-weight: 500; letter-spacing: 0.3px;"
        )
      )
    ),
    
    fluidRow(
      column(
        width = 4,
        div(
          class = "feature-card",
          style = "border-top: 4px solid #2C3E50 !important;",
          h4("📊 Exploratory Data", style = "font-weight: 600; color: #2C3E50; margin-bottom: 12px;"),
          p("Upload CSV datasets and inspect numerical and categorical summary statistics effortlessly.", style = "color: #6C757D; font-size: 14px; line-height: 1.5;")
        )
      ),
      column(
        width = 4,
        div(
          class = "feature-card",
          style = "border-top: 4px solid #18BC9C !important;",
          h4("📉 Dynamic Plots", style = "font-weight: 600; color: #2C3E50; margin-bottom: 12px;"),
          p("Visualize distribution trends through Histograms, Density Curves, Bar Charts, and Pie Charts.", style = "color: #6C757D; font-size: 14px; line-height: 1.5;")
        )
      ),
      column(
        width = 4,
        div(
          class = "feature-card",
          style = "border-top: 4px solid #3498DB !important;",
          h4("🧪 Hypothesis Testing", style = "font-weight: 600; color: #2C3E50; margin-bottom: 12px;"),
          p("Execute automated One-Sample and Two-Sample T-Tests and Z-Tests with instant outputs.", style = "color: #6C757D; font-size: 14px; line-height: 1.5;")
        )
      )
    ),
    
    div(
      class = "how-box",
      div("HOW IT WORKS", class = "how-title"),
      div(
        class = "how-grid",
        div(
          class = "how-step",
          div(class = "how-icon icon-blue", icon("cloud-arrow-up")),
          div(
            class = "step-text",
            strong(span("1", class = "step-number num-blue"), "Upload Data"),
            span("Import your CSV dataset quickly and securely.")
          )
        ),
        div(class = "how-arrow", HTML("&rarr;")),
        div(
          class = "how-step",
          div(class = "how-icon icon-teal", icon("magnifying-glass")),
          div(
            class = "step-text",
            strong(span("2", class = "step-number num-teal"), "Explore & Visualize"),
            span("Generate statistics and interactive plots to understand your data.")
          )
        ),
        div(class = "how-arrow", HTML("&rarr;")),
        div(
          class = "how-step",
          div(class = "how-icon icon-purple", icon("bullseye")),
          div(
            class = "step-text",
            strong(span("3", class = "step-number num-purple"), "Test & Model"),
            span("Run hypothesis tests and build regression models with ease.")
          )
        )
      )
    ),
    div(
      class = "guide-banner",
      div(class = "guide-icon", icon("book-open")),
      div(
        class = "guide-text",
        h3("New to StatVision?", class = "guide-title"),
        p("Check out our User Guide on how to navigate.", class = "guide-copy")
      ),
      actionButton(
        inputId = "go_guide",
        label = tagList(icon("book-open"), " Go to User Guide ", icon("arrow-right")),
        class = "guide-button"
      )
    )
  ),
  
  tabPanel(
    title = "Data Input",
    br(),
    fluidRow(
      column(
        width = 4,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "📁 Upload Dataset"),
          fileInput(
            inputId = "file",
            label = "Choose a CSV file:",
            accept = ".csv"
          ),
          tags$p(
            "CSV file must include column headers and contain no missing values.",
            style = "font-size: 13px; color: #6c757d; font-style: italic; margin-top: -8px;"
          )
        ),
        div(
          class = "custom-card",
          div(class = "custom-card-header", "ℹ️ Dataset Overview"),
          layout_column_wrap(
            width = 1,
            value_box(
              title = "Total Rows",
              value = textOutput("row_count_val"),
              showcase = bsicons::bs_icon("table"),
              theme = "primary"
            ),
            value_box(
              title = "Total Columns",
              value = textOutput("column_count_val"),
              showcase = bsicons::bs_icon("columns"),
              theme = "info"
            ),
            value_box(
              title = "Missing Values",
              value = textOutput("missing_count_val"),
              showcase = bsicons::bs_icon("exclamation-triangle"),
              theme = "warning"
            )
          )
        )
      ),
      column(
        width = 8,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "🔍 Interactive Data Preview"),
          DTOutput("data_table")
        )
      )
    )
  ),
  
  tabPanel(
    title = "Descriptive Statistics",
    br(),
    fluidRow(
      column(
        width = 4,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "⚙️ Variable Selection"),
          uiOutput("quantitative_variable"),
          br(),
          uiOutput("qualitative_variable")
        )
      ),
      column(
        width = 8,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "🔢 Quantitative Summary"),
          DTOutput("quantitative_summary")
        ),
        div(
          class = "custom-card",
          div(class = "custom-card-header", "🔤 Qualitative Summary"),
          DTOutput("qualitative_summary")
        )
      )
    )
  ),
  
  tabPanel(
    title = "Visualizations",
    br(),
    fluidRow(
      column(
        width = 2,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "🎨 Plot Controls"),
          radioButtons(
            inputId = "data_type",
            label = "Select Data Type:",
            choices = c("Quantitative" = "quantitative", "Qualitative" = "qualitative"),
            selected = "quantitative",
            inline = TRUE
          ),
          hr(style = "margin: 15px 0; border-color: #E9ECEF;"),
          conditionalPanel(
            condition = "input.data_type == 'quantitative'",
            uiOutput("plot_quantitative_variable"),
            selectInput(
              inputId = "quantitative_plot_type",
              label = "Select Plot Type:",
              choices = c("Histogram" = "histogram", "Density Curve" = "density")
            ),
            conditionalPanel(
              condition = "input.quantitative_plot_type == 'histogram'",
              uiOutput("bin_width_ui")
            )
          ),
          conditionalPanel(
            condition = "input.data_type == 'quantitative' &&
              input.quantitative_plot_type == 'density'",
            sliderInput(
              inputId = "bandwidth_adjust",
              label = "Bandwidth Adjustment:",
              min = 0.5,
              max = 2,
              value = 1,
              step = 0.1
            )
          ),  
          conditionalPanel(
            condition = "input.data_type == 'qualitative'",
            uiOutput("plot_qualitative_variable"),
            selectInput(
              inputId = "qualitative_plot_type",
              label = "Select Plot Type:",
              choices = c("Bar Chart" = "bar", "Pie Chart" = "pie")
            ),
            conditionalPanel(
              condition = "input.qualitative_plot_type == 'bar'",
              radioButtons(
                inputId = "bar_measure",
                label = "Display Bar Chart As:",
                choices = c(
                  "Frequency" = "frequency",
                  "Percentage (%)" = "percentage"
                ),
                selected = "frequency",
                inline = TRUE
              ),
              radioButtons(
                inputId = "bar_order",
                label = "Sort Bar Chart:",
                choices = c(
                  "Original Order" = "original",
                  "Highest to Lowest" = "descending"
                ),
                selected = "original",
                inline = TRUE
              )
            )
          )
        )
      ),
      column(
        width = 10,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "📈 Dynamic Visualization"),
          plotOutput(outputId = "data_plot", height = "400px")
        )
      )
    )
  ),
  
  tabPanel(
    title = "Hypothesis Testing",
    br(),
    fluidRow(
      column(
        width = 4,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "⚙️ Test Configuration"),
          radioButtons(
            "sample_type", "Sample Structure:",
            choices = c("One-Sample" = "one", "Two-Sample" = "two"),
            selected = "one"
          ),
          selectInput("variable", "Select Continuous Variable:", choices = NULL, selectize = FALSE),
          conditionalPanel(
            condition = "input.sample_type == 'two'",
            selectInput("group_variable", "Select Grouping Variable:", choices = NULL, selectize = FALSE)
          ),
          radioButtons(
            "test_type", "Test Type:",
            choices = c("T-test" = "t", "Z-test" = "z"),
            selected = "t"
          ),
          numericInput("mu", "Hypothesized Mean / Difference:", value = 0),
          numericInput("alpha", "Significance Level (α):", value = 0.05, min = 0.001, max = 0.50, step = 0.01),
          conditionalPanel(
            condition = "input.test_type == 'z'",
            numericInput("population_sd", "Population Standard Deviation:", value = 1, min = 0.0001)
          ),
          br(),
          actionButton("perform_test", "Perform Hypothesis Test", class = "btn-primary w-100")
        )
      ),
      column(
        width = 8,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "📋 Hypothesis Test Result"),
          verbatimTextOutput("test_result")
        )
      )
    )
  ),
  
  tabPanel(
    title = "Correlation & Regression",
    br(),
    fluidRow(
      column(
        width = 4,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "🔗 Correlation Analysis"),
          selectInput("cor_x", "Select X Variable:", choices = NULL, selectize = FALSE),
          selectInput("cor_y", "Select Y Variable:", choices = NULL, selectize = FALSE),
          radioButtons(
            "cor_method", "Correlation Method:",
            choices = c("Pearson" = "pearson", "Spearman" = "spearman"),
            selected = "pearson"
          ),
          actionButton("run_correlation", "Calculate Correlation", class = "btn-primary w-100")
        )
      ),
      column(
        width = 8,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "📋 Correlation Output"),
          verbatimTextOutput("cor_result"),
          br(),
          plotOutput("scatter_plot", height = "350px")
        )
      )
    ),  
    hr(),
    fluidRow(
      column(
        width = 4,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "📈 Linear Regression"),
          selectInput("reg_x", "Independent Variable (X):", choices = NULL, selectize = FALSE),
          selectInput("reg_y", "Dependent Variable (Y):", choices = NULL, selectize = FALSE),
          actionButton("run_regression", "Run Regression", class = "btn-primary w-100")
        )
      ),
      column(
        width = 8,
        div(
          class = "custom-card",
          div(class = "custom-card-header", "📋 Regression Output"),
          verbatimTextOutput("reg_result"),
          br(),
          h5("Scatter Plot with Regression Line 📊", style = "font-weight: 600; color: #2C3E50;"),
          plotOutput("regression_plot", height = "350px"),
          br(),
          h5("Diagnostic Residual Plot", style = "font-weight: 600; color: #2C3E50;"),
          plotOutput("residual_plot", height = "350px")
        )
      )
    )
  ),
  
  tabPanel(
    title = "User Guide",
    value = "guide",
    fluidPage(
      style = "max-width: 900px; margin: 0 auto; padding-top: 10px;",
      h2("StatVision User Guide", style = "font-weight: 700; color: #2C3E50; margin-bottom: 25px;"),
      div(
        class = "custom-card",
        style = "border-left: 5px solid #8B1E1E;",
        h5("⚠️ Important Considerations", style = "font-weight: 600; color: #8B1E1E;"),
        tags$ul(
          style = "color: #8B1E1E; padding-left: 20px;",
          tags$li("Ensure your uploaded file uses standard CSV encoding with clear column headers."),
          tags$li("Quantitative variables must contain strictly numeric data types."),
          tags$li("Missing values (`N/A`) are automatically ignored during calculation standard routines.")
        )
      ),
      div(
        class = "custom-card",
        style = "border-left: 5px solid #2C3E50;",
        h5("1. Data Input", style = "font-weight: 600; color: #2C3E50;"),
        p("Upload a standard CSV file to initialize your session. The dataset preview grid displays interactive pagination and summary stats automatically.", style = "color: #555;")
      ),
      div(
        class = "custom-card",
        style = "border-left: 5px solid #18BC9C;",
        h5("2. Descriptive Statistics", style = "font-weight: 600; color: #2C3E50;"),
        p("Analyze numeric variables for central tendency (Mean, Median), dispersion (SD, IQR, Min, Max), and missingness. Categorical variables display frequency counts and percentages.", style = "color: #555;")
      ),
      div(
        class = "custom-card",
        style = "border-left: 5px solid #3498DB;",
        h5("3. Visualizations", style = "font-weight: 600; color: #2C3E50;"),
        p("Generate high-resolution ggplot graphs including interactive Histograms with adjustable bin widths, Kernel Density estimates, Bar charts, and Pie charts.", style = "color: #555;")
      ),
      div(
        class = "custom-card",
        style = "border-left: 5px solid #9B59B6;",
        h5("4. Hypothesis Testing", style = "font-weight: 600; color: #2C3E50;"),
        p("Perform parametric standard statistical checks including One-Sample and Two-Sample T-tests and Z-tests against customized hypothesized parameters.", style = "color: #555;")
      ),
      div(
        class = "custom-card",
        style = "border-left: 5px solid #F39C12;",
        h5("5. Correlation & Regression", style = "font-weight: 600; color: #2C3E50;"),
        p("Explore relationships between quantitative variables using correlation analysis and simple linear regression with fitted regression plots and diagnostic residuals.", style = "color: #555;")
      )
    )
  )
)

server <- function(input, output, session) {
  uploaded_data <- reactive({
    req(input$file)
    read.csv(input$file$datapath, header = TRUE)
  })
  
  output$data_table <- renderDT({
    datatable(
      uploaded_data(),
      options = list(pageLength = 8, scrollX = TRUE, dom = 'ftp'),
      class = 'cell-border stripe hover'
    )
  })
  
  output$row_count_val <- renderText({
    if (is.null(input$file)) return("0")
    format(nrow(uploaded_data()), big.mark = ",")
  })
  
  output$column_count_val <- renderText({
    if (is.null(input$file)) return("0")
    format(ncol(uploaded_data()), big.mark = ",")
  })
  
  output$missing_count_val <- renderText({
    if (is.null(input$file)) return("0")
    format(sum(is.na(uploaded_data())), big.mark = ",")
  })
  
  output$quantitative_variable <- renderUI({
    data <- uploaded_data()
    quantitative_columns <- names(data)[sapply(data, is.numeric)]
    selectInput("quantitative_column", "Quantitative Variable:", choices = quantitative_columns, selectize = FALSE)
  })
  
  output$qualitative_variable <- renderUI({
    data <- uploaded_data()
    qualitative_columns <- names(data)[!sapply(data, is.numeric)]
    selectInput("qualitative_column", "Qualitative Variable:", choices = qualitative_columns, selectize = FALSE)
  })
  
  output$quantitative_summary <- renderDT({
    req(input$quantitative_column)
    data <- uploaded_data()
    selected_data <- data[[input$quantitative_column]]
    summary_table <- data.frame(
      Statistic = c("Mean", "Median", "Standard Deviation", "Minimum", "Maximum", "Q1 (25%)", "Q3 (75%)", "Missing Count"),
      Value = c(
        mean(selected_data, na.rm = TRUE),
        median(selected_data, na.rm = TRUE),
        sd(selected_data, na.rm = TRUE),
        min(selected_data, na.rm = TRUE),
        max(selected_data, na.rm = TRUE),
        quantile(selected_data, 0.25, na.rm = TRUE),
        quantile(selected_data, 0.75, na.rm = TRUE),
        sum(is.na(selected_data))
      )
    )
    summary_table$Value <- round(summary_table$Value, 2)
    datatable(summary_table, options = list(dom = 't', ordering = FALSE), rownames = FALSE)
  })
  
  output$qualitative_summary <- renderDT({
    req(input$qualitative_column)
    data <- uploaded_data()
    selected_data <- data[[input$qualitative_column]]
    frequency <- table(selected_data, useNA = "ifany")
    percentage <- prop.table(frequency) * 100
    qualitative_table <- data.frame(
      Category = names(frequency),
      Frequency = as.numeric(frequency),
      Percentage = paste0(round(as.numeric(percentage), 2), "%")
    )
    
    qualitative_table <- rbind(
      qualitative_table,
      data.frame(Category = "Total", Frequency = sum(frequency), Percentage = "100%")
    )
    datatable(qualitative_table, options = list(dom = 't', ordering = FALSE), rownames = FALSE)
  })
  
  output$plot_quantitative_variable <- renderUI({
    data <- uploaded_data()
    quantitative_columns <- names(data)[sapply(data, is.numeric)]
    selectInput(
      inputId = "plot_quantitative_column",
      label = "Select Quantitative Variable:",
      choices = quantitative_columns
    )
  })
  
  output$plot_qualitative_variable <- renderUI({
    data <- uploaded_data()
    qualitative_columns <- names(data)[!sapply(data, is.numeric)]
    selectInput(
      inputId = "plot_qualitative_column",
      label = "Select Qualitative Variable:",
      choices = qualitative_columns
    )
  })
  
  output$bin_width_ui <- renderUI({
    req(input$plot_quantitative_column)
    
    data <- uploaded_data()
    selected_data <- data[[input$plot_quantitative_column]]
    selected_data <- selected_data[!is.na(selected_data)]
    
    data_range <- max(selected_data) - min(selected_data)
    
    max_bin_width <- data_range / 3
    default_bin_width <- data_range / 10
    
    sliderInput(
      inputId = "bin_width",
      label = "Bin Width:",
      min = max(data_range / 100, 0.01),
      max = max_bin_width,
      value = default_bin_width,
      step = max(data_range / 100, 0.01)
    )
  })
  
  output$data_plot <- renderPlot({
    data <- uploaded_data()
    if (input$data_type == "quantitative") {
      req(input$plot_quantitative_column)
      selected_data <- data[[input$plot_quantitative_column]]
      selected_data <- selected_data[!is.na(selected_data)]
      if (input$quantitative_plot_type == "histogram") {
        histogram_breaks <- seq(
          from = min(selected_data),
          to = max(selected_data) + input$bin_width,
          by = input$bin_width
        )
        par(mar = c(5, 6, 4, 2) + 0.1)
        hist(
          selected_data,
          breaks = histogram_breaks,
          main = paste("Histogram of", input$plot_quantitative_column),
          xlab = input$plot_quantitative_column,
          ylab = "Frequency",
          border = "white",
          cex.axis = 1.6,
          cex.lab = 1.7,
          cex.main = 1.8,
          col = "#2C3E50"
        )
      } else {
        par(mar = c(5, 6, 4, 2) + 0.1)
        plot(
          density(selected_data, adjust = input$bandwidth_adjust,
                  na.rm = TRUE),
          main = paste("Density Curve of", input$plot_quantitative_column),
          xlab = input$plot_quantitative_column,
          ylab = "Density",
          lwd = 2.5,
          cex.axis = 1.6,
          cex.lab = 1.7,
          cex.main = 1.8,
          col = "#18BC9C"
        )
      }
    }
    if (input$data_type == "qualitative") {
      req(input$plot_qualitative_column)
      selected_data <- data[[input$plot_qualitative_column]]
      num_categories <- length(unique(na.omit(selected_data)))
      if (num_categories > 20) {
        plot.new()
        text(
          0.5, 0.55,
          "Too many categories for a clear visualization",
          cex = 1.5,
          font = 2,
          col = "#2C3E50"
        )
        text(
          0.5, 0.45,
          paste(
            "This variable contains",
            num_categories,
            "unique categories.\nPlease select another qualitative variable."
          ),
          cex = 1.1,
          col = "#6C757D"
        )
        return()
      }
      frequency <- table(selected_data, useNA = "ifany")
      if (input$qualitative_plot_type == "bar") {
        par(mar = c(5, 9, 4, 2) + 0.1)
        if (input$bar_measure == "frequency") {
          bar_values <- frequency
          y_title <- "Frequency"
          chart_title <- paste(
            "Category Counts for",
            input$plot_qualitative_column
          )
        } else {
          bar_values <- prop.table(frequency) * 100
          y_title <- "Percentage (%)"
          chart_title <- paste(
            "Category Percentages for",
            input$plot_qualitative_column
          )
        }
        if (input$bar_order == "descending") {
          bar_values <- sort(bar_values, decreasing = TRUE)
        }
        barplot(
          bar_values,
          main = chart_title,
          xlab = input$plot_qualitative_column,
          ylab = "",
          las = 1,
          cex.names = 1.7,
          cex.axis = 1.6,
          cex.lab = 1.7,
          cex.main = 1.8,
          col = "#2C3E50",
          border = NA
        )
        mtext(
          y_title,
          side = 2,
          line = 5.5,
          cex = 1.7
        )
      } else {
        percentages <- round(prop.table(frequency) * 100, 1)
        pie(
          frequency,
          labels = NA,
          main = paste("Category Distribution for", input$plot_qualitative_column),
          col = palette.colors(length(frequency), "Set 2"),
          cex.main = 1.8,
          radius = 1
        )
        angles <- cumsum(frequency) - frequency / 2
        angles <- angles / sum(frequency) * 2 * pi
        text(
          x = 0.7 * cos(pi/2 - angles),
          y = 0.7 * sin(pi/2 - angles),
          labels = paste0(names(frequency), "\n", percentages, "%"),
          cex = 1.1
        )
      }
    }
  })
  
  continuous_variables <- reactive({
    req(uploaded_data())
    data <- uploaded_data()
    names(data)[sapply(data, is.numeric)]
  })
  
  grouping_variables <- reactive({
    req(uploaded_data())
    data <- uploaded_data()
    names(data)[sapply(data, function(x) is.character(x) || is.factor(x))]
  })
  
  observe({
    updateSelectInput(session, "variable", choices = continuous_variables())
  })
  
  observe({
    updateSelectInput(session, "group_variable", choices = grouping_variables())
  })
  
  output$test_result <- renderText({
    req(input$perform_test)
    req(input$variable)
    data <- uploaded_data()
    
    if (input$sample_type == "one") {
      x <- data[[input$variable]]
      x <- x[!is.na(x)]
      n <- length(x)
      validate(need(n >= 2, "At least two observations are required."))
      sample_mean <- mean(x)
      
      if (input$test_type == "t") {
        result <- t.test(x, mu = input$mu)
        statistic <- as.numeric(result$statistic)
        p_value <- result$p.value
        test_name <- "One-Sample T-test"
      } else {
        z <- (sample_mean - input$mu) / (input$population_sd / sqrt(n))
        statistic <- z
        p_value <- 2 * pnorm(-abs(z))
        test_name <- "One-Sample Z-test"
      }
      decision <- ifelse(p_value < input$alpha, "Reject H0", "Fail to Reject H0")
      
      paste0(
        "Test: ", test_name, "\n",
        "Variable: ", input$variable, "\n",
        "Sample Size: ", n, "\n",
        "Significance Level (α): ", input$alpha, "\n\n",
        "Test Statistic: ", round(statistic, 4), "\n",
        "p-value: ", format.pval(p_value, digits = 4), "\n\n",
        "Decision: ", decision
      )
    } else {
      req(input$group_variable)
      x <- data[[input$variable]]
      group <- data[[input$group_variable]]
      complete <- complete.cases(x, group)
      x <- x[complete]
      group <- group[complete]
      groups <- unique(group)
      
      validate(need(length(groups) == 2, "The grouping variable must contain exactly two groups."))
      group1 <- x[group == groups[1]]
      group2 <- x[group == groups[2]]
      
      validate(need(length(group1) >= 2 && length(group2) >= 2, "Each group must contain at least two observations."))
      
      if (input$test_type == "t") {
        result <- t.test(group1, group2)
        statistic <- as.numeric(result$statistic)
        p_value <- result$p.value
        test_name <- "Two-Sample T-test"
      } else {
        mean1 <- mean(group1)
        mean2 <- mean(group2)
        n1 <- length(group1)
        n2 <- length(group2)
        z <- (mean1 - mean2) / sqrt((input$population_sd^2 / n1) + (input$population_sd^2 / n2))
        statistic <- z
        p_value <- 2 * pnorm(-abs(z))
        test_name <- "Two-Sample Z-test"
      }
      decision <- ifelse(p_value < input$alpha, "Reject H0", "Fail to Reject H0")
      
      paste0(
        "Test: ", test_name, "\n",
        "Variable: ", input$variable, "\n",
        "Group 1: ", groups[1], "\n",
        "Group 2: ", groups[2], "\n",
        "Significance Level (α): ", input$alpha, "\n\n",
        "Test Statistic: ", round(statistic, 4), "\n",
        "p-value: ", format.pval(p_value, digits = 4), "\n\n",
        "Decision: ", decision
      )
    }
  })
  
  quantitative_variables <- reactive({
    req(uploaded_data())
    data <- uploaded_data()
    names(data)[sapply(data, is.numeric)]
  })
  
  observe({
    vars <- quantitative_variables()
    updateSelectInput(session, "cor_x", choices = vars, selected = if (length(vars) >= 1) vars[1] else NULL)
    updateSelectInput(session, "cor_y", choices = vars, selected = if (length(vars) >= 2) vars[2] else NULL)
    updateSelectInput(session, "reg_x", choices = vars, selected = if (length(vars) >= 1) vars[1] else NULL)
    updateSelectInput(session, "reg_y", choices = vars, selected = if (length(vars) >= 2) vars[2] else NULL)
  })
  
  observeEvent(input$run_correlation, {
    req(input$cor_x, input$cor_y)
    validate(need(input$cor_x != input$cor_y, "Please select two different variables."))
    
    data <- uploaded_data()
    x <- data[[input$cor_x]]
    y <- data[[input$cor_y]]
    complete_data <- complete.cases(x, y)
    x <- x[complete_data]
    y <- y[complete_data]
    
    validate(
      need(length(x) >= 3, "At least 3 complete observations are required."),
      need(sd(x) > 0, "X variable must have variation."),
      need(sd(y) > 0, "Y variable must have variation.")
    )
    
    result <- cor.test(x, y, method = input$cor_method)
    
    output$cor_result <- renderText({
      method_name <- ifelse(input$cor_method == "pearson", "Pearson", "Spearman")
      paste0(
        "Correlation Method : ", method_name, "\n",
        "X Variable         : ", input$cor_x, "\n",
        "Y Variable         : ", input$cor_y, "\n\n",
        "Correlation Coeff  : ", round(as.numeric(result$estimate), 4), "\n",
        "p-value            : ", format.pval(result$p.value, digits = 4)
      )
    })
    
    output$scatter_plot <- renderPlot({
      df <- data.frame(x = x, y = y)
      ggplot(df, aes(x = x, y = y)) +
        geom_point(color = "#2C3E50", size = 3, alpha = 0.7) +
        theme_minimal(base_size = 14) +
        labs(
          title = paste(ifelse(input$cor_method == "pearson", "Pearson", "Spearman"), "Correlation Scatter Plot"),
          x = input$cor_x,
          y = input$cor_y
        ) +
        theme(plot.title = element_text(face = "bold", color = "#2C3E50"))
    })
  })
  
  observeEvent(input$run_regression, {
    req(input$reg_x, input$reg_y)
    validate(need(input$reg_x != input$reg_y, "Please select two different variables."))
    
    data <- uploaded_data()
    x <- data[[input$reg_x]]
    y <- data[[input$reg_y]]
    complete_data <- complete.cases(x, y)
    x <- x[complete_data]
    y <- y[complete_data]
    
    validate(
      need(length(x) >= 3, "At least 3 complete observations are required."),
      need(sd(x) > 0, "The independent variable must have variation.")
    )
    
    model <- lm(y ~ x)
    model_summary <- summary(model)
    intercept <- coef(model)[1]
    slope <- coef(model)[2]
    r_squared <- model_summary$r.squared
    slope_p_value <- model_summary$coefficients[2, 4]
    
    output$reg_result <- renderText({
      equation <- if (slope >= 0) {
        paste0(input$reg_y, " = ", round(intercept, 4), " + ", round(slope, 4), " × ", input$reg_x)
      } else {
        paste0(input$reg_y, " = ", round(intercept, 4), " - ", round(abs(slope), 4), " × ", input$reg_x)
      }
      paste0(
        "Linear Regression Model Summary\n",
        "-----------------------------------\n",
        "Intercept (β0) : ", round(intercept, 4), "\n",
        "Slope (β1)     : ", round(slope, 4), "\n",
        "R-squared (R²) : ", round(r_squared, 4), "\n",
        "Slope p-value   : ", format.pval(slope_p_value, digits = 4), "\n\n",
        "Linear Equation:\n", equation
      )
    })
    
    output$regression_plot <- renderPlot({
      df <- data.frame(x = x, y = y)
      ggplot(df, aes(x = x, y = y)) +
        geom_point(color = "#2C3E50", size = 3, alpha = 0.7) +
        geom_smooth(method = "lm", color = "#18BC9C", se = TRUE, fill = "#18BC9C", alpha = 0.2) +
        theme_minimal(base_size = 14) +
        labs(
          title = paste(input$reg_y, "vs", input$reg_x),
          x = input$reg_x,
          y = input$reg_y
        ) +
        theme(plot.title = element_text(face = "bold", color = "#2C3E50"))
    })
    
    output$residual_plot <- renderPlot({
      df_res <- data.frame(fitted = model$fitted.values, residuals = model$residuals)
      ggplot(df_res, aes(x = fitted, y = residuals)) +
        geom_point(color = "#E74C3C", size = 3, alpha = 0.7) +
        geom_hline(yintercept = 0, linetype = "dashed", color = "#7F8C8D") +
        theme_minimal(base_size = 14) +
        labs(
          title = "Diagnostic Residual Plot",
          x = "Fitted Values",
          y = "Residuals"
        ) +
        theme(plot.title = element_text(face = "bold", color = "#2C3E50"))
    })
  })
  
  observeEvent(input$go_guide, {
    updateNavbarPage(session, "main_nav", selected = "guide")
  })
}

shinyApp(ui = ui, server = server)