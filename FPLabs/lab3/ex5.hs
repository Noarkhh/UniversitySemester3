import Data.List

sortDesc :: Ord a => [a] -> [a]
sortDesc = reverse . sort
