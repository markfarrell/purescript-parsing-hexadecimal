module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)

import Test.Text.Parsing.String.Hexadecimal as A

main :: Effect Unit
main = A.main
