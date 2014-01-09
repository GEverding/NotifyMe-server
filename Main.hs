{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Data.Text
import Web.Scotty (scotty, middleware, get, post, delete)
import Network.Wai.Middleware.RequestLogger
import Data.Time (getCurrentTime)
import Text.Blaze.Html5 (h1)
import Text.Blaze.Html5.Attributes
import Data.Aeson ((.=), object)
import qualified Web.Scotty as S
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.Text (renderHtml)
import qualified Data.Map as M
import Control.Monad.IO.Class (liftIO)
import Data.Acid

import NotifyMe.Models.User

main :: IO()
main = do

  scotty 3000 $ do
    middleware logStdoutDev
    get "/" $ do
      S.html . renderHtml $ do
        h1 "Hello Wrld"

    post "/api/v1" $ do
      test <- S.param "test"
      liftIO $ print $ show (test::String)
      S.json $ object ["ok" .= ("Okay"::String)]
