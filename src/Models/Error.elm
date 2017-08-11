module Models.Error exposing (ErrorModel, basicError)

type alias ErrorModel =
  { statusCode: Int
  , error: String
  , message: String
  }

basicError : ErrorModel
basicError =
  ErrorModel 0 "Error" "Error"
