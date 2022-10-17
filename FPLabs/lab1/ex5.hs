sgn :: Int -> Int
sgn n = if n < 0
       then -1
       else if n == 0
            then 0
            else 1

absInt :: Int -> Int
absInt x = if x < 0
           then -x
           else x

min2Int :: (Int, Int) -> Int
min2Int (x, y) = if x < y
                 then x
                 else y

min3Int :: (Int, Int, Int) -> Int
min3Int (x, y, z) = min2Int (min2Int (x, y), min2Int (y, z))


toLower :: Char -> Char
toLower x = if fromEnum 'A' <= fromEnum x && fromEnum x <= fromEnum 'Z'
            then toEnum (fromEnum x + 32) 
            else x

romanDigit :: Char -> String
romanDigit x = if fromEnum '1' <= fromEnum x && fromEnum x <= fromEnum '9'
               then romans!!(fromEnum x - fromEnum '1')
               else [x]
    where romans = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

