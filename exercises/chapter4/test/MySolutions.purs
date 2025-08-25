module Test.MySolutions where

import Prelude

import Effect (Effect)
import Effect.Console (log)

myLog :: Effect Unit
myLog = do
    log("\n\t-> hello this is my solution ! <-\n")
