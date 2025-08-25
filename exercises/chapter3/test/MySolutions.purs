module Test.MySolutions where

import Prelude

import Control.Plus (empty)
import Data.AddressBook (Address, AddressBook, Entry)
import Data.List (List(Cons), head, filter, null)
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


ned :: Entry
ned =
  { firstName: "Ned"
  , lastName: "Flanders"
  , address:
      { street: "740 Evergreen Terrace", city: "Springfield", state: "USA" }
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


-- Querying the Address Book
--!-------------------------
-- -------------------------


findEntry :: String -> String -> AddressBook -> Maybe Entry 
findEntry firstName lastName = (head <<< (filter filterEntry))
  where 
    filterEntry :: Entry -> Boolean
    filterEntry e = e.firstName == firstName && e.lastName == lastName


findEntryFirstName :: String -> AddressBook -> Maybe Entry 
findEntryFirstName firstName = (head <<< (filter filterEntry))
  where 
    filterEntry :: Entry -> Boolean
    filterEntry e = e.firstName == firstName


emptyBook :: AddressBook
emptyBook = empty


book1 :: AddressBook
book1 = insertEntry john emptyBook


-- Exercise 2 & 3
findEntryByStreet :: String -> AddressBook -> Maybe Entry
findEntryByStreet s b = head (filter filterEntry b)
-- findEntryByStreet s = ((filter filterEntry) >>> head)
  where 
    filterEntry :: Entry -> Boolean
    filterEntry e = e.address.street == s


-- Exercise 4
isInBook :: String -> String -> AddressBook -> Boolean
isInBook fName lName = not null <<< filter filterEntry
  where 
    filterEntry :: Entry -> Boolean 
    filterEntry e' = e'.firstName == fName && e'.lastName == lName



{--! solving according to https://book.purescript.org/chapter3.html and some own stuff to get better understanding :) --}


--------x trying stuff below x--------

addX :: Int -> Int -> Int
addX a b = a+b

add1 :: Int -> Int
add1 a = addX a 1

onlyTheSecond :: forall  x y. x->y->y
onlyTheSecond = \a b -> b

address' :: Address 
address' = { street: "123 Fake St.", city: "Faketown", state: "CA" }

entry':: Entry
entry' = { firstName: "John", lastName: "Smith", address: address' }


infix 5 insertEntry as ++

printStuff :: Effect Unit
printStuff = do
    
    let addX_res = (addX (35)(55))
    let add1_res = add1(addX_res)

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

 