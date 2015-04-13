# Beautiful charts in ggplot2
# install.packages(c("ggplot2","RColorBrewer","scales"))
library(ggplot2); library(scales); library(grid); library(RColorBrewer)

df <- read.csv("../Data/Internet/GGplot_Buzzfeed/buzzfeed_linkbait_headlines.csv", header=T)

ggplot(df, aes(listicle_size)) +
  geom_histogram(binwidth=1)

ggplot(df, aes(listicle_size)) +
  geom_histogram(binwidth=1) +
  labs(title="Distribution of Listicle Sizes for BuzzFeed Listicles", x="# of Entries in Listicle", y="# of Listicles")

ggplot(df, aes(listicle_size)) +
  geom_histogram(binwidth=1, fill="#c0392b", alpha=0.75) +
  labs(title="Distribution of Listicle Sizes for BuzzFeed Listicles", x="# of Entries in Listicle", y="# of Listicles") +
  scale_x_continuous(breaks=seq(0,50, by=5)) +
  scale_y_continuous(labels=comma) + 
  geom_hline(yintercept=0, size=0.4, color="black")

ggplot(df, aes(x=listicle_size, y=num_fb_shares)) +
  geom_point()

ggplot(df, aes(x=listicle_size, y=num_fb_shares)) +
  geom_point(alpha=0.05) +
  scale_y_log10(labels=comma)

df = mutate(df, test = num_fb_shares/listicle_size)
ggplot(df, aes(x=listicle_size, y=test)) +
  geom_point(alpha=0.05, color="#c0392b") +
  scale_x_continuous(breaks=seq(0,50, by=5)) +
  scale_y_log10(labels=comma, breaks=10^(0:6)) +
  geom_hline(yintercept=1, size=0.4, color="black") +
  geom_smooth(alpha=0.55, color="black", fill="black") +
  labs(x="# of Entries in Listicle", y="# of Facebook Shares", title="FB Shares vs. Listicle Size for BuzzFeed Listicles")
