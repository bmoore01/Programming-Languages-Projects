fac :: Double -> Double 
fac n = if (n == 1) then 1 else n * fac (n-1)

euler :: Double
euler = 1 + sum [ (1/fac(x)) | x <- [1..100]]

main = do 
	print euler 
