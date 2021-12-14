{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "parsing-hexadecimal"
, dependencies =
  [ "arrays"
  , "effect"
  , "foldable-traversable"
  , "lists"
  , "parsing"
  , "parsing-expect"
  , "prelude"
  , "psci-support"
  , "strings"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, version = "0.0.2"
, license = "MIT"
, repository = "https://github.com/markfarrell/purescript-parsing-hexadecimal.git"
}
