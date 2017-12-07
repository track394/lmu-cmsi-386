import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Warmup exposing (..)

type alias Dates = { firstDate: String, secondDate: String }
type Msg = ChangeFirstDate String | ChangeSecondDate String

formatOutput : Result String Int -> String
formatOutput toFormat =
  case toFormat of
    Err msg -> ""
    Ok output -> toString output

dates : Dates
dates = { firstDate = "", secondDate = "" }

updateDates : Msg -> Dates -> Dates
updateDates msg dates =
  case msg of
    ChangeFirstDate f -> { dates | firstDate = f }
    ChangeSecondDate s -> { dates | secondDate = s }

main : Html Msg
main =
  body
    [style
      [ ("text-align", "center")
      ,  ("font", "16px Arial")
      ,  ("background-color", "linen")
      ,  ("margin", "0")
      ]
    ]
    [ h1
      [style
        [ ("font", "bold 40px Avenir")
        ,  ("margin-top", "0")
        ,  ("padding", "5px")
        ,  ("background-color", "cyan")
        ]
      ]
      [ text "Date Calculator" ]
    , p []
      [text "From"
      , input
        [style
          [ ("border", "2px solid grey")
          , ("margin-left", "8px")
          ]
        , id "from"
        , type_ "date"
        , onInput ChangeFirstDate
        , value dates.firstDate
        ] []
      ]
    , p []
      [text "to"
      , input
        [style
          [ ("border", "2px solid grey")
          , ("margin-left", "8px")
          ]
        , id "to"
        , type_ "date"
        , onInput ChangeSecondDate
        , value dates.secondDate
        ] []
      ]
    , p []
      [text "is "
      , span
        [style
          [ ("font-size", "28px") ]
          , id "output"
        ]
        [ text ( formatOutput (daysBetween dates.firstDate dates.secondDate)) ]
      , text "days."
      ]
    ]
