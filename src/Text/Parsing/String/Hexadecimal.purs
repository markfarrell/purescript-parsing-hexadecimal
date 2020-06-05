module Text.Parsing.String.Hexadecimal 
  ( decimal 
  , lowercase
  , uppercase
  , any
  ) where

import Prelude

import Data.Foldable (foldMap)

import Data.String.CodeUnits (singleton)

import Data.Array as Array
import Data.List  as List

import Text.Parsing.Parser (ParserT, fail)
import Text.Parsing.Parser.String as S

import Text.Parsing.Char.Hexadecimal as A

-- | Consumes a non-empty string of decimal characters (0-9+), or fails otherwise.
decimal :: forall a m. S.StringLike a => Monad m => ParserT a m String
decimal = do
  x <- Array.fromFoldable <$> List.many A.decimal
  case Array.length x > 0 of
    false -> fail $ "Number of decimal characters must be positive." 
    true  -> pure $ foldMap singleton x 

-- | Consumes a non-empty string of uppercase hexadecimal characters (0-F+), or fails otherwise.
uppercase :: forall a m. S.StringLike a => Monad m => ParserT a m String
uppercase = do
  x <- Array.fromFoldable <$> List.many A.uppercase
  case Array.length x > 0 of
    false -> fail $ "Number of uppercase hexadecimal characters must be positive." 
    true  -> pure $ foldMap singleton x 

-- | Consumes a non-empty string of hexadecimal characters (0-f+), or fails otherwise.
lowercase :: forall a m. S.StringLike a => Monad m => ParserT a m String
lowercase = do
  x <- Array.fromFoldable <$> List.many A.lowercase
  case Array.length x > 0 of
    false -> fail $ "Number of lowercase hexadecimal characters must be positive." 
    true  -> pure $ foldMap singleton x 

-- | Consumes a non-empty string of hexadecimal characters ((0-f|0-F)+), or fails otherwise.
any :: forall a m. S.StringLike a => Monad m => ParserT a m String
any = do
  x <- Array.fromFoldable <$> List.many A.any
  case Array.length x > 0 of
    false -> fail $ "Number of hexadecimal characters must be positive." 
    true  -> pure $ foldMap singleton x 
