module Main(main) where 

import Graphics.Gloss

width, height, offset :: Int 
width = 300
height = 300
offset = 100

window :: Display
window = InWindow "Pong" (width, height) (offset, offset)

background :: Color
background = black

main :: IO ()
main = display window background drawing
