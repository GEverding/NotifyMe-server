-- Event.hs

module NotifyMe.Models.Event (
                             Event(..),
) where
import NotifyMe.Types(EventId, UserId)
import Data.Text (Text)
import Data.Time

data Event = Event { userid :: UserId,
           eventId :: EventId, 
           timestamp :: UTCTime, 
           blob :: Text 
           } deriving (Show)

