module Tests.Common exposing (all)

import Date exposing (Date)
import Dict exposing (Dict)
import ElmTestBDDStyle exposing (expect, it, to)
import Expect exposing (Expectation, equal)
import Fuzz exposing (Fuzzer, int, maybe, tuple3)
import Test exposing (Test, describe)
import Time

import Common exposing (..)

all : Test
all =
  describe "Common"
    [ describe "countingIndex"
      [ testInteger "should produce the string value of the increment" <|
          (\int ->
            expect (String.toInt <| countingIndex int) to equal (Ok <| int + 1)
          )
      ]
    , describe "hasMost"
      [ it "should return a list with one ID if that ID has the largest number" <|
          expect (hasMost oneWinner) to equal ["e9e25ff9-3d60-4a3a-a599-acfb2163882a"]
      , it "should return a list with three IDs if those IDs have the largest number" <|
          expect (hasMost threeWinners) to equal
            [ "2045d406-6e42-4b47-bf2a-b89ac2db83f4"
            , "df079ce7-873f-4913-ae4c-eec5cc03ba41"
            , "e9e25ff9-3d60-4a3a-a599-acfb2163882a"
            ]
      , it "should return an empty list if an empty Dict is provided" <|
          expect (hasMost Dict.empty) to equal []
      ]
    , describe "tupleHasNumber"
      [ testThreeIntegers "should return the same equality if the first integer matches the third one" <|
          (\(aInt, bInt, cInt) ->
            expect (tupleHasNumber aInt (bInt, cInt)) to equal (aInt == cInt)
          )
      ]
    , describe "increaseCount"
      [ testMaybeInteger "should return just the value of the increment" <|
          (\maybeInt ->
            expect (Maybe.map (\int -> int - 1) <| increaseCount maybeInt) to equal maybeInt
          )
      ]
    , describe "isNothing"
      [ it "should return True if Nothing is given" <|
          expect (isNothing Nothing) to equal True
      , testInteger "should return False if anything but Nothing is given" <|
          (\int ->
            expect (isNothing <| Just int) to equal False
          )
      ]
    , describe "isSomething"
      [ it "should return False if Nothing is given" <|
          expect (isSomething Nothing) to equal False
      , testInteger "should return True if anything but Nothing is given" <|
          (\int ->
            expect (isSomething <| Just int) to equal True
          )
      ]
    , describe "toDateString"
      [ it "should return a formatted String of the provided Date" <|
          expect (toDateString date) to equal "Sun, Dec 25, 2016"
      ]
    , describe "toDateTimeString"
      [ it "should return a formatted String of the provided Date and Time" <|
          expect (toDateTimeString date) to equal "Sun, Dec 25, 2016 05:30 AM"
      ]
    , describe "toTimeString"
      [ it "should return a formatted String of the provided Time" <|
          expect (toTimeString date) to equal "05:30 AM"
      ]
    ]

testInteger : String -> (Int -> Expectation) -> Test
testInteger =
  hundredTests int

testMaybeInteger : String -> (Maybe Int -> Expectation) -> Test
testMaybeInteger =
  hundredTests <| maybe int

testThreeIntegers : String -> ((Int, Int, Int) -> Expectation) -> Test
testThreeIntegers =
  hundredTests <| tuple3 (int, int, int)

hundredTests : Fuzzer a -> String -> (a -> Expectation) -> Test
hundredTests =
  Test.fuzzWith { runs = 100 }

oneWinner : Dict String Int
oneWinner =
  Dict.fromList
    [ ("540448bb-163c-40b1-9deb-2c8c27e67f3f", 7)
    , ("d9532423-8fc8-446f-a879-b213a462a237", 3)
    , ("773aa956-d8bf-47e2-815b-ecde6331400b", 4)
    , ("41b78dd9-153c-482e-bcab-5fe6d6e97d29", 7)
    , ("df079ce7-873f-4913-ae4c-eec5cc03ba41", 8)
    , ("e9e25ff9-3d60-4a3a-a599-acfb2163882a", 9)
    , ("2045d406-6e42-4b47-bf2a-b89ac2db83f4", 8)
    , ("74b8b904-9116-41ca-ac1f-43d207b7d49f", 1)
    , ("1e2f91e3-6e46-4aac-adcf-fb1e1c082889", 4)
    , ("b050508f-39d2-41a3-aeab-c76c51c5642d", 5)
    ]

threeWinners : Dict String Int
threeWinners =
  Dict.fromList
    [ ("540448bb-163c-40b1-9deb-2c8c27e67f3f", 7)
    , ("d9532423-8fc8-446f-a879-b213a462a237", 3)
    , ("773aa956-d8bf-47e2-815b-ecde6331400b", 4)
    , ("41b78dd9-153c-482e-bcab-5fe6d6e97d29", 7)
    , ("df079ce7-873f-4913-ae4c-eec5cc03ba41", 8)
    , ("e9e25ff9-3d60-4a3a-a599-acfb2163882a", 8)
    , ("2045d406-6e42-4b47-bf2a-b89ac2db83f4", 8)
    , ("74b8b904-9116-41ca-ac1f-43d207b7d49f", 1)
    , ("1e2f91e3-6e46-4aac-adcf-fb1e1c082889", 4)
    , ("b050508f-39d2-41a3-aeab-c76c51c5642d", 5)
    ]

date : Date
date =
  Result.withDefault (Date.fromTime Time.hour)
    <| Date.fromString "2016-12-25T05:30:30-05:00"
