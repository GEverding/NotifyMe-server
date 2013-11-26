
{-# LANGUAGE OverloadedStrings #-}

module Notify.Routes.Home.Templates (
  index
) where

import Prelude hiding (span)
import Web.Scotty.Blaze (blaze)
import Text.Blaze.Html5
import qualified Text.Blaze.Html5.Attributes as A

index = a ! A.href "http://google.com" $ "index"
