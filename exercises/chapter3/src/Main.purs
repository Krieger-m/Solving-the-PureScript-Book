module Main
  where

import Prelude

import Data.AddressBook (showAddress, showEntry)
import Effect (Effect)
import Effect.Console (log)

firstAddress ∷ { 
  city ∷ String , state ∷ String , street ∷ String }
firstAddress = { city: "Faketown", state: "CA", street: "123 Fake St."}

firstEntry ∷ { 
  address ∷ { city :: String , state :: String , street :: String } , 
  firstName ∷ String , lastName ∷ String }
firstEntry = { firstName: "John", lastName: "Smith", address: firstAddress }



main :: Effect Unit
main = do
  (log("Address: \t" <> showAddress firstAddress <> "🍝"))
  (log("Entry: \t\t" <> showEntry firstEntry <> "📖"))
  
--!x continue here