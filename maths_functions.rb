def find_modular_square_roots(n)
  n = n.to_i.abs
  return [0] if n<2
  return [0, 1] if n<5
  return (0..(n-1)).map{|k| k*k%n}.uniq!.sort!
end

def find_prime_measure_of_range(start_int,end_int)
  higher_prime_factors = find_higher_prime_factors_of_range(start_int,end_int)
  numer = find_higher_prime_factors_of_range(start_int,end_int).collect{|factor| Math.log(factor)}.sum
  denom = find_binom_coeff_prime_factors(end_int,end_int-start_int+1).collect{|factor| Math.log(factor)}.sum
  return 1.0 * numer / denom
end

def find_higher_prime_factors_of_range(start_int,end_int)
  return find_prime_factors_of_range(start_int,end_int).delete_if{|x| x<=end_int-start_int+1}
end

def find_prime_factors_of_range(start_int,end_int)
  # Deal with input
  ints = [start_int.to_i.abs, end_int.to_i.abs]
  start_int = ints.min
  end_int = ints.max
  # Deal with easy cases
  return [] if end_int < 2
  return find_prime_factors(end_int) if start_int==end_int
  # Deal with ranges
  factors = []
  for num in start_int..end_int
    factors.push(*find_prime_factors(num))
  end
  return factors.sort!
end

def find_binom_coeff_prime_factors(n,k)
  # Deal with input
  n = n.to_i.abs
  k = k.to_i.abs
  # Deal with easy cases
  return [] if 0==n || k>=n
  return find_prime_factors(n) if 1==n || k+1==n
  return find_binom_coeff_prime_factors(n,n-k) if n-k<k
  # Need to factor at least 2 numbers now
  top_factors = []
  bottom_factors = []
  for r in 1..k
    top_factors.push(*find_prime_factors(n-r+1))
    bottom_factors.push(*find_prime_factors(r))
  end
  # Remove first instance of each bottom_factor from top_factors
  bottom_factors.each{|b| top_factors.delete_at(top_factors.index(b) || top_factors.length)}
  return top_factors.sort!
end


def find_prime_factors(integer)
  # Deal with input
  integer = integer.to_i.abs
  return [] if integer < 2
  smallest_factor = find_smallest_factor(integer)
  return [smallest_factor] if integer < 4
  residue = integer / smallest_factor
  return find_prime_factors(residue).unshift(smallest_factor)
end

def find_smallest_factor(integer)
  # Deal with input
  integer = integer.to_i.abs
  return [] if integer < 2
  # Get potential prime numbers up to square root of integer
  max_small_factor = (integer**0.5).to_i
  factors_to_try = list_primes(max_small_factor)
  # Try each of these
  for test_factor in factors_to_try
    return test_factor if integer % test_factor == 0
  end
  # Integer must be prime!
  return integer
end

def list_primes_between(min_integer, max_integer)
  # Sort out inputs, make integer and positive, also ordered correctly
  ints = [min_integer.to_i.abs, max_integer.to_i.abs]
  min_integer = ints.min
  max_integer = ints.max
  # # DEBUG
  # puts "Range is #{[min_integer, max_integer]}"
  return [] if max_integer < 2
  # Check if a separate array of potential small prime factors is needed?
  factor_array_needed = min_integer>2
  max_small_factor = (max_integer**0.5).to_i
  factor_array = factor_array_needed ? list_primes_between(2,max_small_factor) : []
  # # DEBUG
  # puts "Factor array is #{factor_array}"
  # Loop over the range and figure out if each number is prime
  results_array = []
  for test_num in min_integer..max_integer
    next if test_num < 2
    max_small_factor = (test_num**0.5).to_i
    test_num_is_prime = true   # Overwritten if a factor found!
    for test_factor in ( factor_array_needed ? factor_array : results_array )
      break if test_factor < 2 || test_factor > max_small_factor
      test_num_is_prime = false if test_num % test_factor == 0
    end
    results_array.push(test_num) if test_num_is_prime
  end
  # Return the prime numbers found in the range
  return results_array
end

# New refactored version
def list_primes(max_integer)
  list_primes_between(1,max_integer)
end

# # Old version
# def list_primes(max_integer)
#   max_integer = max_integer.to_i.abs
#   results_array = []
#   return [] if max_integer < 2
#   for test_num in 2..max_integer
#     max_small_factor = (test_num**0.5).to_i
#     test_num_is_prime = true
#     for test_factor in results_array
#       break if test_factor > max_small_factor
#       test_num_is_prime = false if test_num % test_factor == 0
#     end
#     results_array.push(test_num) if test_num_is_prime
#   end
#   return results_array
# end
