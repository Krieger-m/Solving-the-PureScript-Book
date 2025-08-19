module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Euler (answer)
import Test.MySolutions (diagonal, logging)

main ∷ Effect Unit
main = do
  (log ("\n\nThe answer is " <> show (answer 1000)))
  (logging 1000)
  (log ("diagonal: " <> show(diagonal 3.0 4.0)))
  