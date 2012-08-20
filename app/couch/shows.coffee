templates = require('duality/templates')

exports.index = (doc, req) ->
  title: 'Contacts'
  content: templates.render('index.html', req, {})

exports.show = (doc, req) ->
  return templates.render('show.html', req, doc)