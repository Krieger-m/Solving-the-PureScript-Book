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
  prt



{--! solving according to https://book.purescript.org/chapter3.html and some own stuff to get better understanding :) --}


--------x trying stuff below x--------

onlyTheSecond :: forall  x y. x->y->y
onlyTheSecond = \a b -> b
  
prt :: Effect Unit
prt =do
  log("\n\treturning only the second of values: " <> onlyTheSecond 2 "test\n")

