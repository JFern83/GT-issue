df <- read.csv("Demo_GTtable_data.csv")


final_table <- df %>% 
  group_by(Unit, Course) %>% 
  summarise_at(.vars = c("RR", "Score"), .funs = ~mean(., na.rm = T)) %>% 
  arrange(desc(Score)) %>% 
  gt() %>% 
  cols_label(
    RR = ("Response Rate %"), 
    Score = "Mean Score") %>% 
  opt_align_table_header(align = "left") %>% 
  fmt_number(columns = Score) %>% 
  fmt_number(columns = RR, scale_by = 100/1, decimals = F) %>% 
  cols_width(
    Unit ~ px(150),
    RR ~px(150),
    Score ~px(150)) %>% 
  cols_align("center") %>% 
  data_color(
    columns = Score, 
    colors = scales::col_numeric(
      palette = c(
        "red","orange","green"),
             domain = c(3,3.5,4.0,4.5,5)))

final_table
