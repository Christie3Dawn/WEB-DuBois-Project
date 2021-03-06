library(tidyverse)
library(ggforce)
library(showtext)

### Code from Nicola Rennie (https://github.com/nrennie/dubois_challenge/blob/main/2022/challenge_02.R) ###


# load data from CleaningCensusBlackOnlyIncomeData Script As "TestFrame" Table.
df <- TestFrame

# load fonts - Commented out for testing visualization outputs
font_add_google(name = "Space Mono", family = "space")
showtext_auto()

# prep data
circles <- tibble(x = rep(0, 6), 
                  y = rep(0, 6), 
                  r = c(20, 19, 18, 11, 7, 6), 
                  fill = as.factor(1:6))

year_labels <- tibble(x = rep(0, 6), 
                      y = -1*c(20, 19, 18, 11, 7, 6)+0.5, 
                      label = df$Year, 
                      colour = c(rep("black", 5), "white"))

# plot
p <- ggplot() +
  # circles
  #Green Represents overall outlines of each Circle in the results
  geom_circle(data = circles, 
              mapping = aes(x0 = x, y0 = y, r = r, fill = fill), 
              colour = "grey") +
  # cutouts
  geom_arc_bar(aes(x0 = -2, y0 = 2, r0 = 16.7, r = 0, start = 5.5, end = 5.8), 
               fill = "#c11332", colour = "#c11332") +
  geom_arc_bar(aes(x0 = 2, y0 = 2, r0 = 15.7, r = 0, start = 0.5, end = 0.8), 
               fill = "#dbc8b0", colour = "#dbc8b0") +
  geom_arc_bar(aes(x0 = 3, y0 = 0, r0 = 13.7, r = 0, start = 1.4, end = 1.7), 
               fill = "#efad00", colour = "#efad00") +
  geom_arc_bar(aes(x0 = 2, y0 = -2, r0 = 7.7, r = 0, start = 2.1, end = 2.7), 
               fill = "#3a5288", colour = "#3a5288") +
  geom_arc_bar(aes(x0 = -2, y0 = -2, r0 = 3.3, r = 0, start = 3.8, end = 4.4), 
               fill = "#b28e73", colour = "#b28e73") +
  # text
  geom_text(data = year_labels, 
            mapping = aes(x = x, y = y, label = label, colour = I(colour)),
            family = "space") +
  geom_text(data = df, 
            mapping = aes(x = 0, y = 0, label = unlist(df[6,2])), 
            colour = "white", family = "space") +
  geom_text(data = df,
            aes(x = -4, y = -3.6, label = unlist(df[5,2])),
            colour = "black", family = "space", angle = 40, size = 2.9) + 
  geom_text(data = df,
            aes(x = 5, y = -6, label = unlist(df[4,2])),
            colour = "white", family = "space", angle = -55) + 
  geom_text(data = df,
            aes(x = 10, y = 0, label = unlist(df[3,2])),
            colour = "black", family = "space", angle = 0) + 
  geom_text(data = df,
            aes(x = 8, y = 10, label = unlist(df[2,2])),
            colour = "black", family = "space", angle = 55) + 
  geom_text(data = df,
            aes(x = -8, y = 10, label = unlist(df[1,2])),
            colour = "black", family = "space", angle = -55) + 
  # theme
  scale_fill_manual(values = c("#c11332", "#dbc8b0", "#efad00", 
                               "#3a5288", "#b28e73", "#131313")) +
  coord_fixed() +
  labs(title = "MEAN INCOME OF BLACK FAMILES
  \n \n
IN THE U.S. 2005-2020") +
  theme(plot.background = element_rect(fill = "#dac8b8", colour="#dac8b8"),
        panel.background = element_rect(fill = "#dac8b8", colour="#dac8b8"), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        legend.position = "none",
        plot.title = element_text(family = "space", face = "bold", 
                                  hjust = 0.5, size = 24, 
                                  lineheight = 0.3, 
                                  margin = margin(b = 30)),
        axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.margin = unit(c(0.1, 0.8, 1.3, 0.8), "cm")) 
p

### Code from Nicola Rennie (https://github.com/nrennie/dubois_challenge/blob/main/2022/challenge_02.R) ###
