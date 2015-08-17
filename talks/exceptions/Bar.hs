{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE StandaloneDeriving #-}

import Control.Exception
import Control.Monad
import Data.Typeable

data Foo = forall e . Exception e => Foo e
  deriving Typeable

deriving instance Show Foo

data Bar = Bar
  deriving (Show, Typeable)

data Baz = Baz
  deriving (Show, Typeable)

instance Exception Foo

instance Exception Bar where
  toException   = toException . Foo
  fromException = fromException >=> \(Foo a) -> cast a

instance Exception Baz where
  toException   = toException . Foo
  fromException = fromException >=> \(Foo a) -> cast a

main :: IO ()
main = do
  throw Bar `catch` \e -> print (e :: Bar)
