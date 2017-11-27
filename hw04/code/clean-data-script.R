dat = read.csv('rawscores.csv', stringsAsFactors = FALSE)
dim(dat)
str(dat)

#Source in functions
source('functions.R')

sink('../output/summary-rawscores.txt')
str(dat)
sink()

#Summary of stats for data frame
summary_stats(c(dat$HW1))
summary_stats(c(dat$HW2))
summary_stats(c(dat$HW3))
summary_stats(c(dat$HW4))
summary_stats(c(dat$HW5))
summary_stats(c(dat$HW6))
summary_stats(c(dat$HW7))
summary_stats(c(dat$HW8))
summary_stats(c(dat$HW9))
summary_stats(c(dat$QZ1))
summary_stats(c(dat$QZ2))
summary_stats(c(dat$QZ3))
summary_stats(c(dat$QZ4))
summary_stats(c(dat$EX1))
summary_stats(c(dat$EX2))
summary_stats(c(dat$ATT))

#Printing stats for data frame
print_stats(c(dat$HW1))
print_stats(c(dat$HW2))
print_stats(c(dat$HW3))
print_stats(c(dat$HW4))
print_stats(c(dat$HW5))
print_stats(c(dat$HW6))
print_stats(c(dat$HW7))
print_stats(c(dat$HW8))
print_stats(c(dat$HW9))
print_stats(c(dat$QZ1))
print_stats(c(dat$QZ2))
print_stats(c(dat$QZ3))
print_stats(c(dat$QZ4))
print_stats(c(dat$EX1))
print_stats(c(dat$EX2))
print_stats(c(dat$ATT))
sink()

#Converting NA values
dat[is.na(dat)] = 0

#Rescaling quizzes
dat$QZ1 = rescale100(dat$QZ1, xmin = 0, xmax = 12)
dat$QZ2 = rescale100(dat$QZ2, xmin = 0, xmax = 18)
dat$QZ3 = rescale100(dat$QZ3, xmin = 0, xmax = 20)
dat$QZ4 = rescale100(dat$QZ4, xmin = 0, xmax = 20)

#Rescaling exams
dat$Test1 = rescale100(dat$EX1, xmin = 0, xmax = 80)
dat$Test2 = rescale100(dat$EX2, xmin = 0, xmax = 90)

#Homework Variable
hws = data.frame(hw1 = dat$HW1,
                 hw2 = dat$HW2,
                 hw3 = dat$HW3,
                 hw4 = dat$HW4,
                 hw5 = dat$HW5,
                 hw6 = dat$HW6,
                 hw7 = dat$HW7,
                 hw8 = dat$HW8,
                 hw9 = dat$HW9)

for (i in 1:nrow(dat)){
  dat$Homework[i] = score_homework(c(hws$hw1[i], hws$hw2[i], hws$hw3[i], hws$hw4[i],hws$hw5[i],
                                     hws$hw6[i], hws$hw7[i], hws$hw8[i], hws$hw9[i]))
}
dat$Homework

#Quiz Variable
quizz = data.frame(qz1 = dat$QZ1,
                   qz2 = dat$QZ2,
                   qz3 = dat$QZ3,
                   qz4 = dat$QZ4)

for (i in 1:nrow(dat)){
  dat$Quiz[i] = score_homework(c(quizz$qz1[i], quizz$qz2[i], quizz$qz3[i], quizz$qz4[i]))
}

dat$Quiz

#Lab Score
for (i in 1:nrow(dat)){
  dat$Lab[i] = score_lab(dat$ATT[i])
}
dat$Lab

#Overall Variable
dat$Overall = .1 * dat$Lab +.3 * dat$Homework + .15 * dat$Quiz + .2 * dat$Test1 + .25 *dat$Test2
dat$Overall

#Grade Variable
grad <- function(x) {
  if (x >= 95) { 
    "A+"
  } else if (x >= 90) {
    "A"
  } else if (x >= 88) {
    "B+"
  } else if (x >= 86) {
    "B"
  } else if (x >= 82) {
    "B-"
  } else if (x >= 79.5) {
    "C+"
  } else if (x >= 77.5) {
    "C"
  } else if (x >= 70) {
    "C-"
  } else if (x >= 60) {
    "D"
  } else  
    "F"
}

for (i in 1:nrow(dat)){
  dat$Grade[i] = grad(dat$Overall[i])
}
dat$Grade

#Sinking Lab Stats
sink('../output/Lab-stats.txt')
summary_stats(dat$Lab)
print_stats(dat$Lab)
sink()

#Sinking Homework Stats
sink('../output/Homework-stats.txt')
summary_stats(dat$Homework)
print_stats(dat$Homework)
sink()

#Sinking Quiz Stats
sink('../output/Quiz-stats.txt')
summary_stats(dat$Quiz)
print_stats(dat$Quiz)
sink()

#Sinking Test1 Stats
sink('../output/Test1-stats.txt')
summary_stats(dat$Test1)
print_stats(dat$Test1)
sink()

#Sinking Test2 Stats
sink('../output/Test2-stats.txt')
summary_stats(dat$Test2)
print_stats(dat$Test2)
sink()

#Sinking Overall Stats
sink('../output/Overall-stats.txt')
summary_stats(dat$Overall)
print_stats(dat$Overall)
sink()

#Sinking Structure of Clean Data Frame
sink('../output/summary-cleanscores.txt')
str(dat)
sink()

#Exporting Clean Data Frame
write.csv(dat, "../data/cleandata/cleanscores.csv")





