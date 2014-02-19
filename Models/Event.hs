-- Event.hs

module Models.Event (
                             Event(..),
) where
import Models.Types (EventId, UserId)
import Data.Text (Text)
import Data.Time

data Event = Event { userid :: UserId,
           eventId :: EventId, 
           timestamp :: UTCTime, 
           blob :: Text 
           } deriving (Show)

