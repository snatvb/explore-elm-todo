module Ui.Todo exposing (container, title, description, item, removeButton)

import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)


container : List (Attribute msg) -> List (Html msg) -> Html msg
container =
  styled div
    [ borderTop3 (px 1) solid (rgb 240 240 240)
    , padding2 (px 10) (px 0)
    ]


complited : Bool -> Style
complited isComplited =
  if isComplited then
    Css.batch
      [ textDecoration lineThrough
      , opacity (num 0.7)
      ]
  else
    Css.batch
        []

item : Bool -> List (Attribute msg) -> List (Html msg) -> Html msg
item isComplited =
  styled div
    [ borderBottom3 (px 1) solid (rgb 240 240 240)
    , padding2 (px 12) (px 15)
    , complited isComplited
    , position relative
    ]

title : List (Attribute a) -> String -> Html a
title attrs msg =
  styled div
    [padding2 (px 5) (px 10)
    , fontSize (px 20)
    , textAlign center
    ] attrs [ text msg ]

description : List (Attribute a) -> String -> Html a
description attrs msg =
  styled div
    [ color (rgb 200 200 200)
    , fontSize (px 16)
    , textAlign center
    ] attrs [ text msg ]

removeButton : List (Attribute a) -> Html a
removeButton attrs =
  styled button
    [ color (rgb 255 255 255)
    , fontSize (px 20)
    , textAlign center
    , backgroundColor (rgb 199 0 57)
    , border (px 0)
    , Css.width (px 24)
    , Css.height (px 24)
    , borderRadius (px 5)
    , position absolute
    , right (px 0)
    , top (pct 50)
    , marginTop (px -12)
    , hover
      [ cursor pointer
      , backgroundColor (rgb 210 12 80)
      ]
    , focus [outline none]
    , active
      [outline none
      , backgroundColor (rgb 179 0 47)
      ]
    ] attrs [ text "×" ]
