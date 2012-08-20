Spine   = require('spine/core')
Contact = require('app/models/contact')
$       = Spine.$

Main    = require('app/controllers/contacts_main')
Sidebar = require('app/controllers/contacts_sidebar')

class Contacts extends Spine.Controller
  className: 'contacts'

  constructor: ->
    super

    @sidebar = new Sidebar
    @main    = new Main

    @routes
      '/contacts/:id/edit': (params) -> 
        @sidebar.active(params)
        @main.edit.active(params)
      '/contacts/:id': (params) ->
        @sidebar.active(params)
        @main.show.active(params)

    @append @sidebar, @main

    Contact.fetch()

module.exports = Contacts