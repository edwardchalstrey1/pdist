#encoding: utf-8
require_relative 'lib/pdist'
require 'test/unit'

class TestPDist < Test::Unit::TestCase

	A = %w(a b c)
	C = A.reverse

	def test_deviation
		assert_equal(0, PDist::deviation(A,A))
		assert_equal(1, PDist::deviation(A,C))
		assert_equal(1, PDist::deviation(%w(a b), %w(b a)))
	end

	def test_square
		assert_equal(0, PDist::square(A,A))
		assert_equal(1, PDist::square(A,C))
	end

	def test_hamming
		assert_equal(0, PDist::hamming(A,A))
		assert_equal(1, PDist::hamming(A, %w(b c a)))
	end

	def test_rdist
		assert_equal(0, PDist::rdist(A,A))
		assert_equal(1, PDist::rdist(A,C))
	end

	def test_lcs
		assert_equal(0, PDist::lcs(A,A))
		assert_equal(1, PDist::lcs(A,C))
	end

	def test_kendalls_tau
		assert_equal(0, PDist::kendalls_tau(A,A))
		assert_equal(1, PDist::kendalls_tau(A,C))
	end
end