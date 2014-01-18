{div, h1, input} = React.DOM

ModelMixin =
  __syncedModels: []
  componentDidMount: ->
    @getBackBoneModels().forEach(@injectModel, this)
  componentWillUnmount: ->
    @__syncedModels.forEach(
      (model) -> model.off(null, model.__updater, this),
      this
    )
  injectModel: (model) ->
    if(!~this.__syncedModels.indexOf(model))
      updater = @forceUpdate.bind(this, null)
      model.__updater = updater
      model.on('add change remove', updater, this)
  bindTo: (model, key) ->
    {
      value: model.get(key)
      requestChange: (value) => model.set(key, value)
    }

Hello = React.createClass(
  mixins: [ModelMixin]
  getDefaultProps: ->
    Message = Backbone.Model.extend({})
    message = new Message({text: "World!"})
    {message: message}
  getBackBoneModels: -> [@props.message]
  render: ->
    div {},
      h1 {},
        "Hello #{@props.message.get('text')}"
      input type: 'text', valueLink: @bindTo(@props.message, 'text')
)

window.Hello = Hello
