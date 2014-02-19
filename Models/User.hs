-- User.hs

module Models.User (
                            User(..),
                            checkPassword
                            )
where

import Models.Types (UserId)
import Data.Text (Text(..), unpack)
import Crypto.BCrypt (validatePassword)
import Control.Applicative ((<$>),(<*>))
import Control.Monad ((>>=))
import qualified Data.ByteString.Char8 as C

data User = User {
          username :: Text,
          password :: Text,
          userId :: UserId
          } deriving (Show)

checkPassword :: Maybe Text -> Maybe Text -> Maybe Bool
checkPassword pswdUser pswdProvided = 
  validatePassword <$> (pswdUser >>= (\x -> return $ p x))  <*> (pswdProvided >>= (\x -> return $ p x))
  where 
        p = C.pack . unpack
