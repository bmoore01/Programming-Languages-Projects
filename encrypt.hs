import System.Environment
import Data.List

encrypt :: [Char] -> [Char] -> [Char]
encrypt pass file = 

main = do
	args <- getArgs
	filename <- readFile (head args)
	putStrLn filename
	putStrLn "Enter your password:"
	password <- getLine
