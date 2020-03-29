module Ui.Form exposing (container, input, row, button)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)


container : List (Attribute msg) -> List (Html msg) -> Html msg
container =
  styled div
    [ fontSize (px 16)
    , padding2 (px 12) (px 15)
    , Css.width (px 400)
    , marginLeft auto
    , marginRight auto
    ]

row : List (Attribute msg) -> List (Html msg) -> Html msg
row =
  styled div
    [ padding (px 5)
    ]

input : List (Attribute msg) -> List (Html msg) -> Html msg
input =
  styled Html.Styled.input
    [ padding2 (px 5) (px 10)
    , borderRadius (px 3)
    , border3 (px 1) solid (rgb 200 200 200)
    , Css.width (pct 100)
    ]

outlineNone : Style
outlineNone =
  Css.batch
    [ outline none
    ]

button : List (Attribute msg) -> List (Html msg) -> Html msg
button =
  styled Html.Styled.button
    [padding2 (px 5) (px 10)
    , borderRadius (px 3)
    , textAlign center
    , backgroundColor (rgb 39 174 96)
    , border (px 0)
    , fontSize (px 18)
    , color (rgb 255 255 255)
    , hover
      [ cursor pointer
      , backgroundColor (rgb 57 194 96)
      ]
    , focus [outline none]
    , active
      [outline none
      , backgroundColor (rgb 29 164 96)
      ]
    ]
