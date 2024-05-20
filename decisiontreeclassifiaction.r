library(rpart)
data(iris)
install.packages("caret")
install.packages("rpart.plot")
library(caret)
library(rpart.plot)
irisdata<-datasets::iris
table(iris$Species)
summary(irisdata)
str(irisdata)
set.seed(3033)
intrain <- createDataPartition(y = irisdata$Species, p= 0.7, list = FALSE)
training <- irisdata[intrain,]
testing <- irisdata[-intrain,]
dim(training);
dim(testing)
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3333)
dtree_fit_info <- train(Species ~., data = training, method = "rpart",
                                            parms = list(split = "information"),
                                            trControl=trctrl,
                                            tuneLength = 10)
prp(dtree_fit_info$finalModel, box.palette="Reds", tweak=1.2)

