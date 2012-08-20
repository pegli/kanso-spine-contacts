Spine = require('spine/core')

require("spine-adapter/couch-ajax")

class Contact extends Spine.Model
  # Configure name & attributes
  @configure 'Contact', 'name', 'email'

  # Persist with Local Storage
  @extend Spine.Model.CouchAjax

  @filter: (query) ->
    return @all() unless query
    query = query.toLowerCase()
    @select (item) ->
      item.name?.toLowerCase().indexOf(query) isnt -1 or
        item.email?.toLowerCase().indexOf(query) isnt -1

module.exports = Contact