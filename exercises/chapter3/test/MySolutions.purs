module Test.MySolutions where

import Prelude

import Effect               (Effect)
import Effect.Console       (log)
import Data.Maybe           (Maybe)
import Data.List            (List(Cons), head, filter)
import Data.AddressBook     (Address, AddressBook, Entry, emptyBook)

-- Note to reader: Add your solutions to this file


address1 ∷ { city ∷ String , state ∷ String , street ∷ String }
address1 = { city: "Faketown", state: "CA", street: "123 Fake St."}


entry1 ∷ { 
  address ∷ { city :: String , state :: String , street :: String } , 
  firstName ∷ String , lastName ∷ String }
entry1 = { firstName: "John", lastName: "Smith", address: address }


bookWithInsertedEntry :: AddressBook
bookWithInsertedEntry = insertEntry entry emptyBook


--?  my own addressbook functions

showAddress :: Address -> String
showAddress addr =  addr.street <> ", " <>
                    addr.city   <> ", " <>
                    addr.state


showEntry :: Entry -> String
showEntry entry =   entry.lastName  <> ", " <>
                    entry.firstName <> ": " <>
                    showAddress entry.address


insertEntry ∷ ∀ (a ∷ Type). a → List a → List a
insertEntry ent book = Cons ent book 


findEntry :: String -> String -> AddressBook -> Maybe Entry 
findEntry firstName lastName book = head (filter filterEntry book)
  where 
    filterEntry :: Entry -> Boolean
    filterEntry e = e.firstName == firstName && e.lastName == lastName


{--! solving according to https://book.purescript.org/chapter3.html and some own stuff to get better understanding :) --}
-- Querying the Address Book
--!-------------------------
-- -------------------------


--------x trying stuff below x--------

addX :: Int -> Int -> Int
addX a b = a+b

add1 :: Int -> Int
add1 a = addX a 1

onlyTheSecond :: forall  x y. x->y->y
onlyTheSecond = \a b -> b

address = { street: "123 Fake St.", city: "Faketown", state: "CA" }
entry = { firstName: "John", lastName: "Smith", address: address }


printStuff :: Effect Unit
printStuff = do
    
    let addX_res = (addX (35)(55))
    let add1_res = add1(addX_res)

    

    log("\n\n\tmy tryout section :)\n\t--------------------\n")
    log(
        "adding 35 + 55 = " <> show(addX_res) <>"\n"   <>
        "adding 1 to the result with add1 = " <> show(add1_res) <> "\n" 
        
    )
      
    log("- end of tryoutSection -\n")

 