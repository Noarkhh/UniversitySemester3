data BinTree a = EmptyBT |
                 NodeBT a (BinTree a) (BinTree a)
                 deriving Show

sumBinTree :: (Num a) => BinTree a -> a
sumBinTree EmptyBT = 0
sumBinTree (NodeBT n lt rt) = n + sumBinTree lt + sumBinTree rt

depthOfBT :: BinTree a -> Int
depthOfBT EmptyBT = 0
depthOfBT (NodeBT a lt rt) = 1 + max (depthOfBT lt) (depthOfBT rt)

flattenBT :: BinTree a -> [a]
flattenBT EmptyBT = []
flattenBT (NodeBT a lt rt) = a : (flattenBT lt) ++ (flattenBT rt)

flattenBST :: (Ord a) => BinTree a -> [a]
flattenBST EmptyBT = []
flattenBST (NodeBT a lt rt) = (flattenBST lt) ++ [a] ++ (flattenBST rt)

insert :: Ord a => a -> BinTree a -> BinTree a
insert x (NodeBT y lt rt) = if x >= y
                            then NodeBT y lt (insert x rt)
                            else NodeBT y (insert x lt) rt
insert x EmptyBT = NodeBT x EmptyBT EmptyBT

listToBST :: Ord a => [a] -> BinTree a
listToBST = loop EmptyBT
  where
    loop tree [] = tree
    loop tree (x:xs) = loop (insert x tree) xs
