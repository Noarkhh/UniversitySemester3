fib :: (Num a, Eq a) => a -> a
fib n =
 if n == 0 || n == 1 then n
 else fib (n - 2) + fib (n - 1)


fib2 :: (Num a, Eq a) => a -> a
fib2 0 = 0
fib2 n = loop 0 1 1 n where
  loop a b it n | it == n   = b
                | otherwise = loop b (a + b) (it + 1) n


sum' :: Num a => [a] -> a
sum' []   = 0
sum' (x:xs) = x + sum' xs


prod' :: Num a => [a] -> a
prod' [] = 1
prod' (x:xs) = x * prod' xs


length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs


or' :: [Bool] -> Bool
or' [] = False
or' (x:xs) = x || or' xs


and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs


elem' :: Eq a => a -> [a] -> Bool
elem' n [] = False
elem' n (x:xs) = n == x || elem' n xs


doubleAll :: Num t => [t] -> [t]
doubleAll [] = []
doubleAll (x:xs) = [x*2] ++ doubleAll xs


squareAll :: Num t => [t] -> [t]
squareAll [] = []
squareAll (x:xs) = [x^2] ++ squareAll xs


selectEven :: Integral t => [t] -> [t]
selectEven [] = []
selectEven (x:xs) = (if x `mod` 2 == 0 then [x] else []) ++ selectEven xs


arytMean :: (Num a, Fractional b) => [a] -> b
arytMean [] = 0
arytMean x = (sum x) / (length x)
