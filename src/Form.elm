module Form exposing (Model, initModel, view)
import Action exposing (Action(..))
import Action.Todo
import Action.Form
import Ui.Form as FormUi exposing (..)
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)

type alias Model =
  { title: String
  , description: String
  }

initModel : Model
initModel =
  { title = ""
  , description = ""
  }

valid : Model -> Bool
valid model =
  not <| String.isEmpty model.title

withSubmit : Model -> List (Attribute Action) -> List (Attribute Action)
withSubmit model attrs =
  if valid model then
      (onClick <| Action.Todo <| Action.Todo.Add model.title model.description) :: attrs
    else
      attrs

view : Model -> Html Action
view model =
    FormUi.container []
        [ FormUi.row []
        [ FormUi.input [ placeholder "Title", value model.title, onInput <| Action.Form << Action.Form.SetTitle ] []
        ]
        , FormUi.row [] [
          FormUi.input [ placeholder "Description", value model.description, onInput <| Action.Form << Action.Form.SetDescription ] []
        ]
        , FormUi.row [] [
          FormUi.button
            (withSubmit model
              [css
                [marginLeft auto
                , marginRight auto
                , display block
                ]
              ]
            )
            [ text "Add" ]
        ]
        ]
