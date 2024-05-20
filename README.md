# README

## Iris Species Classification using Decision Trees

This project demonstrates the process of building a decision tree classifier to predict the species of iris flowers based on the famous Iris dataset. The classifier is trained using the `rpart` package in R and employs the caret package for model training and evaluation.

## Prerequisites

Before running the code, ensure that the following R packages are installed:

- `rpart`
- `caret`
- `rpart.plot`

You can install the required packages using the following commands:

```R
install.packages("caret")
install.packages("rpart.plot")
```

## Dataset

The dataset used in this project is the Iris dataset, which is available in the `datasets` package in R. It contains 150 observations of iris flowers with the following features:

- Sepal Length
- Sepal Width
- Petal Length
- Petal Width
- Species (target variable with three classes: setosa, versicolor, virginica)

## Steps to Execute the Project

1. **Load the necessary libraries and data:**

   ```R
   library(rpart)
   library(caret)
   library(rpart.plot)


```R
   irisdata <- datasets::iris
   ```

2. **Explore the dataset:**

   Display the distribution of species in the dataset:

   ```R
   table(irisdata$Species)
   ```

   View summary statistics:

   ```R
   summary(irisdata)
   ```

   Check the structure of the dataset:

   ```R
   str(irisdata)
   ```

3. **Split the dataset into training and testing sets:**

   Set a seed for reproducibility and split the data:

   ```R
   set.seed(3033)
   intrain <- createDataPartition(y = irisdata$Species, p = 0.7, list = FALSE)
   training <- irisdata[intrain,]
   testing <- irisdata[-intrain,]
   ```

   Verify the dimensions of the training and testing sets:

   ```R
   dim(training)
   dim(testing)
   ```

4. **Set up the training control:**

   Define the cross-validation method and parameters:

   ```R
   trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
   ```

5. **Train the decision tree model:**

   Set a seed for reproducibility and train the model using the `train` function:

   ```R
   set.seed(3333)
   dtree_fit_info <- train(Species ~ ., data = training, method = "rpart",
                           parms = list(split = "information"),
                           trControl = trctrl,
                           tuneLength = 10)
   ```

6. **Visualize the decision tree:**

   Plot the final model using the `prp` function:

   ```R
   prp(dtree_fit_info$finalModel, box.palette = "Reds", tweak = 1.2)
   ```

## Results and Evaluation

After training the model, you can evaluate its performance on the testing set. You can also visualize the decision tree to understand how the model makes decisions based on the input features.

## Conclusion

This project demonstrates a simple yet effective way to classify iris species using a decision tree classifier. By leveraging the caret package for model training and evaluation, we can ensure robust and reproducible results.

## References

- [caret package documentation](https://cran.r-project.org/web/packages/caret/caret.pdf)
- [rpart package documentation](https://cran.r-project.org/web/packages/rpart/rpart.pdf)
- [rpart.plot package documentation](https://cran.r-project.org/web/packages/rpart.plot/rpart.plot.pdf)
- [Iris dataset description](https://en.wikipedia.org/wiki/Iris_flower_data_set)
