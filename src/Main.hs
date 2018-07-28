module Main where

import Reflex.Dom
import Data.Text as T
import Data.Map.Strict as M
import Control.Monad (void)

problemTestNest :: MonadWidget t m => Int -> Int -> m ()
problemTestNest 0 x = do
  clk <- button $ T.pack $ show x
  counter <- foldDyn (+) (1 :: Int) (const 1 <$> clk)
  dynText $ T.pack <$> show <$> counter
problemTestNest n x = do
  let mp = constDyn (M.fromList [(0 :: Int, 1 :: Int), (1, 2)])
  void $ listWithKey mp $ \k _ -> do
    problemTestNest (n - 1) (x*2 + k)

main :: IO ()
main = mainWidget $
  problemTestNest
    3 -- adjust this number to see the issue - on my machine 3 is enough
    0
