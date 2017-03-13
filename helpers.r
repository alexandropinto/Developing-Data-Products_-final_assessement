
aggregate_by_year<-function(a, year_min , year_max) {
  
  aggregated <- a %>% filter(Year >= year_min, Year <= year_max) %>%
    group_by(id) %>%
    summarise_each(funs(sum), Mort)
  
}

aggregate_by_year_table<-function(a, year_min , year_max) {
  
  aggregated <- a %>% filter(Year >= year_min, Year <= year_max) %>%
    group_by(Year) %>%
    summarise_each(funs(sum), Mort)
  
}


plot_by_year <- function (dt, states_map, year_min, year_max, fill, title, low = "#fff5eb", high = "#d94801") {
  title <- sprintf(title, year_min, year_max)
  p <- ggplot(dt, aes(map_id = dt$id))
  p <- p + geom_map(aes_string(fill = fill), map = states_map, colour='black')
  p <- p + expand_limits(x = states_map$long, y = states_map$lat)
  p <- p + coord_map() + theme_bw()
  p <- p + labs(x = "Long", y = "Lat", title = title)
  p + scale_fill_gradient(low = low, high = high)
  p + guides(fill=guide_legend(title="Mortality"))
  
  
}

plot_boxplot <- function(dt,year_min, year_max, x, y, title){
  title <- sprintf(title, year_min, year_max)
  x=factor(x)
  p <- ggplot(dt) + geom_bar(aes(x=x, y=y), stat="identity")
  p<- p + labs(x="Year", y="Number of Deaths")
  
}
###


