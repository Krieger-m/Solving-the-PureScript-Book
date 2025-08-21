module Test.MySolutions where

import Prelude

import Effect               (Effect)
import Effect.Console       (log)
import Data.AddressBook     (Address, AddressBook, Entry, emptyBook, insertEntry)

-- Note to reader: Add your solutions to this file


firstAddress ∷ { 
  city ∷ String , state ∷ String , street ∷ String }

firstAddress = { city: "Faketown", state: "CA", street: "123 Fake St."}


firstEntry ∷ { 
  address ∷ { city :: String , state :: String , street :: String } , 
  firstName ∷ String , lastName ∷ String }

firstEntry = { firstName: "John", lastName: "Smith", address: firstAddress }


bookWithInsertedEntry :: AddressBook
bookWithInsertedEntry = insertEntry firstEntry emptyBook


--?  my own addressbook functions

showAddress :: Address -> String
showAddress addr =  addr.street <> ", " <>
                    addr.city   <> ", " <>
                    addr.state


showEntry :: Entry -> String
showEntry entry =   entry.lastName  <> ", " <>
                    entry.firstName <> ": " <>
                    showAddress entry.address



{--! solving according to https://book.purescript.org/chapter3.html and some own stuff to get better understanding :) --}


--------x trying stuff below x--------


onlyTheSecond :: forall  x y. x->y->y
onlyTheSecond = \a b -> b
  
prt :: Effect Unit
prt = do
  log("\n\treturning only the second of values: " <> onlyTheSecond 2 "test\n")

