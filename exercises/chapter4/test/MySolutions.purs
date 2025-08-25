module Test.MySolutions where

import Prelude

import Effect

myLog :: Effect Unit
myLog = do
    log("\n\nhello this is my solution !\n")
