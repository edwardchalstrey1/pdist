#encoding: utf-8
require_relative 'lib/pdist'
require 'test/unit'

class TestPDist < Test::Unit::TestCase

	A = %w(a b c d)
	B = A.reverse
	C = %w(b d c a)

	def test_deviation
		assert_equal(0, PDist.deviation(A,A))
		assert_equal(1, PDist.deviation(A,B))
		assert_equal(6.0/8.0, PDist.deviation(A,C))
	end

	def test_square
		assert_equal(0, PDist.square(A,A))
		assert_equal(1, PDist.square(A,B))
		# assert_equal(4.0/5.0, PDist.square(A,C))
	end

	def test_hamming
		assert_equal(0, PDist.hamming(A,A))
		assert_equal(1, PDist.hamming(A,B))
		assert_equal(0.75, PDist.hamming(A,C))
	end

	def test_rdist
		assert_equal(0, PDist.rdist(A,A))
		assert_equal(1, PDist.rdist(A,B))
		assert_equal(1, PDist.rdist(A,C))
		assert_equal(2.0/3.0, PDist.rdist(A,%w(a b d c)))
	end

	def test_lcs
		assert_equal(0, PDist.lcs(A,A))
		assert_equal(1, PDist.lcs(A,B))
		assert_equal(2.0/3.0, PDist.lcs(A,C))
	end

	def test_kendalls_tau
		assert_equal(0, PDist.kendalls_tau(A,A))
		assert_equal(1, PDist.kendalls_tau(A,B))
		# assert_equal(1.0/3.0, PDist.kendalls_tau(A,C))
	end
end