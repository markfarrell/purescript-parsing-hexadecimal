module Text.Parsing.Char.Hexadecimal
  ( decimal 
  , lowercase
  , uppercase
  , any
  ) where

import Prelude

import Text.Parsing.Parser (ParserT)
import Text.Parsing.Parser.Combinators as C
import Text.Parsing.Parser.String as S

decimals :: Array Char
decimals = [ '0','1','2','3','4','5','6','7','8','9' ]

lowercases :: Array Char
lowercases = [ 'a', 'b', 'c', 'd', 'e', 'f' ]

uppercases :: Array Char
uppercases = [ 'A', 'B', 'C', 'D', 'E', 'F' ]

-- | Consumes a valid decimal character (0-9), or fails otherwise.
decimal :: forall m. Monad m => ParserT String m Char
decimal = C.choice (S.char <$> decimals)

-- | Consumes a valid uppercase hexadecimal character (A-Z|0-9), or fails otherwises.
lowercase :: forall m. Monad m => ParserT String m Char
lowercase = C.choice (S.char <$> decimals <> lowercases)

-- | Consumes a valid uppercase hexadecimal character (a-z|0-9), or fails otherwises.
uppercase :: forall m. Monad m => ParserT String m Char
uppercase = C.choice (S.char <$> decimals <> uppercases)

-- | Consumes a valid uppercase hexadecimal character (a-z|A-Z|0-9), or fails otherwises.
any :: forall m. Monad m => ParserT String m Char
any = C.choice (S.char <$> decimals <> lowercases <> uppercases)
