module Test.MySolutions where

import Prelude

import Effect               (Effect)
import Effect.Console       (log)
import Data.List            (List(Cons))
import Data.AddressBook     (Address, AddressBook, Entry, emptyBook)

-- Note to reader: Add your solutions to this file


firstAddress ∷ { city ∷ String , state ∷ String , street ∷ String }

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


insertEntry ∷ ∀ (a ∷ Type). a → List a → List a
insertEntry entry book = Cons entry book 





{--! solving according to https://book.purescript.org/chapter3.html and some own stuff to get better understanding :) --}


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
    
    let addX_res = (addX (35)(90))
    let add1_res = add1(addX_res)

    

    log("\n\n\tmy tryout section :)\n\t--------------------\n")
    log(
        "adding 35 + 55 = " <> show(addX_res) <>"\n"   <>
        "adding 1 to the result with add1 = " <> show(add1_res) <> "\n" 
        
    )
      
    log("- end of tryoutSection -\n")

 