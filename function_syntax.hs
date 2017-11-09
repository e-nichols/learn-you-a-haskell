lucky :: (Integral a) => a -> String
lucky 7 = "Lucky number 7"
lucky x = "Not lucky"

-- Recursion, magic!
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Non pattern matching
addVectors a b = (fst a + fst b, snd a + snd b)

-- Pattern matching
addVectorsPattern :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectorsPattern (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- You can pattern match in list comprehensions.
sumTupleList :: (Num a) => [(a,a)] -> [a]
sumTupleList xs = [a+b | (a,b) <- xs]

-- Pattern matching length of function
lengthy :: [a] -> Int
lengthy (x:xs) = 1 + lengthy xs
lengthy [] = 0

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "List has one element: " ++ show x
tell (x:y:[]) = "List has two elements: " ++ show x ++ " " ++ show y
tell (x:y:_) = "List is >2 elems long, first two are: " ++ show x ++ " " ++ show y

-- Binding to names while still keeping a reference to the whole thing
capital :: String -> String
capital "" = "Empty string, woops"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

-- Guards: a way of testing whether some property of a value (or several) are true of false. Note the backticks here, we can use them to define an infix function that way.
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a > b     = GT
  | a == b    = EQ
  | otherwise = LT

-- The last guard is usually otherwise, a catch all when all other guards before evaluate to false.

-- Where keyword, for brevity
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= 18.5 = "Underweight"
    | bmi <= 25.0 = "Normal"
    | bmi <= 30.0 = "Fat"
    | otherwise   = "Whale"
    where bmi = weight / height ^ 2

-- You could further match on a tuple of values for "Underweight, Normal and Fat" but that's overkill.
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname

-- Let it Be!
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r^2
  in sideArea + 2 * topArea

{-
Recap

Where bindings: A syntactic construct that lets you bind to variables at the end of a function and the whole function can see them, including guards.

Let bindings: bind to variables anywhere and are expressions themselves, but are very local -- they don't span across guards.

Let bindings are similar to if/else statements in the sense you can cram them almost anywhere.
-}

aTuple = (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)

-- Revisiting calcBmis -- take a list of tuples and output the bmi as a list
-- The let statement is much like a predicate; instead of filtering, it simply binds to a name.
calcBmis :: (RealFloat a) => [(a,a)] -> [a]
calcBmis xs = [bmi | (w,h) <- xs, let bmi = w / h ^ 2]

-- Get off my Case!
-- Case expressions and pattern matching on function definitions, they are interchangeable.
