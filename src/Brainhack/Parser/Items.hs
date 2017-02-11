{-# LANGUAGE OverloadedStrings #-}

-- | Define about the types used in around the parser
module Brainhack.Parser.Items where

import Control.Exception.Safe (Exception, Typeable)
import Data.Text (Text)

-- | The expression of the brainf*ck's ><+-.,[]
class BrainfuckOperation a where
  forwardOp   :: a
  backwordOp  :: a
  incrOp      :: a
  decrOp      :: a
  outputOp    :: a
  inputOp     :: a
  loopBeginOp :: a
  loopEndOp   :: a
  toToken     :: a -> Text  -- ^ Convert BrainfuckOperation to token text
  fromToken   :: Text -> Maybe a  -- ^ Convert text to BrainfuckOperation, but return Nothing if the text isn't token

-- | The whole of the brainf*ck source code abstract
type BrainfuckProgram a = [a]

-- | An exception of brainf*ck instance's parser with the cause
data BrainfuckParserException = BrainfuckParserException String
  deriving (Show, Typeable)

instance Exception BrainfuckParserException
