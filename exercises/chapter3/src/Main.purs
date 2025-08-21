module Main
  where

import Prelude

import Effect             (Effect)
import Effect.Console     (log)
import Test.MySolutions   (firstEntry, firstAddress,
                           prt, showAddress, showEntry)



main :: Effect Unit
main = do
  (log("Address: \t" <> showAddress(firstAddress) <> "🍝"))
  (log("Entry: \t\t" <> showEntry(firstEntry) <> "📖"))

  prt




