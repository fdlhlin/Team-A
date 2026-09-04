# StatVision User Guide UI
# Standalone user guide component for Shiny app

userGuideUI <- function() {
  fluidPage(
    style = "max-width: 900px; margin: 0 auto; padding-top: 10px;",

    h2(
      "StatVision User Guide",
      style = "font-weight: 700; color: #2C3E50; margin-bottom: 25px;"
    ),

    div(
      class = "custom-card",
      style = "border-left: 5px solid #8B1E1E;",
      h5("⚠️ Important Considerations",
         style = "font-weight: 600; color: #8B1E1E;"),
      tags$ul(
        tags$li("Ensure your uploaded file uses standard CSV encoding with clear column headers."),
        tags$li("Quantitative variables must contain strictly numeric data types."),
        tags$li("Missing values (N/A) are automatically ignored during calculation routines.")
      )
    ),

    div(
      class = "custom-card",
      style = "border-left: 5px solid #2C3E50;",
      h5("1. Data Input",
         style = "font-weight: 600; color: #2C3E50;"),
      p("Upload a standard CSV file to initialize your session. The dataset preview grid displays interactive pagination and summary statistics automatically.")
    ),

    div(
      class = "custom-card",
      style = "border-left: 5px solid #18BC9C;",
      h5("2. Descriptive Statistics",
         style = "font-weight: 600; color: #2C3E50;"),
      p("Analyze numeric variables for central tendency (Mean, Median), dispersion (SD, IQR, Min, Max), and missingness. Categorical variables display frequency counts and percentages.")
    ),

    div(
      class = "custom-card",
      style = "border-left: 5px solid #3498DB;",
      h5("3. Visualizations",
         style = "font-weight: 600; color: #2C3E50;"),
      p("Generate high-resolution graphs including Histograms, Kernel Density estimates, Bar charts, and Pie charts.")
    ),

    div(
      class = "custom-card",
      style = "border-left: 5px solid #9B59B6;",
      h5("4. Hypothesis Testing",
         style = "font-weight: 600; color: #2C3E50;"),
      p("Perform One-Sample and Two-Sample T-tests and Z-tests against customized hypothesized parameters.")
    ),

    div(
      class = "custom-card",
      style = "border-left: 5px solid #F39C12;",
      h5("5. Correlation & Regression",
         style = "font-weight: 600; color: #2C3E50;"),
      p("Explore relationships between quantitative variables using correlation analysis and simple linear regression with fitted regression plots and diagnostic residual plots.")
    )
  )
}
