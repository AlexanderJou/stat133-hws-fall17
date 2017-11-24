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

get_quartile1 = function(x, na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
  qut = quantile(x, na.rm = TRUE )
  qute = qut[2]
  unname(qute)
}

get_quartile1(a, na.rm = TRUE)

get_quartile3 = function(x, na.rm = TRUE) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
  qut = quantile(x, na.rm = TRUE )
  qute = qut[4]
  unname(qute)
}

get_quartile3(a, na.rm = TRUE)

count_missing = function(x) {
  sum(is.na(x))
}

count_missing(a)

rescale100 = function(x, xmin, xmax) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else 
    (100 * x - 100* xmin)/(xmax-xmin)
}

b <- c(18, 15, 16, 4, 17, 9)
rescale100(b, xmin = 0, xmax = 20)

drop_lowest = function(x) {
  if(!is.numeric(x)) {
    stop('x must numeric')
  } else
    x[x > min(x)]
}  

b <- c(10, 10, 8.5, 4, 7, 9)
drop_lowest(b)

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




score_lab <- function(x) {
  if (x > 11) { 
    100
  } else if (x > 7) {
    20 * (x - 6)
  } else 
    0
}

score_lab(12)
score_lab(10)
score_lab(6)



  
  
  
  
  