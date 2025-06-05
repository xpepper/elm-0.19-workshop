module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)


viewTags : List String -> Html msg
viewTags tags =
    let
        renderedTags : List (Html msg)
        renderedTags =
            List.map viewTag tags

    in
    div [ class "tag-list" ] renderedTags


viewTag : String -> Html msg
viewTag tagName =
    {- 👉 TODO: render something like this:

       <button class="tag-pill tag-default">tag name goes here</button>
    -}
    button [class "tag-pill tag-default"] [text tagName]


main =
    let
        tags =
            [ "elm", "fun", "programming", "compilers" ]
    in
    div [ class "home-page" ]
        [ viewBanner
        , div [ class "container page" ]
            [ div [ class "row" ]
                [ div [ class "col-md-9" ] [ viewFeed ]
                , div [ class "col-md-3" ]
                    [ div [ class "sidebar" ]
                        [ p [] [ text "Popular Tags" ]

                        -- 👉 TODO: instead of passing [] to viewTags, pass the actual tags
                        , viewTags tags
                        ]
                    ]
                ]
            ]
        ]


viewBanner =
    div [ class "banner" ]
        [ div [ class "container" ]
            [ h1 [ class "logo-font" ] [ text "conduit" ]
            , p [] [ text "A place to share your knowledge." ]
            ]
        ]


viewFeed =
    div [ class "feed-toggle" ] [ text "(We’ll display some articles here later.)" ]
