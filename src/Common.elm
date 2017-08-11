module Common exposing (..)

import Date exposing (Date)
import Date.Format exposing (format)
import Dict exposing (Dict)

countingIndex : Int -> String
countingIndex index =
  toString <| index + 1

hasMost : Dict comparable Int -> List comparable
hasMost count =
  let
    counts : List Int
    counts =
      Dict.values count

    highestCount : Int
    highestCount =
      Maybe.withDefault 0 <| List.maximum counts

    hasHighestCount : (a, Int) -> Bool
    hasHighestCount =
      tupleHasNumber highestCount

  in
    Dict.toList count
      |> List.filter hasHighestCount
      |> List.map Tuple.first

tupleHasNumber : Int -> (a, Int) -> Bool
tupleHasNumber thisNumber (_, aNumber) =
  thisNumber == aNumber

increaseCount : Maybe Int -> Maybe Int
increaseCount =
  Maybe.map (\count -> count + 1)

isNothing : Maybe a -> Bool
isNothing =
  (==) Nothing

isSomething : Maybe a -> Bool
isSomething maybeSomething =
  (not <| isNothing maybeSomething)

toDateString : Date -> String
toDateString =
  format "%a, %b %d, %Y"

toDateTimeString : Date -> String
toDateTimeString =
  format "%a, %b %d, %Y %I:%M %p"

toTimeString : Date -> String
toTimeString =
  format "%I:%M %p"
