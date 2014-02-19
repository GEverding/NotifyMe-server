{-# LANGUAGE OverloadedStrings #-}

module Views.Home (
                  homeView
)	where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5              as H
import qualified Text.Blaze.Html5.Attributes   as A
import           Views.Index (layout)
import           Views.Util (blaze)
import           Web.Scotty (ActionM)

homeView :: ActionM ()
homeView = blaze $ layout "home" $ do
             H.div ! class_ "container" $ do
               H.div ! class_ "jumbotron" $ do
                 H.h1 "Scotty Starter"
                 H.p "Welcome to the Scotty Starter template, equipped with Twitter Bootstrap 3.0 and HTML5 boilerplate"
                 H.p $ do 
                          H.a ! class_ "btn btn-lg btn-primary" ! A.id "fb" ! href "#navbar" $ "Facebook"
                          H.a ! class_ "btn btn-lg btn-danger" ! A.id "gmail" ! href "#navbar" $ "Gmail"
