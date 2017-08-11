module Views.Body exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (style)

import Views.Game.Detail exposing (gameDetailView)
import Views.Home exposing (homeView)
import Messages exposing (Msg(..))
import Models exposing (Model, View(..))
import Views.Error as ErrorView

view : Model -> Html Msg
view model =
  div
    [ style
      [ ("width", "1024px")
      , ("margin", "0 auto")
      ]
    ]
    [ bodyView model ]

bodyView : Model -> Html Msg
bodyView model =
  case model.current of
    Home homeModel ->
      Html.map ChangeHome <| homeView model.games homeModel

    GameDetail gameDetailModel ->
      Html.map ChangeGameDetail <| gameDetailView gameDetailModel

    Empty error ->
      ErrorView.view error
