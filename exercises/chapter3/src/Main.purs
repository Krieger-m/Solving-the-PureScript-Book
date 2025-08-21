module Main
  where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.MySolutions (firstAddress, firstEntry, onlyTheSecond, printStuff, showAddress, showEntry)



main :: Effect Unit
main = do
  (log(
    "\nAddress: \t" <> showAddress(firstAddress) <> " 🍝" <>
    "\nEntry: \t\t" <> showEntry(firstEntry) <> " 📖" <>
    "\nonlyTheSecond:\t" <> show(onlyTheSecond 214 527) <> " 🧮"
  ))
  
  printStuff



