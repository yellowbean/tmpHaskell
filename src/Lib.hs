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


data Size = Big   
          | Small Apple
            deriving (Show,Eq,Ord,Read,Generic)


data Apple = AppleA
           | AppleB  Size
           | Apples Apple
            deriving (Show,Eq,Ord,Read,Generic)



someFunc :: IO ()
someFunc = putStrLn "someFunc"

$(deriveJSON defaultOptions ''Size)
$(deriveJSON defaultOptions ''Apple)