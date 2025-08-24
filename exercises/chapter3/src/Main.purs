module Main
  where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Test.MySolutions ( address', entry', onlyTheSecond, printStuff, showAddress, showEntry)



main :: Effect Unit
main = do

  (log(
    "\nAddress: \t" <> showAddress(address') <> " 🍝" <>
    "\nEntry: \t\t" <> showEntry(entry') <> " 📖" <>
    "\nonlyTheSecond:\t" <> show(onlyTheSecond 214 527) <> " 🧮" <>
    "\nfilterEntry (?)(book): " <> showEntry(entry') 
  ))
  
  printStuff



