
{-# LANGUAGE OverloadedStrings #-}

module Notify.Routes.Common.Templates (
  base
) where

import Prelude hiding (head, div)
import Text.Blaze.Html5 hiding (base)
import qualified Text.Blaze.Html5.Attributes as A
import Data.Text (Text)
import Data.Monoid ((<>))

base :: Text -> Html -> Html
base t content =
  docTypeHtml $ do
    head $ do
      title (toHtml $ t <> " | Notify")
    body $ do
      div ! A.class_ "content" $ content
      div ! A.class_ "content2" $ content
