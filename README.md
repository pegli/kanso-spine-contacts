kanso-spine-contacts
====================

Spine Contacts is an example application for the [Spine](http://spinejs.com/) JavaScript
library.  This version of the app has been modified to work with [kanso](http://kan.so/),
the application builder for [Apache CouchDB](http://couchdb.apache.org/).

##Live Demo

Check out the [live demo](http://pegli.iriscouch.com/contacts/_design/contacts/_rewrite/)
on Iris Couch ([http://iriscouch.com/](http://iriscouch.com)).

##Usage

1. Checkout the Git repository 
1. Install the dependencies: `kanso update`
1. Push to your local CouchDB server: `kanso push http://admin:password@localhost:5984/contacts`
1. Open the app in the browser: [http://localhost:5984/contacts/\_design/contacts/\_rewrite](http://localhost:5984/contacts/_design/contacts/_rewrite)
1. Check out app/controllers and app/models to see how everything works
