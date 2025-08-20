module Main
  where

import Prelude

import Data.AddressBook (Entry, AddressBook, showAddress, showEntry)
import Data.List (List(..))
import Effect (Effect)
import Effect.Console (log)
import Test.Main (book)



firstAddress ∷ { 
  city ∷ String , state ∷ String , street ∷ String }

firstAddress = { city: "Faketown", state: "CA", street: "123 Fake St."}

firstEntry ∷ { 
  address ∷ { city :: String , state :: String , street :: String } , 
  firstName ∷ String , lastName ∷ String }

firstEntry = { firstName: "John", lastName: "Smith", address: firstAddress }

insertEntry ::
  Entry
  -> List{ 
    address   :: { city :: String, state  :: String, street :: String },
    firstName :: String,
    lastName  :: String}
    -> List{ 
      address   :: { city :: String, state  :: String, street :: String },
      firstName :: String,
      lastName  :: String} 
insertEntry (e)(book) = Cons (e)(book)


main :: Effect Unit
main = do
  (log("Address: \t" <> showAddress(firstAddress) <> "🍝"))
  (log("Entry: \t\t" <> showEntry(firstEntry) <> "📖"))

{--! solving according to https://book.purescript.org/chapter3.html and some own stuff to get better understanding :) --}
  
