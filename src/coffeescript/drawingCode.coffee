createNewFunction = (name) ->
    ($ "body").append """
        <div class="ui-widget-content function">
            <div class="spacer">
                Function #{name}
            </div>
        </div>
    """
createNewPlaceholder = (name) ->
    ($ ".toolBox").append """
        <div class="ui-widget-content placeholder">
            <div class="spacer">
                Function #{name}
            </div>
        </div>
    """

createNewArrow = () ->
    arrowIsStarted = false
    
    
    
createNewPlaceholder "foo"
createNewPlaceholder "bar"

arrowIsStarted = false
arrowStart = null
($ ".function").click( (event) ->
    ($ "body").append "Function was clicked"

    if arrowIsStarted
        createNewArrow()
    else
        arrowIsStarted = true
        arrowStart = ($ this)
)

($ ".placeholder").click( (event) ->
    createNewFunction("test")
    ($ ".function").draggable()
)

($ ".function").draggable()
