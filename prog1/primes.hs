prime :: Int -> Int
prime n = [x | x <- [1..], isPrime x] !! (n-1)

isComposite :: Int -> Int -> Bool
isComposite n 1 = False
isComposite n m = if ((mod n m) == 0) then True
				  else (isComposite n (m-1))

isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime n = not(isComposite n (n-1))

toNum :: String -> Int
toNum n = read n :: Int

main = do
	--print "Which number prime would you like?"
	--num <- getLine
	--print (prime (toNum(num)))
	print "The 100th prime is"
	print (prime 100)
