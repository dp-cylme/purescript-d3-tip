
module Graphics.D3.Tip
       (Tip()
       , Direction()
       , attr
       , tip
       , show
       , hide
       , style
       , direction
       , offset
       , html
       , destroy
       , call
       ) where

import Data.Foreign.EasyFFI
import Graphics.D3.Base
import Graphics.D3.Selection (Selection(), Existing)
import Prelude (Show)

data Direction = N | S | E | W | NW | SW | NE | SE

ffi = unsafeForeignFunction

foreign import data Tip :: *

foreign import tip :: D3Eff Tip

show :: Tip -> D3Eff Tip
show = ffi ["tip", ""] "tip.show()"

hide :: Tip -> D3Eff Tip
hide = ffi ["tip", ""] "tip.hide()"

attr :: String -> String -> Tip -> D3Eff Tip
attr = ffi ["n", "v", "tip", ""] "tip.attr(n, v)"

style :: String -> String -> Tip -> D3Eff Tip
style = ffi ["n", "v", "tip", ""] "tip.style(n,v)"

tipDirection :: String -> Tip -> D3Eff Tip
tipDirection = ffi ["v", "tip", ""] "tip.direction(v)"

direction :: Direction -> Tip -> D3Eff Tip
direction N = tipDirection "n"
direction S = tipDirection "s"
direction E = tipDirection "e"
direction W = tipDirection "w"
direction NW = tipDirection "nw"
direction SW = tipDirection "sw"
direction NE = tipDirection "ne"
direction SE = tipDirection "se"


tipOffset :: Array Number -> Tip -> D3Eff Tip
tipOffset = ffi ["v", "tip", ""] "tip.offset(v)"

offset :: Number -> Number -> Tip -> D3Eff Tip
offset x y = tipOffset ([x, y])

html :: (forall a. a -> String) -> Tip -> D3Eff Tip
html = ffi ["fn", "tip", ""] "tip.html(fn)"

destroy :: Tip -> D3Eff Tip
destroy = ffi ["tip", ""] "tip.destroy()"

call :: forall s d. (Existing s) => Tip -> s d -> D3Eff (Selection d)
call = ffi ["tip", "selection", ""] "selection.call(tip)"

