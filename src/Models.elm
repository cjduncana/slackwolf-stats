module Models exposing (Model, View(..), model)

import Material

import Models.Home exposing (HomeModel)
import Models.Game exposing (GameModel)
import Models.GameDetail exposing (GameDetailModel)

type alias Model =
  { mdl : Mdl
  , games : List GameModel
  , current : View
  }

type alias Mdl =
  Material.Model

model : View -> Model
model view =
  { mdl = Material.model
  , games = []
  , current = view
  }

type View
  = Home HomeModel
  | GameDetail GameDetailModel
  | Empty String
