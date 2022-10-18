myFun x = 2 * x

add2T :: Num a => (a, a) -> a
add2T (x,y) = x + y

add2C :: Num a => (a -> (a -> a))
(add2C x) y = x + 2 * y

add3C :: Num a => a -> (a -> (a -> a))
((add3C x) y) z = x + y + z

_ToPower5 :: Num a => a -> a
_ToPower5 x = x ^ 5

