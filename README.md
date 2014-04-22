pdist
=====

Ruby gem to compare permutations using distance measures/metrics.

Install and pre-requisites
----

```

gem install pdist

```

OR download [here](http://rubygems.org/gems/pdist)

You must also have the [diff-lcs](http://rubygems.org/gems/diff-lcs) gem installed, to use the **longest common subsequence** method (see below).

Usage
----

Each method of the PDist class takes as input, two arrays of the same unique objects (i.e. both are the same array ordered differently).

The two input arrays are permutations of eachother, and the chosen method calculates the 'distance' between these permutations, according to a certain measure/metric.

**For example** take these two permutations of the integers 1..5:

```

a = [1,2,3,4,5]
b = [2,1,3,5,4]

```

Each of the methods below gives as output a float of value x, where **0.0 <= x <= 1.0**

This output value is the distance between the permutations as attributed by the metric, normalized in the range **0.0 to 1.0**

Output values closer to **0.0** indicate closely matching permutations, where **0.0** is a perfect match, and **1.0** is the maximum possible distance.

### Deviation distance

```

PDist.deviation(a,b)

```

### Square deviation distance

```

PDist.square(a,b)

```

### Hamming distance

```

PDist.hamming(a,b)

```

### The R distance (reversed)

```

PDist.rdist(a,b)

```

### The longest common sub-sequence

```

PDist.lcs(a,b)

```

### Kendall's tau

```

PDist.kendalls_tau(a,b)

```

Mathematical descriptions of methods
----

Each of the methods in the PDist class is described mathematically by [Sevaux and Kenneth (2005)](http://www.researchgate.net/publication/228565454_Permutation_distance_measures_for_memetic_algorithms_with_population_management/file/d912f50a9de08542ff.pdf)

The authors also describe several other distance metrics for permutation comparison. Forkers who wish to implement these methods or others are most welcome.

