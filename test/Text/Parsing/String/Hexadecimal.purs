module Test.Text.Parsing.String.Hexadecimal
  ( main
  ) where

import Prelude

import Effect (Effect)

import Text.Parsing.String.Hexadecimal as A

import Text.Parsing.Expect as E

decimals :: String
decimals = "0123456789"

lowercases :: String
lowercases = "abcdef"

uppercases :: String
uppercases = "ABCDEF"

decimal :: Effect Unit
decimal = do
  _ <- failure ""
  _ <- failure "$"
  _ <- failure "$$"
  _ <- failure "a"
  _ <- failure "A"
  _ <- success "0"
  _ <- success decimals
  _ <- failure lowercases
  _ <- failure uppercases
  _ <- output "0" "0"
  _ <- output "1" "1"
  _ <- output "2" "2"
  _ <- output "3" "3"
  _ <- output "4" "4"
  _ <- output "5" "5"
  _ <- output "6" "6"
  _ <- output "7" "7"
  _ <- output "8" "8"
  _ <- output "9" "9"
  _ <- output decimals decimals
  pure unit
  where
    success = \check -> E.success check (A.decimal)
    failure = \check -> E.failure check (A.decimal)
    output  = \check expect -> E.output check expect (A.decimal)

lowercase :: Effect Unit
lowercase = do
  _ <- failure ""
  _ <- failure "$"
  _ <- failure "$$"
  _ <- success "a"
  _ <- failure "A"
  _ <- success "0"
  _ <- success decimals
  _ <- success lowercases
  _ <- failure uppercases
  _ <- output decimals decimals
  _ <- output lowercases lowercases
  _ <- output (lowercases <> decimals) (lowercases <> decimals)
  pure unit
  where
    success = \check -> E.success check (A.lowercase)
    failure = \check -> E.failure check (A.lowercase)
    output  = \check expect -> E.output check expect (A.lowercase)

uppercase :: Effect Unit
uppercase = do
  _ <- failure ""
  _ <- failure "$"
  _ <- failure "$$"
  _ <- failure "a"
  _ <- success "A"
  _ <- success "0"
  _ <- success decimals
  _ <- success uppercases
  _ <- failure lowercases
  _ <- output uppercases uppercases
  _ <- output (decimals <> uppercases) (decimals <> uppercases)
  pure unit
  where
    success = \check -> E.success check (A.uppercase)
    failure = \check -> E.failure check (A.uppercase)
    output  = \check expect -> E.output check expect (A.uppercase)

any :: Effect Unit
any = do
  _ <- failure ""
  _ <- failure "$"
  _ <- failure "$$"
  _ <- success "a"
  _ <- success "A"
  _ <- success "0"
  _ <- success decimals
  _ <- success uppercases
  _ <- success lowercases
  _ <- output decimals decimals
  _ <- output lowercases lowercases
  _ <- output uppercases uppercases
  _ <- output (lowercases <> decimals <> uppercases <> decimals) (lowercases <> decimals <> uppercases <> decimals)
  pure unit
  where
    success = \check -> E.success check (A.any)
    failure = \check -> E.failure check (A.any)
    output  = \check expect -> E.output check expect (A.any)

main :: Effect Unit
main = do
  _ <- decimal
  _ <- lowercase
  _ <- uppercase
  _ <- any
  pure unit
