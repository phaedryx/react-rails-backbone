{section, header, footer, div} = React.DOM
{form, input, label, button}   = React.DOM
{h1, ul, li}                   = React.DOM

# Todo = Backbone.Model.extend
#   defaults:
#     title: ''
#     completed: false

#   toggle: -> @save(completed: !@get('completed'))

# TodoList = Backbone.Collection.extend
#   model: Todo

#   localStorage: new Store('todos-react-backbone')

#   completed: ->
#     @filter( (todo) -> todo.get('completed') )

#   remaining: ->
#     @without.apply(this, @completed())

#   nextOrder: ->
#     return 1 if !@length
#     @last().get('order') + 1

#   comparator: (todo) -> todo.get('order')


TodoApp = React.createClass
  render: ->
    section id: 'todo-app',
      header id: 'todo-header',
        h1 {},
          "todos"
        form className: 'form-horizontal', role: 'form',
          div className: 'form-group',
            label for: 'new-todo', className: 'col-sm-1 control-label',
              'Task'
            div className: 'col-sm-9',
              input id: 'new-todo', className: 'form-control', placeholder: 'What needs to be done?'
            button className: 'btn btn-primary col-sm-2',
              'submit'
      footer id: 'todo-footer',
        "footer"

window.TodoApp = TodoApp
