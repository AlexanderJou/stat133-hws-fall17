#Remove Missing: getting rid of NA
remove_missing = function(x) {
  bad = is.na(x)
  x[!bad]
}

a <- c(1, 4, 7, NA, 10)
remove_missing(a)
b <- c("c","a", "b")

#Get_minimum: get minimum value of vector
get_minimum = function(x , na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
} else
  sortm = sort(x, na.last = TRUE)
  sortm[1]
}

get_minimum(a, na.rm = TRUE)

#Get_maximum: get maximum value of vector
get_maximum = function(x , na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
    sortm = -sort(-x, na.last = TRUE)
  sortm[1]
}

get_maximum(a, na.rm = TRUE)

#Get_range: maximum minus minimum values
get_range = function(x , na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
    get_maximum(x) - get_minimum(x)
}

get_range(a, na.rm = TRUE)

#Get_percentile10: 10th percentile
get_percentile10 = function(x, na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
  qute = (quantile(x, na.rm = TRUE, .1))
  unname(qute)
}

get_percentile10(a, na.rm = TRUE)

#Get_percentile90: 90th percentile
get_percentile90 = function(x, na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
  qute = (quantile(x, na.rm = TRUE, .9))
  unname(qute)
}

get_percentile90(a, na.rm = TRUE)

#Get_median: median value in vector
get_median = function(x, na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
  y = remove_missing(x)
  if (length(y) %% 2 != 0) {
    b = (length(y)+1)/2
    sort(y)[b]
  } else if (length(y) %% 2 == 0) {
    a = length(y)/2
    c = sort(y)[a]
    d = sort(y)[a+1]
    (c+d)/2
  }
}

get_median(a, na.rm = TRUE)

#Get_stdev: Standard deviation of data
get_stdev = function(x, na.rm = TRUE) {
  y = remove_missing(x)
  deviations <- 0
  for (i in 1:length(y)) {
    deviations <- deviations + (y[i] - get_average(y))^2
}
sqrt(deviations / (length(y) - 1))
}

get_stdev(a, na.rm = TRUE)

#Get_average: get mean of data
get_average = function(x, na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
  y = remove_missing(x)
  sum_entries = 0
  for (j in 1:length(y)) {
    sum_entries = sum_entries + y[j]
  }
  avg = sum_entries/length(y)
  avg
}

get_average(a, na.rm = TRUE)

#Get_quartile1: get 25% mark
get_quartile1 = function(x, na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
  qut = quantile(x, na.rm = TRUE )
  qute = qut[2]
  unname(qute)
}

get_quartile1(a, na.rm = TRUE)

#Get_quartile3: Get 75% mark
get_quartile3 = function(x, na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
  qut = quantile(x, na.rm = TRUE )
  qute = qut[4]
  unname(qute)
}

get_quartile3(a, na.rm = TRUE)

#Count_missing: Counting Missing Values
count_missing = function(x) {
  sum(is.na(x))
}

count_missing(a)

summary_stats = function(x) {
  basestats = list(get_minimum(x), get_percentile10(x), get_quartile1(x), get_median(x),
                   get_average(x), get_quartile3(x), get_percentile90(x), get_maximum(x),
                   get_range(x), get_stdev(x), count_missing(x))
  labelstat = c("minimum", "percent10", "quartile1", "median", "mean", "quartile3", "percentile90",
                "maximum", "range", "stdev", "missing")
  names(basestats) = labelstat
  basestats
}

summary_stats(a)

#Formatting Stats for Nicer Format
get_minimuml = function(x) {
  y = get_minimum(x)
  format(round(y, 4), nsmall = 4)
}

get_percentile10l = function(x) {
  y = get_percentile10(x)
  format(round(y, 4), nsmall = 4)
}
get_quartile1l = function(x) {
  y = get_quartile1(x)
  format(round(y, 4), nsmall = 4)
}
get_quartile3l = function(x) {
  y = get_quartile3(x)
  format(round(y, 4), nsmall = 4)
}
get_medianl = function(x) {
  y = get_median(x)
  format(round(y, 4), nsmall = 4)
}
get_averagel = function(x) {
  y = get_average(x)
  format(round(y, 4), nsmall = 4)
}
get_percentile90l = function(x) {
  y = get_percentile90(x)
  format(round(y, 4), nsmall = 4)
}
get_maximuml = function(x) {
  y = get_maximum(x)
  format(round(y, 4), nsmall = 4)
}
get_rangel = function(x) {
  y = get_range(x)
  format(round(y, 4), nsmall = 4)
}
get_stdevl = function(x) {
  y = get_stdev(x)
  format(round(y, 4), nsmall = 4)
}
count_missingl = function(x) {
  y = count_missing(x)
  format(round(y, 4), nsmall = 4)
}

#Print Stats: nicer formatting of display
print_stats = function(x) {
  basestats = c(" minimum  :", get_minimuml(x),"\n",
                "percent10:", get_percentile10l(x), "\n",
                "quartile1:", get_quartile1l(x), "\n",
                "median   :", get_medianl(x), "\n",
                "mean     :", get_averagel(x), "\n",
                "quartile3:", get_quartile3l(x), "\n",
                "percent90:", get_percentile90l(x), "\n",
                "maximum  :", get_maximuml(x), "\n",
                "range    :", get_rangel(x), "\n",
                "stdev    :", get_stdevl(x), "\n",
                "missing  :", count_missingl(x), "\n"
                )
  cat(basestats)
}

print_stats(a)

#Rescale100: Readjusting Scale to 100
rescale100 = function(x, xmin, xmax) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else 
    (100 * x - 100* xmin)/(xmax-xmin)
}

b <- c(18, 15, 16, 4, 17, 9)
rescale100(b, xmin = 0, xmax = 20)

#Drop_lowest: Drop lowest value in set
drop_lowest = function(x) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
    x[-c(which.min(x))]
}  

b <- c(10, 10, 8.5, 4,7, 9)
drop_lowest(b)

#Score_homework: Average homework score
score_homework = function(x, drop = TRUE) {
  y = drop_lowest(x)
  if(drop == FALSE) {
    sum(x)/length(x)
  } else if (drop == TRUE)
    sum(y)/length(y)
}

hws <- c(100, 80, 30, 70, 75, 85)
score_homework(hws, drop = TRUE)
score_homework(hws, drop = FALSE)

#Score_quiz: Average quiz score
score_quiz = function(x, drop = FALSE) {
  if(drop == FALSE) {
    sum(x)/length(x) 
} else if(drop == TRUE) {
    y = drop_lowest(x)
    sum(y)/length(y)
  }
}
quizzes <- c(100, 80, 70, 0)
score_quiz(quizzes, drop = FALSE)
score_quiz(quizzes, drop = TRUE)



#Score_lab: Lab score out of 100
score_lab <- function(x) {
  if (x > 11) { 
    100
  } else if (x > 6) {
    20 * (x - 6)
  } else 
    0
}



  
  
  