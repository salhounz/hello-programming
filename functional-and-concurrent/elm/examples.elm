module Examples exposing (main)

import Html exposing (Html, div, h1, li, p, text, ul)


-- Records have named fields and statically checked types.
type alias Book =
    { title : String
    , available : Bool
    }


books : List Book
books =
    [ { title = "Dune", available = True }
    , { title = "Emma", available = False }
    , { title = "Sapiens", available = True }
    ]


-- Functions return values; there is no mutation here.
label : Book -> String
label book =
    book.title
        ++ (if book.available then
                " — on shelf"

            else
                " — on loan"
           )


firstTitle : List Book -> String
firstTitle catalog =
    case List.head catalog of
        Just book ->
            book.title

        Nothing ->
            "No books"


-- This view is a static Html value, suitable for an Elm browser page.
main : Html msg
main =
    let
        available =
            List.filter .available books

        rows =
            List.map (\book -> li [] [ text (label book) ]) books
    in
    div []
        [ h1 [] [ text "Neighborhood shelf" ]
        , ul [] rows
        , p [] [ text ("First available: " ++ firstTitle available) ]
        , p [] [ text ("Available count: " ++ String.fromInt (List.length available)) ]
        ]
