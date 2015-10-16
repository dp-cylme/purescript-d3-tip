
module Graphics.D3.Tip
       (Tip()
       , Direction()
       , show
       , hide
       , style
       , direction
       , offset
       , html
       , destroy
       ) where

import Data.Foreign.EasyFFI
import Graphics.D3.Base
import Prelude (Show)

data Direction = N | S | E | W | NW | SW | NE | SE

ffi = unsafeForeignFunction

foreign import data Tip :: *

foreign import tip :: D3Eff Tip

show :: D3Eff Tip
show = ffi [] "tip.show()"

hide :: D3Eff Tip
hide = ffi [] "tip.hide()"

attr :: String -> String -> D3Eff Tip
attr = ffi ["n", "v"] "tip.attr(n, v)"

style :: String -> String -> D3Eff Tip
style = ffi ["n", "v"] "tip.style(n,v)"

tipDirection :: String -> D3Eff Tip
tipDirection = ffi ["v"] "tip.direction(v)"

direction :: Direction -> D3Eff Tip
direction N = tipDirection "n"
direction S = tipDirection "s"
direction E = tipDirection "e"
direction W = tipDirection "w"
direction NW = tipDirection "nw"
direction SW = tipDirection "sw"
direction NE = tipDirection "ne"
direction SE = tipDirection "se"


tipOffset :: Array Number -> D3Eff Tip
tipOffset = ffi ["v"] "tip.offset(v)"

offset :: Number -> Number -> D3Eff Tip
offset x y = tipOffset ([x, y])

html :: (forall a. a -> String) -> D3Eff Tip
html = ffi ["fn"] "tip.html(fn)"

destroy :: D3Eff Tip
destroy = ffi [] "tip.destroy()"



