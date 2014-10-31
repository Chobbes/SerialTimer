{- Copyright (C) 2014 Calvin Beck

   Permission is hereby granted, free of charge, to any person
   obtaining a copy of this software and associated documentation files
   (the "Software"), to deal in the Software without restriction,
   including without limitation the rights to use, copy, modify, merge,
   publish, distribute, sublicense, and/or sell copies of the Software,
   and to permit persons to whom the Software is furnished to do so,
   subject to the following conditions:

   The above copyright notice and this permission notice shall be
   included in all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
   BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
   ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.
-}

{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent
import Control.Monad
import Data.ByteString as B
import System.Environment
import System.IO
import System.Hardware.Serialport


main :: IO ()
main = do [port] <- getArgs
          time <- withSerial port defaultSerialSettings (timeSerial)
          print time
          print (B.length time)

-- | Count the number of times we get an 'a' or something.
timeSerial :: SerialPort -> IO ByteString
timeSerial port = do threadDelay 10000000
                     flush port
                     sent <- send port "s"
                     threadDelay 300000
                     recv port 1000000
