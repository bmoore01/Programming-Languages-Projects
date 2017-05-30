dot :: [Float] -> [Float] -> Float
dot xs ys = (sum (zipWith (*) xs ys))


main = do
	(print (dot [1,2,3,4,5] [1,2,3,4,5]))
