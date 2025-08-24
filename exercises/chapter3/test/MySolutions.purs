module Test.MySolutions where

import Prelude

import Data.AddressBook (Address, Entry, AddressBook, emptyBook)
import Data.List (List(Cons), head, filter)
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Console (log)


-- Note to reader: Add your solutions to this file


address ∷ { city ∷ String , state ∷ String , street ∷ String }
address = { city: "Faketown", state: "CA", street: "123 Fake St."}


entry ∷ { 
  address ∷ { city :: String , state :: String , street :: String } , 
  firstName ∷ String , lastName ∷ String }
entry = { firstName: "John", lastName: "Smith", address: address' }


bookWithInsertedEntry :: AddressBook
bookWithInsertedEntry = insertEntry entry' emptyBook


john :: Entry
john =
  { firstName: "John"
  , lastName: "Smith"
  , address:
      { street: "123 Fake St.", city: "Faketown", state: "CA" }
  }


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
findEntry firstName lastName = (head <<< (filter filterEntry))
  where 
    filterEntry :: Entry -> Boolean
    filterEntry e = e.firstName == firstName && e.lastName == lastName

-- Exercise 2 & 3
findEntryByStreet :: String -> AddressBook -> Maybe Entry
-- findEntryByStreet s b = head (filter filterEntry) bsp
findEntryByStreet s = ((filter filterEntry) >>> head)
  where 
    filterEntry :: Entry -> Boolean
    filterEntry e = e.address.street == s


-- Exercise 4
-- isInBook :: String -> AddressBook -> Boolean
-- isInBook = --//!/

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

address' = { street: "123 Fake St.", city: "Faketown", state: "CA" }
entry' = { firstName: "John", lastName: "Smith", address: address' }

infix 5 insertEntry as ++

printStuff :: Effect Unit
printStuff = do
    
    let addX_res = (addX (35)(55))
    let add1_res = add1(addX_res)

    let book1 = insertEntry john emptyBook
    let book2 = john `insertEntry` emptyBook

    let book3 = john `insertEntry` (john `insertEntry` (john `insertEntry` emptyBook))

    let book4 = john ++ (john ++ (john ++emptyBook)) -- infix also possible without parentheses
    

    log("\n\n\tmy tryout section :)\n\t--------------------\n")
    log(
        "adding 35 + 55 = " <> show(addX_res) <>"\n"   <>
        "adding 1 to the result with add1 = " <> show(add1_res) <> "\n-" <>
        "\n\nbook1: " <> show(book1) <> "\n\n- " <>
        "\n\nbook2: " <> show(book2) <> "\n\n- " <>
        "\n\nbook3: " <> show(book3) <> "\n\n- " <>
        "\n\nbook4: " <> show(book4) <> "\n\n- "
        
        
    )
      
    log("- end of tryoutSection -\n")

 