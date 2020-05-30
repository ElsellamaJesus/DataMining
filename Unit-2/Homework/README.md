## Homework
---
### Homework 1
#### Geometric distribution
##### R functions dgeom, pgeom, qgeom y rgeom.
The function R dgeom (x, prob) is the probability of x failures before the first success (observe the difference) when the probability of success is prob. The function R pgeom (q, prob, lower.tail) is the cumulative probability (lower.tail = TRUE for the left tail, lower.tail = FALSE for the right tail) less than or equal to q fail before success. The function R rgeom (n, size, prob) returns n random numbers from the geometric distribution x ~ geom (prob). The function R qgeom (p, prob, lower.tail) is the number of failures at the q percentile (lower.tail = TRUE).

##### Description
Density, distribution function, quantile function and random generation for the geometric distribution with parameter prob.

##### Use in R
    dgeom (x, prob, log = FALSE)
    pgeom (q, prob, lower.tail = TRUE, log.p = FALSE)
    qgeom (p, prob, lower.tail = TRUE, log.p = FALSE)
    rgeom (n, prob)

##### Arguments
    x, q	vector of quantiles representing the number of failures in a sequence of Bernoulli trials before success occurs.
    p	vector of probabilities.
    n	number of observations to generate.
    prob	probability of success in each trial.
    log, log.p	logical; if TRUE, probabilities p are given as log(p).
    lower.tail	logical; if TRUE (default), probabilities are P[X <= x], otherwise, P[X > x].

##### Value
dgeom gives the density, pgeom gives the distribution function, qgeom gives the quantile function, and rgeom generates random deviates.s.

#### Graph grammar
Generally speaking, R, in its basic version, includes functions to create graphics. However, these tools are quite limited in terms of the editing possibilities they include. All in all, they are valid for exploratory analysis use. That is, a use focused on the visualization of information that allows - within the context of an investigation process - to make decisions for subsequent statistical analyzes. After exploring these alternatives, the use of ggplot2 will be explored, a package specialized in graphic design that allows a better visualization of results, especially focused on the dissemination of research results.

The ggplot2 package is an R package specialized in construction and design for data visualization. In this sense, it is a package whose functionalities go beyond a purely "scientific" or exploratory use and is oriented to the different dynamics of dissemination of results of research processes, this includes:
    Dissemination of results of scientific research processes for specialized public. This may refer to academic contexts (publications in specialized magazines, books, etc.) or professional (research reports for consulting activities in the public or private sphere, for example).
    Dissemination of results of scientific research processes for non-specialized public. This refers, for example, to the dissemination of information in contexts such as the mass media (television, paper or digital newspapers) or social networks (twitter, facebook, instagram, etc.).

##### Ggplot2 package grammar

    1. First, the objects resulting from the construction of a graph are not an image but an object of a specific graphical type. This allows you to configure a graphic like any other R element, directly from the syntax,
    2. Due to the above, the editability of the constructed graphics is greater. By defining the set of information to display, you can configure different types of charts.
    3. In the third place, you can indicate that the structure of this package presents a specific grammar in relation to its syntax. As we will see below, its syntax is directly related to three elements that make up the structure of any data visualization: the information (data) to be used, the aesthetics (aesthetics) or the definition of the axes where the data to be displayed is positioned, and the geometry (geometry) or the visual elements that are positioned on the graph to represent the data that is interesting to visualize.

##### Elements that make up a graph built using the ggplot function.

| Layer | Description |
| --- | --- |
| Data | Set of information to be represented graphically. In our case it is one or more variables, or a database. |
| Esthetic | Scale in which the information of interest will be positioned. Refers to the positioning of the information to be represented on the different axes and dimensions of the resulting graph. We talk about the positioning of variables in the X and Y axes as well as the possibility of indicating variables that can be positioned as a fill color within the different axes, as a function of transparency, etc. |
| Geometry | Shapes, visual elements, which will be used to visually represent the information already recorded in the data and located in the different positions of the graph mentioned in the aesthetics.43 Each geometry specification allows different characteristics of the variable (s) and its distribution. |

---