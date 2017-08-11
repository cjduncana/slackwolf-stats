module Views exposing (view)

import Html exposing (Html)
import Material.Layout as Layout

import Messages exposing (Msg(Mdl))
import Models exposing (Model)
import Views.Body as BodyView
import Views.Header as HeaderView

view : Model -> Html Msg
view model =
  Layout.render Mdl model.mdl [ Layout.scrolling ]
    { header = [ HeaderView.view ]
    , drawer = []
    , tabs = ([], [])
    , main = [ BodyView.view model ]
    }
