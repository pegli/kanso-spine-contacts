Spine   = require('spine/core')
Contact = require('app/models/contact')
List    = require('spine/list')
$       = Spine.$

handlebars = require('handlebars')

class Sidebar extends Spine.Controller
  className: 'sidebar'

  elements:
    '.items': 'items'
    'input[type=search]': 'search'

  events:
    'keyup input[type=search]': 'filter'
    'click footer button': 'create'

  constructor: ->
    super
    # Render initial view
    @html handlebars.templates['sidebar.html']()

    # Setup a Spine List
    @list = new List
      el: @items
      template: (items) ->
        result = (handlebars.templates['item.html'](item) for item in items)
        result.join('\n')
      selectFirst: true

    @list.bind 'change', @change

    @active (params) -> 
      @list.change(Contact.find(params.id))

    Contact.bind('refresh change', @render)

  filter: ->
    @query = @search.val()
    @render()

  render: =>
    contacts = Contact.filter(@query)
    @list.render(contacts)

  change: (item) =>
    @navigate '/contacts', item.id

  create: ->
    item = Contact.create()
    @navigate('/contacts', item.id, 'edit')

module.exports = Sidebar