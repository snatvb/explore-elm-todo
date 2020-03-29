module Action exposing (Action(..))

import Action.Todo
import Action.Form


type Action
    = Todo Action.Todo.Action
    | Form Action.Form.Action