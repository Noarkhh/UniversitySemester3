isPrime :: Integral t => t -> Bool
isPrime n = [i | i <- [2..floor (sqrt n)], n `mod` i == 0] == []

primes :: [Int]
primes = eratoSieve [2..]
 where
   eratoSieve :: [Int] -> [Int]
   eratoSieve (p : xs) = p : eratoSieve [x | x <- xs, x `mod` p /= 0]
