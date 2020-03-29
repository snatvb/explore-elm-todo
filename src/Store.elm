module Store exposing (..)

import Action exposing (Action(..))
import Action.Todo
import Action.Form
import List.Extra exposing (..)

initialModel : Model
initialModel =
    { todos = [{ title = "Hello world!"
      , complited = False
      , description = Nothing
      }, { title = "I made that"
      , complited = True
      , description = Just "This is description"
      }]
      , form =
      { title = ""
      , description = ""
      }
    }

type alias Todo =
  { title: String
  , complited: Bool
  , description: Maybe String
  }

type alias Todos = List (Todo)

type alias Form =
  { title: String
  , description: String
  }

type alias Model =
  { todos: Todos
  , form: Form
  }

updateForm : Action.Form.Action -> Form -> Form
updateForm action model =
  case action of
       Action.Form.SetDescription description ->
          { model | description = description }

       Action.Form.SetTitle title ->
          { model | title = title }

       Action.Form.Reset ->
          { model |
            title = ""
            , description = ""
          }

setComplited : Bool -> Todo -> Todo
setComplited isComplited todo =
  { todo | complited = isComplited }

toggleComplited : Todo -> Todo
toggleComplited todo =
  { todo | complited = not todo.complited }

setAtMaybe : Int -> Maybe a -> List a -> List a
setAtMaybe index m list =
    case m of
        Just value ->
            setAt index value list

        Nothing ->
            list


setComplitedByIndex : Todos -> Int -> (Todo -> Todo) -> Todos
setComplitedByIndex todos index mapTodo =
    let
      todo = Maybe.map
        mapTodo
        (getAt index todos)
    in
      setAtMaybe index todo todos

updateTodos : Action.Todo.Action -> Model -> Model
updateTodos action model =
  case action of
    Action.Todo.Add title description ->
      { model |
        todos =
          { title = title
            , description = Just description
            , complited = False
          } :: model.todos
        , form = updateForm Action.Form.Reset model.form
      }
    Action.Todo.Complete id ->
      { model | todos = setComplitedByIndex model.todos id <| setComplited True }
    Action.Todo.ToggleComplited id ->
      { model | todos = setComplitedByIndex model.todos id toggleComplited }
    Action.Todo.Remove id ->
      { model | todos = removeAt id model.todos }


update : Action -> Model -> Model
update action model =
    case action of
        Action.Form formAction ->
            { model | form = updateForm formAction model.form }
        Action.Todo todoAction ->
            updateTodos todoAction model
