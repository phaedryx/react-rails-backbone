{section, header, footer, div} = React.DOM
{form, input, label, button}   = React.DOM
{h1, ul, li}                   = React.DOM

TodoApp = React.createClass
  render: ->
    section id: 'todo',
      header id: 'todo-header',
        h1 {},
          "todos"
        form className: 'form-horizontal', role: 'form',
          div className: 'form-group',
            label for: 'new-todo', className: 'col-sm-1 control-label',
              'Task'
            div className: 'col-sm-9',
              input id: 'new-todo', className: 'form-control', placeholder: 'What needs to be done?'
            button className: 'btn btn-default col-sm-2',
              'submit'
      footer id: 'todo-footer',
        "footer"

window.TodoApp = TodoApp
