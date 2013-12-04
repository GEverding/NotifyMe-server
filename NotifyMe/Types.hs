
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module NotifyMe.Types where

import Data.Text (Text)
import Web.Scotty (ScottyM, ActionM)
import Web.Scotty.Blaze (blaze)
import Text.Blaze.Html (Html)
import Control.Monad.Reader (ReaderT, ask, MonadReader, runReaderT)
import Control.Monad.Trans (lift)
import Control.Applicative

type BaseRenderer = Text -> Html -> Html

data NotifyMeConfig = NotifyMeConfig { configRender :: BaseRenderer }

newtype NotifyMeM a = NotifyMeM { runNotifyMe :: ReaderT NotifyMeConfig ScottyM a }
               deriving (Monad, Functor, MonadReader NotifyMeConfig)


class Monad m => MonadScotty m where
  liftScotty :: ScottyM a -> m a

instance MonadScotty NotifyMeM where
  liftScotty = NotifyMeM . lift

toScotty :: NotifyMeConfig-> NotifyMeM a -> ScottyM a
toScotty c m = runReaderT (runNotifyMe m) c

renderer :: NotifyMeM (Text -> Html -> ActionM ())
renderer = renderer' . configRender <$> ask

renderer' :: BaseRenderer -> Text -> Html -> ActionM ()
renderer' r t h = blaze (r t h)

