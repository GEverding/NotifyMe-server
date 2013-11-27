
module Main (main) where

import qualified Notify.Routes.Common.Templates as CommonTemplates

import Notify.Routes (routes)
import Notify.Types (toScotty, NotifyConfig(..))
import Web.Scotty (scotty, middleware)
import Network.Wai.Middleware.RequestLogger

defaultConfig = NotifyConfig CommonTemplates.base

toScotty' = toScotty defaultConfig

main = scotty 3000 $ do
  middleware logStdoutDev
  (toScotty' routes)

