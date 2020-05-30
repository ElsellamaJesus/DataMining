# Homework
---
## Homework 1
### <html><H3 align="center"> Geometric distribution </H3></html>
#### R functions dgeom, pgeom, qgeom y rgeom.
The function R dgeom (x, prob) is the probability of x failures before the first success (observe the difference) when the probability of success is prob. The function R pgeom (q, prob, lower.tail) is the cumulative probability (lower.tail = TRUE for the left tail, lower.tail = FALSE for the right tail) less than or equal to q fail before success. The function R rgeom (n, size, prob) returns n random numbers from the geometric distribution x ~ geom (prob). The function R qgeom (p, prob, lower.tail) is the number of failures at the q percentile (lower.tail = TRUE).

#### Description
Density, distribution function, quantile function and random generation for the geometric distribution with parameter prob.

#### Use in R
    dgeom (x, prob, log = FALSE)
    pgeom (q, prob, lower.tail = TRUE, log.p = FALSE)
    qgeom (p, prob, lower.tail = TRUE, log.p = FALSE)
    rgeom (n, prob)

#### Arguments
    x, q	vector of quantiles representing the number of failures in a sequence of Bernoulli trials before success occurs.
    p	vector of probabilities.
    n	number of observations to generate.
    prob	probability of success in each trial.
    log, log.p	logical; if TRUE, probabilities p are given as log(p).
    lower.tail	logical; if TRUE (default), probabilities are P[X <= x], otherwise, P[X > x].

#### Value
dgeom gives the density, pgeom gives the distribution function, qgeom gives the quantile function, and rgeom generates random deviates.s.

### <html><H3 align="center"> Graph grammar </H3></html>
Generally speaking, R, in its basic version, includes functions to create graphics. However, these tools are quite limited in terms of the editing possibilities they include. All in all, they are valid for exploratory analysis use. That is, a use focused on the visualization of information that allows - within the context of an investigation process - to make decisions for subsequent statistical analyzes. After exploring these alternatives, the use of ggplot2 will be explored, a package specialized in graphic design that allows a better visualization of results, especially focused on the dissemination of research results.

The ggplot2 package is an R package specialized in construction and design for data visualization. In this sense, it is a package whose functionalities go beyond a purely "scientific" or exploratory use and is oriented to the different dynamics of dissemination of results of research processes, this includes:
    Dissemination of results of scientific research processes for specialized public. This may refer to academic contexts (publications in specialized magazines, books, etc.) or professional (research reports for consulting activities in the public or private sphere, for example).
    Dissemination of results of scientific research processes for non-specialized public. This refers, for example, to the dissemination of information in contexts such as the mass media (television, paper or digital newspapers) or social networks (twitter, facebook, instagram, etc.).

#### Ggplot2 package grammar
1. First, the objects resulting from the construction of a graph are not an image but an object of a specific graphical type. This allows you to configure a graphic like any other R element, directly from the syntax,
2. Due to the above, the editability of the constructed graphics is greater. By defining the set of information to display, you can configure different types of charts.
3. In the third place, you can indicate that the structure of this package presents a specific grammar in relation to its syntax. As we will see below, its syntax is directly related to three elements that make up the structure of any data visualization: the information (data) to be used, the aesthetics (aesthetics) or the definition of the axes where the data to be displayed is positioned, and the geometry (geometry) or the visual elements that are positioned on the graph to represent the data that is interesting to visualize.

#### Elements that make up a graph built using the ggplot function.

| Layer | Description |
| --- | --- |
| Data | Set of information to be represented graphically. In our case it is one or more variables, or a database. |
| Esthetic | Scale in which the information of interest will be positioned. Refers to the positioning of the information to be represented on the different axes and dimensions of the resulting graph. We talk about the positioning of variables in the X and Y axes as well as the possibility of indicating variables that can be positioned as a fill color within the different axes, as a function of transparency, etc. |
| Geometry | Shapes, visual elements, which will be used to visually represent the information already recorded in the data and located in the different positions of the graph mentioned in the aesthetics.43 Each geometry specification allows different characteristics of the variable (s) and its distribution. |

---
## Homework 2
### <html><H3 align="center"> geom_jitter function </H3></html>
The jitter geom is a convenient shortcut for geom_point(position = "jitter"). It adds a small amount of random variation to the location of each point, and is a useful way of handling overplotting caused by discreteness in smaller datasets.

#### Use
    geom_jitter(
        mapping = NULL,
        data = NULL,
        stat = "identity",
        position = "jitter",
        ...,
        width = NULL,
        height = NULL,
        na.rm = FALSE,
        show.legend = NA,
        inherit.aes = TRUE
               )

#### Arguments
* ##### Mapping
    Set of aesthetic mappings created by aes() or aes_(). If specified and inherit.aes = TRUE (the default), it is combined with the default mapping at the top level of the plot. You must supply mapping if there is no plot mapping.
* ##### Data
    -The data to be displayed in this layer. There are three options:
    -If NULL, the default, the data is inherited from the plot data as specified in the call to ggplot().
    -A data.frame, or other object, will override the plot data. All objects will be fortified to produce a data frame. See fortify() for which variables will be created.
    -A function will be called with a single argument, the plot data. The return value must be a data.frame, and will be used as the layer data. A function can be created from a formula (e.g. ~ head(.x, 10))..
* ##### Stat
    The statistical transformation to use on the data for this layer, as a string.
* ##### Position
    Position adjustment, either as a string, or the result of a call to a position adjustment function.
* ##### Width
    Amount of vertical and horizontal jitter. The jitter is added in both positive and negative directions, so the total spread is twice the value specified here.
* ##### Height
    Amount of vertical and horizontal jitter. The jitter is added in both positive and negative directions, so the total spread is twice the value specified here.
* ##### na.rm
    If FALSE, the default, missing values are removed with a warning. If TRUE, missing values are silently removed.
* ##### Show.legend
    logical. Should this layer be included in the legends? NA, the default, includes if any aesthetics are mapped. FALSE never includes, and TRUE always includes. It can also be a named logical vector to finely select the aesthetics to display.
* ##### inherit.aes (heredar.aes)
    If FALSE, overrides the default aesthetics, rather than combining with them. This is most useful for helper functions that define both data and aesthetics and shouldn't inherit behaviour from the default plot specification, e.g. borders().

---
## Homework 3
### <html><H3 align="center"> How do we understand the value of P </H3></html>
Understanding the p-value will really help you deepen your understanding of hypothesis testing in general. Before talking about what the p-value is, let's talk about what it is not.
* The p-value is NOT the probability that the statement is true. Of course, this would be an amazing thing to know! Think about it: "There is a 10% chance that this drug will work." Unfortunately, this is not the case. Actually determining this probability would be really difficult, if not impossible!
* The p-value is NOT the probability that the null hypothesis is true. Another one that seems so logical that it has to be correct! This is much closer to reality, but again it is too strong a statement.

The p-value is actually the probability of obtaining a sample like ours, or more extreme than ours IF the null hypothesis is true. So we assume that the null hypothesis is true and then determine how "strange" our sample really is. If it's not that strange (a large p-value), then we don't change our minds about the null hypothesis. As the p-value gets smaller, we start to wonder if the null value really is true and good, maybe we should change our mind (and reject the null hypothesis).

A large p-value indicates that it would be quite normal to obtain a sample like ours if the null hypothesis is true. As you can see, here is no reason to change your mind like we did with a small p-value

---
## Homework 4
### <html><H3 align="center"> SplitRatio </H3></html>
#### sample.spit
##### Split Data Into Test And Train Set
Split data from vector Y into two sets in predefined ratio while preserving relative ratios of different labels in Y. Used to split the data used during classification into train and test subsets.

#### Use
    sample.split( Y, SplitRatio = 2/3, group = NULL )

#### Arguments
* ##### y  
    Vector of data labels. If there are only a few labels (as is expected) than relative ratio of data in both subsets will be the same.
* ##### SplitRatio
    Splitting ratio:
        if (0<=splitratio<1)< code=""> then SplitRatio fraction of points from Y will be set toTRUE
        if (SplitRatio==1) then one random point from Y will be set to TRUE
        if (SplitRatio>1) then SplitRatio number of points from Y will be set to TRUE
* ##### group
    Optional vector/list used when multiple copies of each sample are present. In such a case group contains unique sample labels, marking all copies of the same sample with the same label, and the function tries to place all copies in either train or test subset. If provided than has to have the same length as Y.
* #### Details
    Function msc.sample.split is the old name of the sample.split function. To be retired soon.
* #### Value
    SplitRatio*length(Y) elements set to TRUE.

### <html><H3 align="center"> lm </H3></html>
#### Fitting Linear Models
lm is used to fit linear models. It can be used to carry out regression, single stratum analysis of variance and analysis of covariance (although aov may provide a more convenient interface for these).

#### Use
    lm(formula, data, subset, weights, na.action,
    method = "qr", model = TRUE, x = FALSE, y = FALSE, qr = TRUE,
    singular.ok = TRUE, contrasts = NULL, offset, ...)

#### Argumentos
* ##### formula
    an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted. The details of model specification are given under ‘Details’.
* ##### data
    an optional data frame, list or environment (or object coercible by as.data.frame to a data frame) containing the variables in the model. If not found in data, the variables are taken from environment(formula), typically the environment from which lm is called.
* ##### subset
    an optional vector specifying a subset of observations to be used in the fitting process.
* ##### weights
    an optional vector of weights to be used in the fitting process. Should be NULL or a numeric vector. If non-NULL, weighted least squares is used with weights weights (that is, minimizing sum(w*e^2)); otherwise ordinary least squares is used. See also ‘Details’,
* ##### na.action
    a function which indicates what should happen when the data contain NAs. The default is set by the na.action setting of options, and is na.fail if that is unset. The ‘factory-fresh’ default is na.omit. Another possible value is NULL, no action. Value na.exclude can be useful.
* ##### method
    the method to be used; for fitting, currently only method = "qr" is supported; method = "model.frame" returns the model frame (the same as with model = TRUE, see below).
* ##### model, x, y, qr
    logicals. If TRUE the corresponding components of the fit (the model frame, the model matrix, the response, the QR decomposition) are returned.
* ##### singular.ok
    logical. If FALSE (the default in S but not in R) a singular fit is an error.
* ##### contrasts
    an optional list. See the contrasts.arg of model.matrix.default.
* ##### offset
    this can be used to specify an a priori known component to be included in the linear predictor during fitting. This should be NULL or a numeric vector or matrix of extents matching those of the response. One or more offset terms can be included in the formula instead or as well, and if more than one are specified their sum is used. See model.offset.
* ##### …
    additional arguments to be passed to the low level regression fitting functions (see below).

#### Value
lm returns an object of class "lm" or for multiple responses of class c("mlm", "lm").
The functions summary and anova are used to obtain and print a summary and analysis of variance table of the results. The generic accessor functions coefficients, effects, fitted.values and residuals extract various useful features of the value returned by lm.

---
## Homework 5
### <html><H3 align="center"> glm() </H3></html>



