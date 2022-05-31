#' Create plot of selected cascades
#'
#' `create_cascade` is a wrapper function that lets a user select between
#' 13 different cascade plots. Valid entries must fall between 1 and 10. The
#' function will plot the selected cascade and return a list of data underlying
#' the plot.
#'
#' @param msd_df MSD data frame from either a Genie or Panorama MSD
#'
#' @return
#' @export
#'
#' @examples
create_cascade <- function(msd_df){
  print(glue::glue_col("{yellow Please enter the cascade you would like to create.}"))
  print(glue::glue_col("{yellow {1:length(plot_name)}:{plot_name}}"))

  cscd_val <- readline(prompt = "Enter selection: ")
  cscd_num <- as.numeric(cscd_val)

  # Check the value entered is valid, if not return a useful error
  if(!cscd_val %in% seq(1:length(plot_name)))
    stop(glue::glue_col("{cyan Please enter a valid selection between 1 and {length(plot_name)}}"))

  else{
    message(glue::glue_col("{yellow You have selected the {plot_name[cscd_num]} Cascade.}"))
  }

  if(!exists("data_source"))
    stop(usethis::ui_code_block("data_source <-
                                glamr::source_info(genie_path) %>% glue::glue(., '\nCreated by: USAID OHA SI Team')"),
         usethis::ui_todo("Run the code chunk above with the appropriate msd_path to set the data source object.")
  )

  if(!exists("curr_fy"))
    stop(usethis::ui_code_block("curr_fy <- glamr::source_info(genie_path, return = 'fiscal_year')"),
         usethis::ui_todo("Run the code chunk above with the appropriate msd_path to set the curr_fy.")
    )



  # Fetch the plot title
  p_title <- plot_title(cscd_num)

  # create cascade dataframe
  cscd_df <- return_cascade(msd_df, cscd_num)

  # create visualization dataframe
  df_viz <- cscd_df %>%
    assign_cscd_colors()

  # create the annotation dataframe (need the factor levels from df_viz)
  df_annot <- create_annotations(cscd_df, df_viz)

  # Plot the cascade
  suppressWarnings(plot_cascade(df_viz, df_annot, cscd_num, p_title))

  #return(list(df_viz, df_annot))

}
