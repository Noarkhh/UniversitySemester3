qSort :: Ord a => [a] -> [a]
qSort []     = []
qSort (x:xs) = qSort (leftPart xs) ++ [x] ++ qSort(rightPart xs)
  where 
     leftPart xs = filter (<= x) xs
     rightPart xs = filter (> x) xs


mergeSort :: Ord a => [a] -> [a]
mergeSort [x] = [x] 
mergeSort xs  = merge' (mergeSort (take h1 xs)) (mergeSort (drop h2 xs))
  where
    h1 = (length xs) `div` 2
    h2 = (length xs) - h1


merge' :: Ord a => [a] -> [a] -> [a]
merge' [] b          = b
merge' a []          = a
merge' (a:as) (b:bs) = if a < b
                       then [a] ++ merge' as (b:bs)
                       else [b] ++ merge' (a:as) bs


concat' :: [[a]] -> [a]
concat' []     = []
concat' (x:xs) = x ++ concat' xs


concat'' :: [[a]] -> [a]
concat'' xs = [x | xss <- xs, x <- xss]


concat''' :: [[a]] -> [a]
concat''' = loop []
  where 
    loop acc []     = acc
    loop acc (x:xs) = loop (acc ++ x) xs


isSorted :: Ord a => [a] -> Bool
isSorted []       = True
isSorted [x]      = True
isSorted (x:y:xs) = x <= y && isSorted (y:xs)


reverse' :: [a] -> [a]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]


reverse'' :: [a] -> [a]
reverse'' = loop []
  where 
    loop acc [] = acc
    loop acc (x:xs) = loop ([x] ++ acc) xs


zip' :: [a] -> [b] -> [(a, b)]
zip' = loop []
  where 
    loop acc xs []         = acc
    loop acc [] ys         = acc
    loop acc (x:xs) (y:ys) = loop (acc ++ [(x, y)]) xs ys


unzip' :: [(a, b)] -> ([a], [b])
unzip' = loop ([], [])
  where 
    loop acc []     = acc
    loop acc (x:xs) = loop ((fst acc ++ [fst x]), (snd acc ++ [snd x])) xs


zip3' :: [a] -> [b] -> [c] -> [(a, b, c)]
zip3' x y z = loop [] x y z
  where 
    loop acc xs ys zs | null xs || null ys || null zs  = acc
                      | otherwise                      = loop (acc ++ [(head xs, head ys, head zs)]) (tail xs) (tail ys) (tail zs)


subList :: Eq a => [a] -> [a] -> Bool
subList main sub | (length sub) > (length main)  = False
                 | otherwise                     = sub == take (length sub) main || subList (tail main) sub


subList' :: Eq a => [a] -> [a] -> Bool
subList' = loop False
  where
    loop acc main sub | acc                           = acc
                      | (length sub) > (length main)  = acc
                      | otherwise                     = loop (sub == take (length sub) main) (tail main) sub


                
