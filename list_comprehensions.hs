-- List Comprehension
{-
List Comprehension:

Output =    generator function      Input Set      Predicate(s)
S      = {      2 * x            | x <- [1..10],    even x         }

==> [4, 8, 12, 16, 20]

-}

boomBang xs = [if x < 10 then "BOOM" else "BANG" | x <- xs, odd x]

-- All nums 10-20 that are not 17
y = [x | x <- [10..20], x /= 17]

-- Multiple inputs
x = [x*y | x <- [12,23,55], y <- [1,3,5], x > 30]

-- Another version of length
length' xs = sum [1 | _ <- xs]

-- Strings are list of characters! So we can do list comprehensions on them, too.
removeUppercase str = [c | c <- str, c `elem` ['a'..'z']]

-- Nested list comprehensions
-- let xxs = [[1,2,3],[4,5,6],[7,8,9]]
squareListOfLists xxs = [ [ x*x | x <- xs] | xs <- xxs]

-- Tuples go in parentheses. You can have homogeneous lists of tuples
createTuple x y = (x,y)

-- fst and snd to access the first and second components of a tuple

-- zip, take two lists and zips them together into one list by joining
-- the matching elements into pairs. Traverse a list simultaneously.

-- https://stackoverflow.com/questions/2468226/how-to-zip-multiple-lists-in-haskell

{-
  "This is a common pattern in functional programming. You take a starting set of solutions and you apply transformation to those solutions and filter them until you get the right ones.
-}
