{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE InstanceSigs #-}


module Lib
    ( someFunc
    ) where

import GHC.Generics
import Data.Aeson hiding (json)
import Data.Aeson.TH
import Data.Aeson.Types
import Data.Map

data Size = Big   
          | Small Apple
            deriving (Show,Eq,Ord,Read,Generic)


data Apple = AppleA
           | AppleB  Size
           | Apples Apple
            deriving (Show,Eq,Ord,Read,Generic)

data Color = Red 
           | Blue
            deriving (Show,Eq,Ord,Read,Generic)


data Basket = Basket (Map Color Size)
            | Dummy
            deriving (Show,Eq,Ord,Read,Generic)



someFunc :: IO ()
someFunc = putStrLn "someFunc"

$(concat <$> traverse (deriveJSON defaultOptions) [''Size, ''Apple, ''Basket, ''Color])

instance ToJSONKey Color where
  toJSONKey = genericToJSONKey defaultJSONKeyOptions

instance FromJSONKey Color where
  fromJSONKey = genericFromJSONKey defaultJSONKeyOptions


-- $(deriveJSON defaultOptions ''Apple)
-- $(deriveJSON defaultOptions ''Size)