module Lib
    (   isPalindrome,
       preprocess
    ) where
import Data.Char (isPunctuation)
import qualified Data.Text as T

preprocess :: T.Text -> T.Text
preprocess = T.filter (not . isPunctuation)

isPalindrome :: T.Text -> Bool
isPalindrome text = cleanText == T.reverse cleanText
  where cleanText = preprocess text
  