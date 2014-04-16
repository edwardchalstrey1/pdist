pdist
=====

Ruby gem to compare permutations using distance measures/metrics.

Each method of the PDist class takes as input, two arrays of the same unique objects (i.e. both are the same array ordered differently).

The two input arrays are permutations of eachother, and the chosen method calculates the 'distance' between these permutations, according to a certain measure/metric.

**For example** take these two permutations of the integers 1..5:

```

a = [1,2,3,4,5]
b = [2,1,3,5,4]

```
