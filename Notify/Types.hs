
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Notify.Types where

import Data.Text (Text)
import Web.Scotty (ScottyM, ActionM)
import Web.Scotty.Blaze (blaze)
import Text.Blaze.Html (Html)
import Control.Monad.Reader (ReaderT, ask, MonadReader, runReaderT)
import Control.Monad.Trans (lift)
import Control.Applicative

type BaseRenderer = Text -> Html -> Html

data NotifyConfig = NotifyConfig { configRender :: BaseRenderer }

newtype NotifyM a = NotifyM { runNotify :: ReaderT NotifyConfig ScottyM a }
               deriving (Monad, Functor, MonadReader NotifyConfig)


class Monad m => MonadScotty m where
  liftScotty :: ScottyM a -> m a

instance MonadScotty NotifyM where
  liftScotty = NotifyM . lift

toScotty :: NotifyConfig-> NotifyM a -> ScottyM a
toScotty c m = runReaderT (runNotify m) c

renderer :: NotifyM (Text -> Html -> ActionM ())
renderer = renderer' . configRender <$> ask

renderer' :: BaseRenderer -> Text -> Html -> ActionM ()
renderer' r t h = blaze (r t h)

