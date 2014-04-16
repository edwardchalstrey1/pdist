#encoding: utf-8
class PDist

	require 'diff/lcs'

	def self.distances(original, permutation)
		both, difference_abs = [], []
		both << original.map{|x| permutation.index(x)} # works out the index of original values in permutation
		both << Array(0..(original.length - 1)) # index values that original originally at
		difference = both.transpose.map {|x| x.reduce(:-)} # taking away old position from new position, to find the distance that the frag has moved when re-ordered
		difference.each {|i| difference_abs << i.abs }
		return difference_abs
	end

	def self.dev_dist(original, permutation)
		s = distances(original, permutation).inject(:+)
		n = permutation.length
		if n % 2 == 0
			score = (2.0 / (n ** 2).to_f) * s
		else
			score = (2.0 / ((n ** 2) - 1).to_f) * s
		end
		return score
	end

	def self.sq_dev_dist(original, permutation)
		sq_dists = []
		distances(original, permutation).each{|d| sq_dists << d**2}
		s = sq_dists.inject(:+)
		n = permutation.length
		return (3.0 / (n**3 - n).to_f) * s
	end

	def self.ham_dist(original, permutation)
		x = 0
		hds = [] # hamming distances
		permutation.each do |frag_id|
			if frag_id == original[x]
				hds << 0
			else
				hds << 1
			end
			x+=1
		end
		return hds.inject(:+)
	end

	def self.gen_ham_dist(original, permutation)
		ham_dist(original, permutation).to_f / permutation.length.to_f # normalize by dividing by the max score, which == number of objects
	end

	def self.mod_ham_dist(original, permutation)
		pos_1 = permutation.index(original[0]) # position of the first object of original order in permutation
		if original[0] != permutation[0]
			new_a = [permutation[pos_1..-1], permutation[0..pos_1-1]].flatten # re-order the permutation to get first object at front
		else
			new_a = permutation # running the if above for a permutation with 1 at front results in duplicates
		end
		return (ham_dist(original, new_a) + pos_1).to_f / (2 * (permutation.length - 1)).to_f # no need to take away 1 from pos_1 as the index in ruby is position - 1
	end

	def self.r_dist(original, permutation) # reverse R distance (since higher scores = bad)
		x = 0
		r = []
		n = permutation.length
		(n - 1).times do
			y = permutation.index(original[x])
			if original[x+1] == permutation[y+1]
				r << 0
			else
				r << 1
			end
			x+=1
		end
		return r.inject(:+).to_f / (n - 1).to_f
	end

	def self.lcs(original, permutation)
		lcs = Diff::LCS.LCS(original, permutation)
		return (permutation.length - lcs.length).to_f / (permutation.length - 1).to_f
	end

	def self.kendalls_tau(original, permutation)
		n = permutation.length
		x = 0
		kt = []
		n.times do
			y = 0
			n.times do 
				if original[x] < original[y] && permutation[x] > permutation[y]
					kt << 1
				else
					kt << 0
				end
				y+=1
			end
			x+=1
		end
		s = kt.inject(:+)
		return 2 * (s.to_f / (n**2 - n).to_f)
	end
end