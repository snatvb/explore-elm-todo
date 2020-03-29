module Ui exposing (container, title)

-- import Ui.Todo as Todo
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)


container : List (Attribute msg) -> List (Html msg) -> Html msg
container =
  styled div
    [ Css.width (px 960)
    , marginLeft (auto)
    , marginRight (auto)
    ]

title : List (Attribute msg) -> List (Html msg) -> Html msg
title =
  styled div
    [ margin (px 16)
    , fontSize (px 28)
    , textAlign center
    ]
