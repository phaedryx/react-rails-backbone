# This is based on code from this blog post:
# http://eldar.djafarov.com/2013/11/reactjs-mixing-with-backbone/
BackboneBinding =
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

window.mixin ?= {}
window.mixin.BackboneBinding = BackboneBinding
