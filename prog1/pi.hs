step :: Float -> Float
step x = 4/(x*(x+1)*(x+2))

nilaplus :: Float
nilaplus = sum [step x | x <- [2,6..100]]

nilaminus :: Float
nilaminus = sum [step x | x <- [4,8..100]]

pii :: Float
pii = 3 + (nilaplus - nilaminus)

main = do 
	print pii
