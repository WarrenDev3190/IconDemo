module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


navBar : Html a
navBar =
    nav [ class "navbar navbar-toggleable-md navbar-inverse", style [ ( "backgroundColor", "#2C1B5C" ) ] ]
        [ button [ attribute "aria-controls" "navbarNavDropdown", attribute "aria-expanded" "false", attribute "aria-label" "Toggle navigation", class "navbar-toggler navbar-toggler-right", attribute "data-target" "#navbarNavDropdown", attribute "data-toggle" "collapse", type_ "button" ]
            [ span [ class "navbar-toggler-icon" ]
                []
            ]
        , a [ class "navbar-brand", href "#" ]
            [ text "PRN" ]
        , div [ class "collapse navbar-collapse", id "navbarNavDropdown" ]
            [ ul [ class "navbar-nav" ]
                [ li [ class "nav-item active" ]
                    [ a [ class "nav-link", href "/" ]
                        [ text "Home "
                        , span [ class "sr-only" ]
                            [ text "(current)" ]
                        ]
                    ]
                , li [ class "nav-item dropdown" ]
                    [ a [ attribute "aria-expanded" "false", attribute "aria-haspopup" "true", class "nav-link dropdown-toggle", attribute "data-toggle" "dropdown", href "#", id "navbarDropdownMenuLink" ]
                        [ text "Hello, Nurse Joy        " ]
                    , div [ attribute "aria-labelledby" "navbarDropdownMenuLink", class "dropdown-menu" ]
                        [ a [ class "dropdown-item disabled", href "#" ]
                            [ text "Logout" ]
                        ]
                    ]
                ]
            ]
        ]
