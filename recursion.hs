-- Recursion: a way of defining functions in which the function is applied inside its own condition.

-- TODO: define the Fib sequence

-- Defining a recursive maximum function

{-
Now the third pattern is where the action happens. We use pattern matching to split a list into a head and a tail. This is a very common idiom when doing recursion with lists, so get used to it. We use a where binding to define maxTail as the maximum of the rest of the list. Then we check if the head is greater than the maximum of the rest of the list. If it is, we return the head. Otherwise, we return the maximum of the rest of the list.
-}

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
      | x > maxTail = x
      | otherwise = maxTail
      where maxTail = maximum' xs

-- The maximum of a list is the max of the first element and the maximum of the tail.

-- A replicate function. Think in edge cases. can you replicate an element zero times? Yeah, it's just an empty list.
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
          | n <= 0    = []
          | otherwise = x:replicate' (n-1) x

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0    = []
take' _ []      = []
take' n (x:xs)  = x : take' (n-1) xs
