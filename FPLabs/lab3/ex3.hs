sqr x = x ^ 2

funcFactory n = case n of 
  1 -> id
  2 -> sqr
  3 -> (^3)
  4 -> intFunc
  _ -> const n
  where 
    intFunc x = x^5
