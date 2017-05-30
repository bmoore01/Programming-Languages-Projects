sorted :: [Int] -> Bool
sorted (x:[]) = True
sorted (x:xs) | (x<(xs) !! 0) = sorted(xs)
			  | otherwise = False


main = do
	print "Should be true"
	print [1,2,3,4,5]
	print (sorted [1,2,3,4,5])
	print "Should be false"
	print [1,2,4,3,5]
	print (sorted [1,2,4,3,5])
