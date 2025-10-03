module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Random


-- MAIN

main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }


-- MODEL

type alias Model =
    { randomNumber : Int }


initialModel : Model
initialModel =
    { randomNumber = 0 }


-- MESSAGES

type Msg
    = GenerateRandom
    | GotRandomInt Int


-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GenerateRandom ->
            ( model, Random.generate GotRandomInt (Random.int 1 100) )

        GotRandomInt number ->
            ( { model | randomNumber = number }, Cmd.none )


-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ div [] [ text ("Current number: " ++ String.fromInt model.randomNumber) ]
        , button [ onClick GenerateRandom ] [ text "Roll" ]
        ]
