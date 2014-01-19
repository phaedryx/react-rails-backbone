{div, h1, input} = React.DOM

Hello = React.createClass(
  mixins: [mixin.BackboneBinding]

  getDefaultProps: ->
    Message = Backbone.Model.extend({})
    {message: new Message({text: "World!"})}

  getBackBoneModels: -> [@props.message]

  render: ->
    div {},
      h1 {},
        "Hello #{@props.message.get('text')}"
      input type: 'text', valueLink: @bindTo(@props.message, 'text')
)

window.Hello = Hello
