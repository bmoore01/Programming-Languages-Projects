import System.Console.ANSI
import System.IO
import Control.Concurrent

row :: Int -> [Char]
row n = replicate n '#'

grid :: Int -> [Char]
grid 0 = "\n"
grid n = (row 16) ++ "\n" ++ grid(n-1)

printGrid :: IO ()
printGrid = do
	putStrLn (grid 8)

pause :: IO ()
pause = do
	hFlush stdout
	threadDelay 1000000

clear :: IO ()
clear = clearScreen >> setSGR [Reset] >> setCursorPosition 0 0

animate :: IO ()
animate = do
	clear
	setSGR [SetColor Foreground Vivid Red]
	printGrid
	pause
	clear
	setSGR [SetColor Foreground Vivid Blue]
	printGrid
	pause
	animate

main = do
	animate
