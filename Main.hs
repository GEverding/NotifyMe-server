{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import qualified NotifyMe.Routes.Common.Templates as CommonTemplates

import NotifyMe.Models.User
import NotifyMe.Routes (routes)
import NotifyMe.Types (toScotty, NotifyMeConfig(..))
import Web.Scotty (scotty, middleware)
import Network.Wai.Middleware.RequestLogger
import Database.Persist
import Database.Persist.TH
import Database.Persist.MySQL
import Database.MySQL.Base.Types
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Trans.Resource (runResourceT, ResourceT)

defaultConfig = NotifyMeConfig CommonTemplates.base

toScotty' = toScotty defaultConfig

connectInfo = ConnectInfo "localhost" 3302 "pusher" "pusher" "NotifyMe" [CharsetName "utf8"] "" Nothing

{-runDb :: SqlPersist (ResourceT IO) a -> IO a-}
{-runDb query = runResourceT . withPostgresqlPool connStr 10 $ \pool -> do-}
      {-flip runSqlPersistMPool pool $ do query-}

main :: IO()
main = do
  withMySQLPool connectInfo 10 $ \pool -> do
      flip runSqlPersistMPool pool $ do
          runMigration migrateAll
          insert $ User "test" "test@example.com"

  scotty 3000 $ do
    middleware logStdoutDev
    (toScotty' routes)

