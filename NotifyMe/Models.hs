{-# LANGUAGE EmptyDataDecls       #-}
{-# LANGUAGE FlexibleContexts     #-}
{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE GADTs                #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module NotifyMe.Models.User where
import Data.Text (Text)
import Data.Time (UTCTime)
import Database.Persist
import Database.Persist.TH


share [mkPersist sqlSettings, teAll"] [persistLowerCase|
      User
        username Text
        email String
        deriving Show Eq Ord

      Event
        timestamp UTCTime 
        userId Int
        deriving Show Eq Ord
|]
