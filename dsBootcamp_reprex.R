
library(tidyverse)
library(babynames)

babynames %>% 
  filter(sex == "M") %>% 
  select(name, year, prop) %>% 
  group_by(last_letter = stringr::str_sub(name, -1, -1)) %>% 
  summarize(frequencies = sum(prop), .groups = "drop") %>%
  ggplot(mapping = aes(x = year, y = frequency, color = last_letter))