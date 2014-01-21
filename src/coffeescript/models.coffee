###
models.coffee v0.1

The base models for function creation.

Released under the MIT License.
###

baseValidator = -> true

class Path
    constructor: (@start, @end, @validator=baseValidator) ->

    call: (input) ->
        if @validator(input)
            @end.call input


class Step
    constructor: (@paths=[], @function) ->

    addPath: (end) ->
        @paths.push new Path(@, end)

    call: (input) ->
        output = @function.call input
        if @paths.length is 0
            output
        for path in @paths
            path.call output


class Function
    ###
    A process is a Step connected to other Steps that can be run as a procedure
    and in turn be a Step.
    ###
    constructor: (@start, @name, @description) ->

    call: (input) ->
        console.log "Running function #{ @name }."
        @start.call input