module Test.MySolutions
  where

import Prelude

import Data.Foldable (sum)
import Data.List (List, range, filter)
import Data.Number (sqrt)
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
    log("\tMy answer is: " <> show(result(i)))

diagonal ∷ Number → Number → Number
diagonal w h = sqrt(w*w + h*h) 


