module Test.MySolutions
  where

import Prelude

import Data.Foldable (sum)
import Data.Int (rem, toNumber)
import Data.List (List, range, filter)
import Data.Number (pi, pow, sqrt)
import Effect (Effect)
import Effect.Console (log)

ns ∷ Int → List Int
ns(n) = range (0) (n - 1)

multiples ∷ Int → List Int
multiples(n) = filter(\x -> (mod x 3 == 0 || mod x 5 == 0)) (ns(n))

result ∷ Int → Int
result(n) = sum(multiples(n))

logging :: Int -> Effect Unit 
logging(i) = do
    log(
      "\nMy answers:"<> 
      "\n\tEuler: \t\t" <> show(result(i)) <> 
      "\n\tcircleArea: \t"<> show (circleArea (toNumber(12))) <>
      "\n\tdiagonal: \t" <> show(diagonal(4.0)(2.0)) <>
      "\n\tleftoverCents: \t" <> show(leftoverCents(16))
    )

diagonal ∷ Number → Number → Number
diagonal w h = sqrt(w*w + h*h) 

circleArea :: Number -> Number
circleArea(r) = (pow (r) (2.0))*pi

leftoverCents :: Int -> Int
leftoverCents(i) = rem i 100 
