Spine   = require('spine/core')
Contact = require('app/models/contact')
$       = Spine.$

handlebars = require('handlebars')

class Show extends Spine.Controller
  # Set the HTML class
  className: 'show'

  events:
    'click .edit': 'edit'

  constructor: ->
    super

    # Bind the change() callback
    # to the *active* event
    @active @change

  render: ->
    # Render a template, replacing the 
    # controller's HTML
    @html handlebars.templates['show.html'](@item)

  change: (params) =>
    @item = Contact.find(params.id)
    @render()

  edit: ->
    # Navigate to the 'edit' view whenever
    # the edit link is clicked
    @navigate('/contacts', @item.id, 'edit')


class Edit extends Spine.Controller
  className: 'edit'

  events:
    'submit form': 'submit'
    'click .save': 'submit'
    'click .delete': 'delete'

  elements: 
    'form': 'form'

  constructor: ->
    super
    @active @change

  render: ->
    @html handlebars.templates['form.html'](@item)

  change: (params) =>
    @item = Contact.find(params.id)
    @render()

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(@form).save()
    @navigate('/contacts', @item.id)

  delete: ->
    @item.destroy() if confirm('Are you sure?')


class Main extends Spine.Stack
  controllers:
    show: Show
    edit: Edit

module.exports = Main