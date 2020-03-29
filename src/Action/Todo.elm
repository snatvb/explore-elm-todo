module Action.Todo exposing (Action(..))

type Action = Add String String | Remove Int | Complete Int | ToggleComplited Int
