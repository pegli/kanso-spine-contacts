require('app/lib/setup')

Spine    = require('spine/core')
Contacts = require('app/controllers/contacts')

require('spine/route')

class App extends Spine.Controller
  constructor: ->
    super
    @contacts = new Contacts
    @append @contacts

    Spine.Route.setup()

module.exports = App