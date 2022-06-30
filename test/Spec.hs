import Lib ( isPalindrome, preprocess)
import Data.Char (isPunctuation)
import Test.QuickCheck
    ( stdArgs, quickCheckWith, Args(maxSuccess) )
import qualified Data.Text as T
import Test.QuickCheck.Instances.Text ()

prop_punctuationInvariant :: T.Text -> Bool
prop_punctuationInvariant text = preprocess text ==
                                            preprocess noPuncText
  where noPuncText = T.filter (not . isPunctuation) text

prop_reverseInvariant :: T.Text -> Bool
prop_reverseInvariant text = isPalindrome text == isPalindrome (T.reverse text)

main :: IO ()
main = do
  putStrLn "Running tests..."
  quickCheckWith stdArgs { maxSuccess = 1000}  prop_punctuationInvariant
  quickCheckWith stdArgs { maxSuccess = 1000}  prop_reverseInvariant
  putStrLn "done!"
