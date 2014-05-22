#encoding: utf-8
require_relative '../lib/pdist'
require 'test/unit'

class TestPDist < Test::Unit::TestCase

	def setup
		@a = %w(a b c d)
		@b = @a.reverse
		@c = %w(b d c a)
	end

	def test_distances
		assert_equal([0,0,0,0], PDist.distances(@a,@a))
		assert_equal([3,1,1,3], PDist.distances(@a,@b))
		assert_equal([3,1,0,2], PDist.distances(@a,@c))
	end

	def test_deviation
		assert_equal(0, PDist.deviation(@a,@a))
		assert_equal(1, PDist.deviation(@a,@b))
		assert_equal(6.0/8.0, PDist.deviation(@a,@c))
	end

	def test_square
		assert_equal(0, PDist.square(@a,@a))
		assert_equal(1, PDist.square(@a,@b))
		assert_equal(4.2/6.0, PDist.square(@a,@c))
	end

	def test_hamming
		assert_equal(0, PDist.hamming(@a,@a))
		assert_equal(1, PDist.hamming(@a,@b))
		assert_equal(0.75, PDist.hamming(@a,@c))
	end

	def test_rdist
		assert_equal(0, PDist.rdist(@a,@a))
		assert_equal(1, PDist.rdist(@a,@b))
		assert_equal(1, PDist.rdist(@a,@c))
		assert_equal(2.0/3.0, PDist.rdist(@a,%w(a b d c)))
	end

	def test_lcs
		assert_equal(0, PDist.lcs(@a,@a))
		assert_equal(1, PDist.lcs(@a,@b))
		assert_equal(2.0/3.0, PDist.lcs(@a,@c))
	end

	def test_kendalls_tau
		assert_equal(0, PDist.kendalls_tau(@a,@a))
		assert_equal(1, PDist.kendalls_tau(@a,@b))
		assert_equal(2.0/3.0, PDist.kendalls_tau(@a,@c))
	end
end