{-# LANGUAGE OverloadedStrings #-}

module Notify.Routes.Home (routes) where

import qualified Notify.Routes.Home.Templates as Template
import Notify.Types
import Web.Scotty.Blaze (blaze)
import Web.Scotty

index :: NotifyM ()
index = do
  r <- renderer
  liftScotty $ get "/" (r "Home" Template.index)

routes = index
