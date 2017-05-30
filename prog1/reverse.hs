digit :: Int -> [Int]
digit 0 = []
digit x = digit (x `div` 10) ++ [x `mod` 10]

rev :: Int -> [Int]
rev  x =  (reverse (digit x))

rebuild :: [Int] -> String
rebuild = map((['0'..'9'] ++ ['a'..'z']) !!)

toNum :: String -> Int
toNum n = read n :: Int

revers :: Int -> Int
revers n =(toNum (rebuild (rev n)))


main = do
	--print "Whate number would you like to reverse?"
	--num <- getLine
	--print (revers (toNum (num)))
	print "The reverse of 5967 is as follows"
	print (revers 5967)
