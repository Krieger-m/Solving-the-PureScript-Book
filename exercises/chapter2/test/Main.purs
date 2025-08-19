module Test.Main

  where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Euler (answer)
import Test.MySolutions (circleArea, diagonal, result, leftoverCents)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = do
  log "\n\n"
  runTest do
    suite "\n\tEuler - Sum of Multiples" do
      test "below 10" do
        Assert.equal (23) (answer 10)
      test "below 1000" do
        Assert.equal (233168) (answer 1000)
          
    suite "\n\tMy solution for Euler - Sum of Multiples" do
      test "below 10 = 23"do
        Assert.equal (23) (result 10)
      test "below 1000 = 233168" do
        Assert.equal (233168) (result 1000)
      
    suite "\n\tMy solution for diagonal" do
      test "w:3 h:4 = 5" do
        Assert.equal (5.0) (diagonal 3.0 4.0)
      test "w:5 h:12 = 13" do
        Assert.equal (13.0) (diagonal 5.0 12.0)

    suite "\n\tMy solution for circleArea" do
      test "radius 1 = 3.14" do
        Assert.equal(3.141592653589793) (circleArea(1.0))
      test "radius 3 = 28.27" do
        Assert.equal(28.274333882308138) (circleArea(3.0))

    suite "\n\tleftoverCents" do
      test "23 = 23" do
        Assert.equal 23 (leftoverCents 23)
      test "456 = 56" do
        Assert.equal 56 (leftoverCents 456)
      test "-789 = -89" do
        Assert.equal (-89) (leftoverCents (-789))

{-  Move this block comment starting point to enable more tests

-}
