module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import DOM (DOM())
import DOM.HTML (window)
import DOM.HTML.Types (htmlDocumentToDocument)
import DOM.HTML.Window (document)
import Data.Foreign (ForeignError, readString, toForeign)
import Data.Foreign.Index (index)
import Data.Maybe (fromJust, fromMaybe)
import Data.List.NonEmpty (NonEmptyList)
import DOM.Node.NonElementParentNode (getElementById)
import DOM.Node.Types (ElementId(..), documentToNonElementParentNode)
import Partial.Unsafe (unsafePartial)
import React (ReactClass, ReadWrite, ReactState, Event, ReactThis,
              createFactory, readState, spec, createClass, writeState)
import React.DOM as D
import React.DOM.Props as P
import ReactDOM (render)


newtype AppState = AppState
  { errors :: Array String
  }

initialState :: AppState
initialState = AppState
  { errors: []
  }


mainContent :: forall props. ReactClass props
mainContent = createClass $ spec initialState \ctx -> do
  pure $
    D.div [ P.className "container" ]
          [ D.div [ P.className "row" ]
                  [ D.form [ P.className "form-horizontal" ] $
                           [ D.h3' [ D.text "CHSS Blog" ] ]
          ]
          ]

main :: Eff ( console :: CONSOLE
            , dom :: DOM
            ) Unit
main = void do
  log "Hello CHSS community!"
  let component = D.div [] [ createFactory mainContent unit ]
  doc <- window >>= document
  ctr <- getElementById (ElementId "main") (documentToNonElementParentNode (htmlDocumentToDocument doc))
  render component (unsafePartial fromJust ctr)

