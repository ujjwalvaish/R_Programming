#Set up the working directory.
setwd("c:/R/Rdata")
# Several packages are needed for the Naive Bayes analysis.
# The "crossval" package is used to create what is known as a classification matrix or
# confusion matrix. This 2 X 2 matrix shows the hits and misses when a model is used to
# predict a binary classification.
#    The function used in crossval is confusionMatrix()
#
# The diagnostic errors are computed as follows:
#   acc = (TP+TN)/(FP+TN+TP+FN)
#   sens = TP/(TP+FN)
#   spec = TN/(FP+TN)
#   ppv = TP/(FP+TP)
#   npv = TN/(TN+FN)
#   lor = log(TP*TN/(FN*FP))
#
#e1071 is a package containing several statistical functions, including Naive Bayes.
install.packages("crossval", dependencies = TRUE)
install.packages("e1071", dependencies = TRUE)
# Load the two required packages.
library("crossval")
library("e1071")
# 
# Read in the CollegePlans data.
college <- read.csv("./CollegePlans.CSV",header=TRUE)
str(college)
# Note that ID is the first variable. We don't use that in the model.
# Variables 2,5,7,8 will be used as predictors.
# Variable 6 (CollegePlans) will be the target variable.
# Now create two partitions of the college file: one for training and one for testing.
#
# ntrain is the number of observations to use in the training data. We will use an 80/20 split.
ntrain <- round(nrow(college)*.8,0)
ntrain
ntest <- nrow(college)-ntrain
ntest
# sub contains a list of rows to be used in the trainging data
sub <- sample(nrow(college), ntrain)
# Take a look at sub.
head(sub)
#Now form the training and testing subsetsc
training <- college[sub,]
testing <- college[-sub,]
# Here's where the naive Bayes model is created.
classifier<-naiveBayes(training[,c(2,5,7,8)], training[,6]) 
# The table function creates a 2 X 2 table showing predicted and actual
table(predict(classifier, training[,-6]), training[,6])
pred<-predict(classifier,training)
cm <- confusionMatrix(pred, training[,6], negative="Does not plan to attend")
diagnosticErrors(cm)
# Results of using model from training data to predict testing sample.
table(predict(classifier, testing[,-6]), testing[,6])
pred2<-predict(classifier,testing)
cm2 = confusionMatrix(pred2, testing[,6], negative="Does not plan to attend")
diagnosticErrors(cm2)

