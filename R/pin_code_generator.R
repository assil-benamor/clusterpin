#' Code generator for pin calculation
#'
#' @param cluster_questions_df dataframe input
#' @param cluster_name Cluster name
#' @param col_name_indicator Column name of the indicator description
#' @param col_name_severity_1 Column name of the level 1 sevirity score
#' @param col_name_severity_2 Column name of the level 2 sevirity score
#' @param col_name_severity_3 Column name of the level 3 sevirity score
#' @param col_name_severity_4 Column name of the level 4 sevirity score
#' @param col_name_severity_5 Column name of the level 5 sevirity score
#'
#' @return Return a ready to use sckeleton code. The code is copied into the clipboard. Use ctrl+V / cmd+V to paste it
#' @export
#'
#' @examples
#' print("Code example placeholder")

pin_code_generator <- function(cluster_questions_df,cluster_name,col_name_indicator,col_name_severity_1,col_name_severity_2,col_name_severity_3,col_name_severity_4,col_name_severity_5) {

   cluster_questions_df <- cluster_questions_df %>% select(all_of(c(col_name_indicator,col_name_severity_1,col_name_severity_2,col_name_severity_3,col_name_severity_4,col_name_severity_5)))

  add_spaces <- function(x,n) {

    for (i in 1:n) {
      ch=" "
      x <- c(x,ch)
    }

    x

  }

  x <- c()
  ch = "   data %>% mutate("
  x <- c(x,ch)

  for (i in 1:nrow(cluster_questions_df)) {
    ch = sprintf("   #### %s indicator %s ####",cluster_name,as.character(i))
    x <- c(x,ch)
    ch = sprintf("   ## %s",cluster_questions_df[i,col_name_indicator])
    x <- c(x,ch)

    ch = sprintf("   %s_idicator%s = case_when(",cluster_name,as.character(i))
    x <- c(x,ch)

    for (severity in c(col_name_severity_5,col_name_severity_4,col_name_severity_3,col_name_severity_2,col_name_severity_1)) {

      if(!is.na(cluster_questions_df[i,severity])){
        ch = sprintf("## %s",cluster_questions_df[i,severity])
        ch =  str_replace_all(ch, "[\r\n]" , "")
        x <- c(x,ch)
        ch = sprintf("TRUE ~ %s,",stringr::str_sub(severity,-1,-1))
        x <- c(x,ch)
        x <- add_spaces(x,1)

      }

    }

    ch = sprintf("),")
    x <- c(x,ch)

    x <- add_spaces(x,3)

  }

  ch = sprintf(")")
  x <- c(x,ch)

  y <- paste(x,sep = '\n')

  clipr::write_clip(y)

}
