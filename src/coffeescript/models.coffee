###
models.coffee v0.1

The base models for function creation.
This is based on the step-based model.

Released under the MIT License.
###



### Basic Models ###

class Input
    constructor: (@name, @default, @edges=[]) ->

    addEdge: (edge) ->
        @edges.push(edge)

class Edge
    constructor: (@end=None, @validator=baseValidator, @queue=[]) ->

    call: (input) ->
        if @validator(input)
            @end.call input


class Function
    constructor: (@name, @details, @inputs) ->


class Vertex
    constructor: (@outputs=[]) ->


class Step extends Vertex
    constructor: (outputs, @instanceOf) ->


class Variable extends Vertex
    ### Currently only has a get method. Will change. ###

    constructor: (@value) ->
        # Creates the variable with the given value.

    # NOTE: avoid for now. Variables are constants.
    set: (@value) ->
        # Sets the value to the input.

    get: ->
        # Retrieve the value of the variable
        @value

    # Set the call method to the get method.
    @.prototype.call = @.prototype.get



### Old Code ###

class OldPath
    constructor: (@start, @end, @validator=baseValidator) ->

    call: (input) ->
        if @validator(input)
            @end.call input


class OldProcess
    constructor: (@paths=[], @function) ->

    addPath: (end) ->
        @paths.push new Path(@, end)

    call: (input) ->
        output = @function.call input
        if @paths.length is 0
            output
        for path in @paths
            path.call output


class OldFunction
    ###
    A process is a Step connected to other Steps that can be run as a procedure
    and in turn be a Step.
    ###
    constructor: (@start, @name, @description) ->

    call: (input) ->
        console.log "Running function #{ @name }."
        @start.call input