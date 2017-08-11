module Models.Home exposing (HomeModel, initialHomeModel)

type alias HomeModel =
  { raised : Int }

initialHomeModel : HomeModel
initialHomeModel =
  HomeModel -1
