{-
  A type is a kind of label that every expression has.
-}

-- Type declaration example
removeUppercase :: [Char] -> [Char]
removeUppercase xs = [x | x <- xs, x `elem` ['a'..'z']]

{-
Common Types

Int - bounded Int
Integer - unbounded Int
Float - single precision
Double - double precision
Bool - True | False
Char
[Char] - Strings

-}

-- Function that have type variables are polymorphic.

-- Typeclass : a sort of interface that defines some behavior.

{-
  :t (==)

The type of == is      Class Constraint             Type
      (==)          ::      (Eq a)        =>    a -> a -> Bool

What's that class constraint mean? "The type of those two values must be a member of the Eq class."

The Eq typeclass provides an interface for testing for equality.

Ord Typeclass :: a type that can greater than, less than, or equal to one another.

Show typeclass :: can be presented as strings

Read :: Interesting class. Takes in a string and parses it to produce a type that is in class Read.

Read "3" + 4 ==> 7
Read "[1,2,3]" ++ [4] ==> [1,2,3,4]

But in all the cases above the Compiler is above to infer how we wanted to use the output of the read function, by reasoning about the second argument passed.

So if we wanted to do something like
Read "4"

The compiler will yell at us. In that case, we would need to use a specific type annotation, explicitly saying what a type should be.

read "5" :: Int

Enum Typeclass, sequentially ordered types, they have define predecesors and successors.

Whole numbers :: polymorphic constants

Num is a numeric typeclass, all types of numbers in it

Integral a numeric typeclass, only containing integral (whole) numbers.

fromIntegral :: a useful function that takes an integral number and turns it into a more general number.

fromIntegral :: (Num b Integral a) => a -> b
-}

-- Print out all ascii symbols 1...256
map chr [1..256]
