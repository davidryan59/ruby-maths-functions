require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( 'maths_functions.rb' )

class My_Functions < MiniTest::Test

  # # TEMPLATES
  # def test_foo
  #   skip
  #   expected = 1
  #   actual = 1  # Use function here
  #   assert_equal(expected, actual)
  # end
  #
  # def test_foo2
  #   skip
  #   expected = 1
  #   actual = 1  # Use function here
  #   delta = 0.001
  #   assert_in_delta(expected, actual, delta)
  # end

  # FUNCTION: list_primes

  # 0 or 1 to give no primes
  def test_list_primes_1
    # skip
    expected = []
    actual = list_primes(1)
    assert_equal(expected, actual)
  end

  # Numbers 2 and higher give at least 1 prime
  def test_list_primes_2
    # skip
    expected = [2]
    actual = list_primes(2)
    assert_equal(expected, actual)
  end
  def test_list_primes_6
    # skip
    expected = [2,3,5]
    actual = list_primes(6)
    assert_equal(expected, actual)
  end
  def test_list_primes_17
    # skip
    expected = [2,3,5,7,11,13,17]
    actual = list_primes(17)
    assert_equal(expected, actual)
  end
  def test_list_primes_30
    # skip
    expected = [2,3,5,7,11,13,17,19,23,29]
    actual = list_primes(30)
    assert_equal(expected, actual)
  end

  # Test number of primes for various 10**n
  def test_list_primes_100
    # skip
    expected = 25
    actual = list_primes(100).length
    assert_equal(expected, actual)
  end
  def test_list_primes_1000
    # skip
    expected = 168
    actual = list_primes(1000).length
    assert_equal(expected, actual)
  end
  def test_list_primes_100_000
    # skip
    expected = 9592
    actual = list_primes(10**5).length
    assert_equal(expected, actual)
  end

  # Negative inputs to be made positive
  def test_list_primes_minus30
    # skip
    expected = list_primes(30)
    actual = list_primes(-30)
    assert_equal(expected, actual)
  end

  # Fractional inputs to be truncated
  def test_list_primes_7_5
    # skip
    expected = list_primes(7)
    actual = list_primes(7.5)
    assert_equal(expected, actual)
  end
  def test_list_primes_10_5
    # skip
    expected = list_primes(10)
    actual = list_primes(10.5)
    assert_equal(expected, actual)
  end

  # FUNCTION: list_primes_between

  # A few normal cases
  def test_list_primes_between_0_10
    # skip
    expected = [2, 3, 5, 7]
    actual = list_primes_between(0,10)
    assert_equal(expected, actual)
  end
  def test_list_primes_between_1_10
    # skip
    expected = [2, 3, 5, 7]
    actual = list_primes_between(1,10)
    assert_equal(expected, actual)
  end
  def test_list_primes_between_2_10
    # skip
    expected = [2, 3, 5, 7]
    actual = list_primes_between(2,10)
    assert_equal(expected, actual)
  end
  def test_list_primes_between_20_50
    # skip
    expected = [23,29,31,37,41,43,47]
    actual = list_primes_between(20,50)
    assert_equal(expected, actual)
  end
  def test_list_primes_between_100_130
    # skip
    expected = [101,103,107,109,113,127]
    actual = list_primes_between(100,130)
    assert_equal(expected, actual)
  end
  # Empty cases
  def test_list_primes_between_0_0
    # skip
    expected = []
    actual = list_primes_between(0,0)
    assert_equal(expected, actual)
  end
  def test_list_primes_between_0_1
    # skip
    expected = []
    actual = list_primes_between(0,1)
    assert_equal(expected, actual)
  end
  def test_list_primes_between_1_1
    # skip
    expected = []
    actual = list_primes_between(1,1)
    assert_equal(expected, actual)
  end
  # Bad input cases
  def test_list_primes_between_m5_m11
    # skip
    expected = [5,7,11]
    actual = list_primes_between(-5,-11)
    assert_equal(expected, actual)
  end
  def test_list_primes_between_25_15
    # skip
    expected = [17,19,23]
    actual = list_primes_between(25,15)
    assert_equal(expected, actual)
  end

  # FUNCTION find_smallest_factor
  # Degenerate cases
  def test_find_smallest_factor_0
    # skip
    expected = []
    actual = find_smallest_factor(0)
    assert_equal(expected, actual)
  end
  def test_find_smallest_factor_1
    # skip
    expected = []
    actual = find_smallest_factor(1)
    assert_equal(expected, actual)
  end
  # Positive cases
  def test_find_smallest_factor_2
    # skip
    expected = 2
    actual = find_smallest_factor(2)
    assert_equal(expected, actual)
  end
  def test_find_smallest_factor_15
    # skip
    expected = 3
    actual = find_smallest_factor(15)
    assert_equal(expected, actual)
  end
  def test_find_smallest_factor_143
    # skip
    expected = 11
    actual = find_smallest_factor(143)
    assert_equal(expected, actual)
  end
  def test_find_smallest_factor_2695
    # skip
    expected = 5
    actual = find_smallest_factor(2695)
    assert_equal(expected, actual)
  end
  def test_find_smallest_factor_65537
    # skip
    expected = 65537
    actual = find_smallest_factor(65537)   # Prime number
    assert_equal(expected, actual)
  end
  def test_find_smallest_factor_66049
    # skip
    expected = 257
    actual = find_smallest_factor(66049)   # Square number
    assert_equal(expected, actual)
  end
  # Negative cases
  def test_find_smallest_factor_m35
    # skip
    expected = 5
    actual = find_smallest_factor(-35)
    assert_equal(expected, actual)
  end
  def test_find_smallest_factor_m100
    # skip
    expected = 2
    actual = find_smallest_factor(-100)
    assert_equal(expected, actual)
  end
  def test_find_smallest_factor_m1979
    # skip
    expected = 1979
    actual = find_smallest_factor(-1979)   # Prime number
    assert_equal(expected, actual)
  end
  def test_find_smallest_factor_m11881
    # skip
    expected = 109
    actual = find_smallest_factor(-11881)   # Square number
    assert_equal(expected, actual)
  end

  # FUNCTION find_prime_factors
  # Degenerate cases
  def test_find_prime_factors_0
    # skip
    expected = []
    actual = find_prime_factors(0)
    assert_equal(expected, actual)
  end
  def test_find_prime_factors_1
    # skip
    expected = []
    actual = find_prime_factors(1)
    assert_equal(expected, actual)
  end
  # Positive cases
  def test_find_prime_factors_2
    # skip
    expected = [2]
    actual = find_prime_factors(2)
    assert_equal(expected, actual)
  end
  def test_find_prime_factors_4
    # skip
    expected = [2,2]
    actual = find_prime_factors(4)
    assert_equal(expected, actual)
  end
  def test_find_prime_factors_15
    # skip
    expected = [3,5]
    actual = find_prime_factors(15)
    assert_equal(expected, actual)
  end
  def test_find_prime_factors_49
    # skip
    expected = [7,7]
    actual = find_prime_factors(49)
    assert_equal(expected, actual)
  end
  def test_find_prime_factors_105
    # skip
    expected = [3,5,7]
    actual = find_prime_factors(105)
    assert_equal(expected, actual)
  end
  def test_find_prime_factors_1999
    # skip
    expected = [1999]
    actual = find_prime_factors(1999)
    assert_equal(expected, actual)
  end
  def test_find_prime_factors_30030
    # skip
    expected = [2,3,5,7,11,13]
    actual = find_prime_factors(30030)
    assert_equal(expected, actual)
  end
  def test_find_prime_factors_65336
    # skip
    expected = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
    actual = find_prime_factors(65536)
    assert_equal(expected, actual)
  end
  def test_find_prime_factors_187974
    # skip
    expected = [2,3,3,3,59,59]
    actual = find_prime_factors(187974)
    assert_equal(expected, actual)
  end


    # FUNCTION find_binom_coeff_prime_factors
    # Degenerate cases
    def test_find_binom_coeff_pfact_0_0
      # skip
      expected = []
      actual = find_binom_coeff_prime_factors(0,0)
      assert_equal(expected, actual)
    end
    def test_find_binom_coeff_pfact_1_0
      # skip
      expected = []
      actual = find_binom_coeff_prime_factors(1,0)
      assert_equal(expected, actual)
    end
    def test_find_binom_coeff_pfact_1_1
      # skip
      expected = []
      actual = find_binom_coeff_prime_factors(1,1)
      assert_equal(expected, actual)
    end
    # Positive cases
    def test_find_binom_coeff_pfact_4_2
      # skip
      expected = [2,3]       # 6
      actual = find_binom_coeff_prime_factors(4,2)
      assert_equal(expected, actual)
    end
    def test_find_binom_coeff_pfact_7_3
      # skip
      expected = [5,7]       # 35
      actual = find_binom_coeff_prime_factors(7,3)
      assert_equal(expected, actual)
    end
    def test_find_binom_coeff_pfact_10_4
      # skip
      expected = [2,3,5,7]    # 210
      actual = find_binom_coeff_prime_factors(10,4)
      assert_equal(expected, actual)
    end
    def test_find_binom_coeff_pfact_13_10
      # skip
      expected = [2,11,13]    # 286
      actual = find_binom_coeff_prime_factors(13,10)
      assert_equal(expected, actual)
    end
    def test_find_binom_coeff_pfact_16_8
      # skip
      expected = [2,3,3,5,11,13]    # 12870
      actual = find_binom_coeff_prime_factors(16,8)
      assert_equal(expected, actual)
    end
    def test_find_binom_coeff_pfact_20_7
      # skip
      expected = [2,2,2,2,3,5,17,19]    # 77520
      actual = find_binom_coeff_prime_factors(20,7)
      assert_equal(expected, actual)
    end

    # FUNCTION find_prime_factors_of_range
    # Degenerate cases
    def test_find_prime_factors_of_range_0_0
      # skip
      expected = []
      actual = find_prime_factors_of_range(0,0)
      assert_equal(expected, actual)
    end
    def test_find_prime_factors_of_range_0_1
      # skip
      expected = []
      actual = find_prime_factors_of_range(0,1)
      assert_equal(expected, actual)
    end
    def test_find_prime_factors_of_range_1_1
      # skip
      expected = []
      actual = find_prime_factors_of_range(1,1)
      assert_equal(expected, actual)
    end
    # Positive cases
    def test_find_prime_factors_of_range_2_0
      # skip
      expected = [2]
      actual = find_prime_factors_of_range(2,0)   # Order should be sorted inside function
      assert_equal(expected, actual)
    end
    def test_find_prime_factors_of_range_1_3
      # skip
      expected = [2,3]
      actual = find_prime_factors_of_range(1,3)
      assert_equal(expected, actual)
    end
    def test_find_prime_factors_of_range_4_6
      # skip
      expected = [2,2,2,3,5]
      actual = find_prime_factors_of_range(4,6)
      assert_equal(expected, actual)
    end
    def test_find_prime_factors_of_range_7_10
      # skip
      expected = [7 , 2,2,2 , 3,3 , 2,5].sort!
      actual = find_prime_factors_of_range(7,10)
      assert_equal(expected, actual)
    end


end
