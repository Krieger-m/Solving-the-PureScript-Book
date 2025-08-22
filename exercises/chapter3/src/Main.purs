module Main
  where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.MySolutions ( address1, entry1, onlyTheSecond, printStuff, showAddress, showEntry)



main :: Effect Unit
main = do

  (log(
    "\nAddress: \t" <> showAddress(address1) <> " 🍝" <>
    "\nEntry: \t\t" <> showEntry(entry1) <> " 📖" <>
    "\nonlyTheSecond:\t" <> show(onlyTheSecond 214 527) <> " 🧮" <>
    "\nfilterEntry (?)(book): " <> showEntry(entry1) 
  ))
  
  printStuff



