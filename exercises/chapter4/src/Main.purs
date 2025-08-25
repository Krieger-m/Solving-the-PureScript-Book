module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.MySolutions (myLog)

main :: Effect Unit
main = do
  log "🍝"
  myLog
