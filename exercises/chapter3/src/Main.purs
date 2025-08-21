module Main
  where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.MySolutions (firstAddress, firstEntry, onlyTheSecond, prt, showAddress, showEntry)



main :: Effect Unit
main = do
  (log("Address: \t" <> showAddress(firstAddress) <> "🍝"))
  (log("Entry: \t\t" <> showEntry(firstEntry) <> "📖"))
  (log("onlyTheSecond:\t" <> show(onlyTheSecond 214 527)))
  prt




