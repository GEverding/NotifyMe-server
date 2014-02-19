{-# LANGUAGE OverloadedStrings #-}

module Controllers.Api (
)	where

import           Web.Scotty             (ScottyM, get, post, delete, param, json)
import           Data.Aeson             ((.=), object)
import           Control.Monad.IO.Class (liftIO)

test :: ScottyM ()
test =
    post "/api/v1" $ do
      test <- param "test"
      liftIO $ print $ show (test::String)
      json $ object ["ok" .= ("Okay"::String)]
