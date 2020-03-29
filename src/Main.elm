import Browser
import Json.Decode as Decode
import Ui as Ui exposing (..)
import Form as Form exposing (..)
import Store exposing (..)
import Action exposing (Action(..))
import Action.Todo
import Action.Form
import Ui.Todo as Todo exposing (..)
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)


main : Program () Store.Model Action
main =
    Browser.sandbox
        { view = view >> toUnstyled
        , update = Store.update
        , init = Store.initialModel
        }

renderPureHtml : List (Html a) -> List (Maybe (Html a)) -> List (Html a)
renderPureHtml ja ma =
  List.append ja (List.filterMap (\x -> x) ma)

onStopClick : msg -> Attribute msg
onStopClick message =
    custom "click" (Decode.succeed { message = message, stopPropagation = True, preventDefault = True })

renderTodo : Int -> Todo -> Html Action
renderTodo index todo =
  Todo.item todo.complited [ onClick <| Action.Todo <| Action.Todo.ToggleComplited index ]
  <| renderPureHtml
      [ Todo.title [] todo.title
        , Todo.removeButton [ onStopClick <| Action.Todo <| Action.Todo.Remove index]
      ]
      [ Maybe.map (Todo.description []) todo.description
      ]


renderTodos : Store.Model -> List (Html Action)
renderTodos model =
  if List.length model.todos > 0 then
    List.indexedMap renderTodo model.todos
  else
    [text "No one todo item"]


view : Store.Model -> Html Action
view model =
    Ui.container []
        [ Ui.title [] [ text "To do with elm!" ]
        , Todo.container [] <| renderTodos model
        , Form.view model.form
        ]
