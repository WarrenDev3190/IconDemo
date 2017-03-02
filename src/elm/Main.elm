module Main exposing (..)

import Html exposing (..)
import Json.Encode exposing (..)
import Html.Attributes as Attrs exposing (..)
import Html.Events exposing (..)


type alias Model =
    { error : String
    , sepsisScore : Float
    }


initModel : Model
initModel =
    { sepsisScore = 4
    , error = ""
    }


genderScale : Float -> Float
genderScale x =
    (((5 - 1) * (x - 1)) / (10 - 1)) + 1


acuityScale : Float -> Float
acuityScale x =
    (1.0 * (x - 1) / (10 - 1))


acuityRating : Int -> String
acuityRating score =
    if score == 1 then
        "High"
    else
        "Low"


skillMix : Float -> Float
skillMix x =
    sqrt (x) / 0.5


nearestHalf : Float -> Int
nearestHalf x =
    round ((x * 2)) // 2


type Msg
    = ScoreChange String


update : Msg -> Model -> Model
update msg model =
    case msg of
        ScoreChange score ->
            case String.toFloat score of
                Ok num ->
                    { model
                        | error = ""
                        , sepsisScore = num
                    }

                Err error ->
                    { model | error = error }


view : Model -> Html Msg
view model =
    div [ class "wrapper" ]
        [ div [ class "navigation" ]
            [ h3 [ style [ ( "padding", "0px 12px" ) ] ] [ text "PRN - Demo" ]
            ]
        , div [ class "row" ]
            [ div [ class "col-xs-1" ]
                [ div [ class "side_navigation" ]
                    [ ul []
                        [ li [] [ text "MedSurg Unit - 4AE" ]
                        , li [ class "active" ]
                            [ i
                                [ class "icon ion-stats-bars"
                                , style [ ( "paddingRight", "5px" ), ( "display", "inline-block" ) ]
                                ]
                                []
                            , text "Dashboard"
                            ]
                        ]
                    ]
                ]
            , div [ class "col-xs-11" ]
                [ div [ class "container" ]
                    [ div [ class "row animated fadeInUp" ]
                        [ div [ class "col-xs-12" ]
                            [ h1 [ class "display-4" ] [ text "Brandon Regional Medical Center" ]
                            , hr [] []
                            ]
                        ]
                    , div [ class "row animated fadeInUp" ]
                        [ div [ class "col-xs-12" ]
                            [ h5 [] [ text "Critical Metrics" ]
                            , div [ style [ ( "display", "flex" ), ( "justifyContent", "space-around" ) ] ]
                                [ div [ class "metric-card", style [ ( "display", "flex" ) ] ]
                                    [ div [ class "metric-card__section metric-card__name" ]
                                        [ h4 [] [ text "Quality & Safety" ]
                                        , p [ style [ ( "marginBottom", "5px" ), ( "color", "#5A65F7" ) ] ] [ text "Ranked 6th Overall" ]
                                        , div [ class "trophy-one" ] []
                                        ]
                                    , div [ class "metric-card__section metric-card__controls" ]
                                        [ div [ class "metric-card__icon" ]
                                            [ div []
                                                [ div [ class "icon__indicator" ] []
                                                , div [] [ text "Sepsis" ]
                                                ]
                                            ]
                                        , div [ class "metric-card__icon disabled" ]
                                            [ div []
                                                [ div [ class "icon__indicator" ] []
                                                , div [ style [ ( "color", "#E8ECEF" ) ] ] [ text "Diabetes" ]
                                                ]
                                            ]
                                        ]
                                    ]
                                , div [ class "metric-card", style [ ( "display", "flex" ) ] ]
                                    [ div [ class "metric-card__section metric-card__name" ]
                                        [ h4 [] [ text "People" ]
                                        , p [ style [ ( "color", "#5A65F7" ) ] ] [ text "Ranked 12th Overall" ]
                                        , div [ class "trophy-two" ] []
                                        ]
                                    , div [ class "metric-card__section metric-card__controls" ]
                                        [ div [ class "metric-card__icon disabled" ]
                                            [ div []
                                                [ div [ class "icon__indicator" ] []
                                                , div [ style [ ( "color", "#E8ECEF" ) ] ] [ text "Staffing" ]
                                                ]
                                            ]
                                        , div [ class "metric-card__icon disabled" ]
                                            [ div []
                                                [ div [ class "icon__indicator" ] []
                                                , div [ style [ ( "color", "#E8ECEF" ) ] ] [ text "Education" ]
                                                ]
                                            ]
                                        ]
                                    ]
                                , div [ class "metric-card", style [ ( "display", "flex" ) ] ]
                                    [ div [ class "metric-card__section metric-card__name" ]
                                        [ h4 [] [ text "Patient Experience" ]
                                        , p [ style [ ( "color", "#5A65F7" ) ] ] [ text "Ranked 3rd Overall" ]
                                        , div [ class "trophy-three" ] []
                                        ]
                                    , div [ class "metric-card__section metric-card__controls" ]
                                        [ div [ class "metric-card__icon disabled" ]
                                            [ div []
                                                [ div [ class "icon__indicator " ] []
                                                , div [ style [ ( "color", "#E8ECEF" ) ] ] [ text "Patient Satis..." ]
                                                ]
                                            ]
                                        , div [ class "metric-card__icon disabled" ]
                                            [ div []
                                                [ div [ class "icon__indicator" ] []
                                                , div [ style [ ( "color", "#E8ECEF" ) ] ] [ text "Readmits" ]
                                                ]
                                            ]
                                        ]
                                    ]
                                , div [ class "metric-card", style [ ( "display", "flex" ) ] ]
                                    [ div [ class "metric-card__section metric-card__name" ]
                                        [ h4 [] [ text "Growth" ]
                                        , p [ style [ ( "color", "#5A65F7" ) ] ] [ text "Ranked 13th Overall" ]
                                        , div [ class "trophy-four" ] []
                                        ]
                                    , div [ class "metric-card__section metric-card__controls" ]
                                        [ div [ class "metric-card__icon disabled" ]
                                            [ div []
                                                [ div [ class "icon__indicator " ] []
                                                , div [ style [ ( "color", "#E8ECEF" ) ] ] [ text "Denials" ]
                                                ]
                                            ]
                                        , div [ class "metric-card__icon disabled" ]
                                            [ div []
                                                [ div [ class "icon__indicator" ] []
                                                , div [ style [ ( "color", "#E8ECEF" ) ] ] [ text "Turnover" ]
                                                ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    , div [ class "row animated fadeInUp" ]
                        [ div [ class "row" ]
                            [ div [ class "mixer col-xs-8" ]
                                [ div
                                    [ style
                                        [ ( "display", "flex" )
                                        , ( "flexDirection", "column" )
                                        ]
                                    ]
                                    [ input
                                        [ type_ "range"
                                        , attribute "orient" "vertical"
                                        , Attrs.min "1"
                                        , Attrs.max "10"
                                        , value (toString model.sepsisScore)
                                        , step "1"
                                        , onInput ScoreChange
                                        ]
                                        []
                                    , h5 [ style [ ( "textAlign", "center" ) ] ] [ text (toString (10 * model.sepsisScore)) ]
                                    , h6 [ style [ ( "textAlign", "center" ) ] ] [ text "Composite Score" ]
                                    ]
                                , div
                                    [ style
                                        [ ( "display", "flex" )
                                        , ( "flexDirection", "column" )
                                        ]
                                    ]
                                    [ input
                                        [ type_ "range"
                                        , attribute "orient" "vertical"
                                        , Attrs.min "1"
                                        , Attrs.max "5"
                                        , Attrs.property "disabled" (bool True)
                                        , step "1"
                                        , value (toString <| nearestHalf <| genderScale model.sepsisScore)
                                        ]
                                        []
                                    , h5 [ style [ ( "textAlign", "center" ) ] ] [ text ("5:" ++ (toString (nearestHalf <| genderScale <| model.sepsisScore))) ]
                                    , h6 [ style [ ( "textAlign", "center" ) ] ] [ text "Ratio of Female Patients" ]
                                    ]
                                , div
                                    [ style
                                        [ ( "display", "flex" )
                                        , ( "flexDirection", "column" )
                                        ]
                                    ]
                                    [ input
                                        [ type_ "range"
                                        , attribute "orient" "vertical"
                                        , Attrs.min "0"
                                        , Attrs.max "1"
                                        , Attrs.property "disabled" (bool True)
                                        , step "1"
                                        , value (toString <| nearestHalf <| acuityScale model.sepsisScore)
                                        ]
                                        []
                                    , h5 [ style [ ( "textAlign", "center" ) ] ] [ text (acuityRating <| (nearestHalf <| acuityScale <| model.sepsisScore)) ]
                                    , h6 [ style [ ( "textAlign", "center" ) ] ] [ text "Intensity" ]
                                    ]
                                , div []
                                    [ input
                                        [ type_ "range"
                                        , attribute "orient" "vertical"
                                        , Attrs.min (toString <| nearestHalf <| skillMix 1)
                                        , Attrs.max (toString <| nearestHalf <| skillMix 10)
                                        , Attrs.property "disabled" (bool True)
                                        , value (toString <| nearestHalf <| skillMix model.sepsisScore)
                                        ]
                                        []
                                    , h5 [ style [ ( "textAlign", "center" ) ] ] [ text ("21: " ++ (toString <| nearestHalf <| skillMix <| model.sepsisScore)) ]
                                    , h6 [ style [ ( "textAlign", "center" ) ] ] [ text "RN to Tech Ratio" ]
                                    ]
                                ]
                            , div [ class "graph col-xs-4" ]
                                [ h3 [] [ text "Projected Growth" ]
                                , canvas [ id "canvas", Attrs.height 100, Attrs.width 100 ] []
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initModel, view = view, update = update }
