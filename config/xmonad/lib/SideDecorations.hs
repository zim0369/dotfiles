{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances #-}

import XMonad.Layout.Decoration
import XMonad.Util.Types
 
-- decoration
--  :: (DecorationStyle ds a, Shrinker s)
--  => s -> Theme -> ds a -> l a -> ModifiedLayout (Decoration ds s) l a 

data SideDecoration a = SideDecoration Direction2D
  deriving (Show, Read)

instance Eq a => DecorationStyle SideDecoration a where

  shrink b (Rectangle _ _ dw dh) (Rectangle x y w h)
    | SideDecoration U <- b = Rectangle x (y + fi dh) w (h - dh)
    | SideDecoration R <- b = Rectangle x y (w - dw) h
    | SideDecoration D <- b = Rectangle x y w (h - dh)
    | SideDecoration L <- b = Rectangle (x + fi dw) y (w - dw) h

  pureDecoration b dw dh _ st _ (win, Rectangle x y w h)
    | win `elem` W.integrate st && dw < w && dh < h = Just $ case b of
      SideDecoration U -> Rectangle x y w dh
      SideDecoration R -> Rectangle (x + fi (w - dw)) y dw h
      SideDecoration D -> Rectangle x (y + fi (h - dh)) w dh
      SideDecoration L -> Rectangle x y dw h
    | otherwise = Nothing
    
myTheme :: Theme
myTheme = defaultTheme
  { activeColour = "#ffffff"
  , inactiveColor = "#000000"
  , decoWidth = 20
  } 
   
myDecorate :: Eq a => l a -> ModifiedLayout (Decoration SideDecoration DefaultShrinker) l a 
myDecorate = decoration shrinkText myTheme (SideDecoration L) 
