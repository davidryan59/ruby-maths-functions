require_relative( 'maths_functions.rb' )

def puts_mod_roots(n, roots)
  puts "There are #{roots.size} roots mod #{n} which are: #{roots}"
end

(0..30).each{|k| roots = find_modular_square_roots(k); puts_mod_roots(k, roots)}

n = 0
while n!=-1
  puts "Give me a number (or -1 to quit)"
  n = gets.chomp.to_i
  roots = find_modular_square_roots(n)
  puts_mod_roots(n, roots)
  puts
end


return


def coeff_puts(n,k)
  puts "Prime factors of #{n} choose #{k} are #{find_binom_coeff_prime_factors(n,k)}"
end

k = 57
a = 100
l = 900
for n in a..(a+l-1) do coeff_puts(n,k) end; puts

results = {2=>nil,3=>nil,5=>nil,7=>nil,11=>nil,13=>nil,17=>nil,19=>nil,23=>nil,29=>nil}
first_k = 3;
# min_p = 2;
max_n = 250
for n in first_k*2..max_n
  max_k = n/2
  for k in first_k..max_k
    factors = find_binom_coeff_prime_factors(n,k)
    result = factors.first
    if result > n/k
      results[result]==nil ? results[result] = 1 : results[result] += 1
    end
    # puts "#{n} choose #{k} has lowest prime #{result} with all primes #{factors}" if result >= min_p
    # results[result]==nil ? result[result]=1 : results[result] += 1
  end
end
puts "Largest prime results for max_n = #{max_n} is #{results}"

return

# EXAMPLES list_primes_between
puts "Primes from 0 to 30 are #{list_primes_between(0,30)}"
puts "Primes from 70 to 100 are #{list_primes_between(70,100)}"
puts "Primes from 38 to 102 are #{list_primes_between(38,102)}"
puts "Primes from 1900 to 2100 are #{list_primes_between(1900,2100)}"
puts "There are #{list_primes_between(100,200).length} primes between 100 and 200"
puts

# EXAMPLES list_primes
puts "Primes to 50 are #{list_primes(50)}"
puts "Primes to 200 are #{list_primes(200)}"
puts "There are #{list_primes(10000).length} primes below 10000"
puts

# EXAMPLES find_smallest_factor, find_prime_factors
for integer in -5..10
  puts "#{integer} has prime factors #{find_prime_factors(integer)} with minimum #{find_smallest_factor(integer)}"
end
puts
for a in 1..14
  integer = ((rand+1)*(10.0**(1.0*a/2))).to_i
  puts "#{integer} has prime factors #{find_prime_factors(integer)} with minimum #{find_smallest_factor(integer)}"
end
puts
start_integer = 100000 + rand(900000)
for a in 1..10
  integer = start_integer + a
  puts "#{integer} has prime factors #{find_prime_factors(integer)} with minimum #{find_smallest_factor(integer)}"
end
puts
# factors1
# for a in 256..284
#   integer = a
#   puts "#{integer} has prime factors #{find_prime_factors(integer)} with minimum #{find_smallest_factor(integer)}"
# end
# puts
# factors1
# for a in 256..284
#   integer = a
#   puts "#{integer} has prime factors #{find_prime_factors(integer)} with minimum #{find_smallest_factor(integer)}"
# end
# puts

puts "Prime factors of 30 choose 6 are #{find_binom_coeff_prime_factors(30,6)}"
puts "Prime factors of 71 choose 23 are #{find_binom_coeff_prime_factors(71,23)}"
puts "Prime factors of 71 choose 31 are #{find_binom_coeff_prime_factors(71,31)}"
puts "Prime factors of 100 choose 10 are #{find_binom_coeff_prime_factors(100,10)}"
puts "Prime factors of 127 choose 19 are #{find_binom_coeff_prime_factors(127,19)}"
puts "Prime factors of 284 choose 28 are #{find_binom_coeff_prime_factors(284,28)}"
puts "Necessary factors of 256...284 are #{find_higher_prime_factors_of_range(256,284)}"
puts "Prime factors of 474 choose 66 are #{find_binom_coeff_prime_factors(474,66)}"
puts "Prime factors of 959 choose 56 are #{find_binom_coeff_prime_factors(959,56)}"
puts "Prime factors of 62 choose 6 are #{find_binom_coeff_prime_factors(62,6)}"
puts "Prime factors of 284 choose 29 are #{find_binom_coeff_prime_factors(284,29)}"
puts "Prime factors of 284 choose 27 are #{find_binom_coeff_prime_factors(284,27)}"
puts


def the_puts(a,b)
  puts "#{a} to #{b}: #{find_prime_measure_of_range(a,b)}, #{find_higher_prime_factors_of_range(a,b)} with all primes #{find_prime_factors_of_range(a,b)}"
end

a=10;b=10;the_puts(a,b)
a=11;b=11;the_puts(a,b)

a=1;b=10;the_puts(a,b)
a=2;b=11;the_puts(a,b)
a=3;b=12;the_puts(a,b)
a=4;b=13;the_puts(a,b)
a=24;b=30;the_puts(a,b)
a=30;b=40;the_puts(a,b)
a=256;b=284;the_puts(a,b)
a=1500;b=1530;the_puts(a,b)
a=100_000;b=100_100;the_puts(a,b)
a=226;b=226+14-1;the_puts(a,b)
puts

len = 14
# l = lambda { |start_int, end_int, len| results = []; (start_int..end_int).each{results.push(find_prime_measure_of_range)}
#    b = a + len - 1; results.push()|a,b| }
max_values = []
for a in 1..3000
  b = a + len - 1
  max_values.push(a) if find_prime_measure_of_range(a,b)>0.999
  break if max_values.length>20
end
puts "For length #{len} max higher primes achieved at #{max_values}"
puts
