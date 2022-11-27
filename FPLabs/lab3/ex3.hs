sqr x = x ^ 2

funcFactory n = case n of 
  1 -> id
  2 -> sqr
  3 -> (^3)
  4 -> intFunc
  _ -> const n
  where 
    intFunc x = x^5

expApproxUpTo :: Int -> Double -> Double
expApproxUpTo 0 x = 1 
expApproxUpTo n x = ((x ^ n) / fromIntegral(fact n)) + expApproxUpTo (n - 1) x
  where
    fact :: Int -> Int
    fact 0 = 1
    fact n = n * fact (n - 1)

dfr :: (Double -> Double) -> Double -> (Double -> Double)
dfr f h = approx
  where
    approx x = (f (x + h) - f x) / h
