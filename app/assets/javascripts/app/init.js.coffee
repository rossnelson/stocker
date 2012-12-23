window.Stocker = 
  Photos: {}
  init: ()->
    new Stocker.Router()
    Backbone.history.start({ pushState: true })
    @

Stocker.Router = Backbone.Router.extend(
  routes:
    "bulk/photo/upload" : "index"

  index: ()->
    #photos = new Stocker.Photos(window.photos)
    #photos.render()
    @
)

