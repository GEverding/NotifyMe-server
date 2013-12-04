{-# LANGUAGE OverloadedStrings #-}

module NotifyMe.Routes.Home (routes) where

import qualified NotifyMe.Routes.Home.Templates as Template
import NotifyMe.Types
import Web.Scotty.Blaze (blaze)
import Web.Scotty

index :: NotifyMeM ()
index = do
  r <- renderer
  liftScotty $ get "/" (r "Home" Template.index)

routes = index
