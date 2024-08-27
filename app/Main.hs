{-# LANGUAGE OverloadedStrings #-}

module Main where
import Web.Scotty

main :: IO ()
main = scotty 3000 $
  get "/" $ do
    html "disco haskell ftw!!"

  get "/:word" $ do
    beam <- pathParam "word"
    html $ mconcat ["<h1>disco, ", beam, " me up!</h1>"]
