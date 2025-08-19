module Main where

import Prelude

import Data.Maybe (fromMaybe)
import Data.String.Utils (repeat)
import Effect (Effect)
import Effect.Console (log)
import Euler (answer)
import Test.MySolutions (logging)

main ∷ Effect Unit
main = do
  (log ("\n\nThe answer is " <> show (answer 1000)))
  (logging 1000)
  (log("\n\n" <> fromMaybe "" (repeat (3) "***************")))
  