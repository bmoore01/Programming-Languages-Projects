import System.Environment
import System.FilePath.Posix
import System.Exit
import Data.List
import Data.Char
import Data.Int
import Data.Bool
import Data.HashTable

encrypt :: [Char] -> [Char] -> [Char]
encrypt p f = (toString (limitList (cipher (toAscii (createPass p f)) (toAscii f))))

cipher :: [Int] -> [Int] -> [Int]
cipher p f = zipWith (+) p f

decipher :: [Int] -> [Int] -> [Int]
decipher p f = zipWith (-) f p

toAscii :: [Char] -> [Int]
toAscii [] = []
toAscii (x:xs) = [ord x] ++ toAscii xs

createPass :: [Char] -> [Char] -> [Char]
createPass p f = take (length f) (cycle p)  

toString :: [Int] -> [Char]
toString [] = []
toString (x:xs) = [chr x] ++ toString xs

hashToInt :: Int32 -> [Int]
hashToInt x = limitList (hashToDigits x) 

hashToString :: Int32 -> [Char]
hashToString x = toString (limitList (hashToDigits x))

decrypt :: [Char] -> [Char] -> [Char]
decrypt p f = (toString (limitList (decipher (toAscii (createPass p f)) (toAscii f))))

limit :: Int -> Int
limit n = 10 + mod (n-10) (128-10)

limitList :: [Int] -> [Int]
limitList = map limit
--	where limit  x = 10 + mod (x-10) (128-10)

fileOperation :: [Char] -> [Char] -> [Char] -> IO ()
fileOperation pass file name | takeExtension name == ".enc"  && (comparePass pass file) = writeFile (newFileName pass file name) (removePass pass (remExt (decrypt pass file)))
							 | takeExtension name == ".enc" && (comparePass pass file) == False = print "Wrong password" 
							 | otherwise = writeFile (replaceExtension name ".enc") ((hashToString (hashString pass)) ++ (encrypt pass (saveExt name file)))

newFileName :: [Char] -> [Char] -> [Char] -> [Char]
newFileName p f n = replaceExtension n (takeExt (decrypt p f)) 

saveExt :: [Char] ->[Char] -> [Char]
saveExt name file = (takeExtension name) ++ file

takeExt :: [Char] -> [Char]
takeExt s = take 4 s

remExt :: [Char] -> [Char]
remExt s = drop 8 s

comparePass :: [Char] -> [Char] -> Bool
comparePass p f | (hashToString (hashString p)) == (take (length (hashToString (hashString p))) f) = True
				| otherwise = False

removePass :: [Char] -> [Char] -> [Char]
removePass p f = drop (length (hashToString (hashString p))) f

hashToDigits :: Int32 -> [Int]
hashToDigits n = toDigits (fromIntegral n)

toDigits :: Int -> [Int]
toDigits n | n < 10 = [n]
	 	   | otherwise = toDigits (div n 10) ++ [mod n 10]

main = do
	args <- getArgs
	let filename = (head args)
	let password = (last args)
	file <- readFile filename
	let ext = saveExt filename file
	fileOperation password file filename
	let testp = "password"
	print (comparePass testp file)
	print testp
	print (length testp)
	print (hashToString (hashString testp))
	print (length (hashToString (hashString testp)))
