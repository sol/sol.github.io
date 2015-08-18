import Control.DeepSeq
import Control.Exception

main :: IO ()
main = do
  return $!! 'a' : throw (ErrorCall "foo")
  throwIO (ErrorCall "bar")
