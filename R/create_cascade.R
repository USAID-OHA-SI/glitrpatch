#' Create plot of selected cascades
#'
#' `create_cascade` is a wrapper function that lets a user select between
#' 10 different cascde plots. Valid entries must fall between 1 and 10. The
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
  print(glue::glue_col("{yellow Please enter the cascade you would like to create (1-10).}"))
  print(glue::glue_col("{yellow {1:length(plot_name)}:{plot_name}}"))

  cscd_val <- readline(prompt = "Enter selection: ")
  cscd_num <- as.numeric(cscd_val)

  # Check the value entered is valid, if not return a useful error
  if(!cscd_val %in% seq(1:10))
    stop(glue::glue_col("{cyan Please enter a valid selection between 1 and 10}"))

  else{
    message(glue::glue_col("{yellow You have selected the {plot_name[cscd_num]} Cascade.}"))
  }

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
