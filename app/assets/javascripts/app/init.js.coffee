window.Stocker = 
  Photos: {}
  Tags: {}
  init: ()->
    new Stocker.Router()
    Backbone.history.start({ pushState: true })
    @

Stocker.Router = Backbone.Router.extend(
  routes:
    "photos" :  "search"
    ""       :  "search"

  search: ()->
    tags = new Stocker.TagShow()
    tags.render()
    collection = new Stocker.Photos(window.photos)
    Stocker.photos = new Stocker.PhotosView(collection: collection)
    Stocker.photos.render()

)

# Spinner Init
opts =
  lines: 11 # The number of lines to draw
  length: 0 # The length of each line
  width: 3 # The line thickness
  radius: 6 # The radius of the inner circle
  corners: 1 # Corner roundness (0..1)
  rotate: 0 # The rotation offset
  color: "#000" # #rgb or #rrggbb
  speed: 0.9 # Rounds per second
  trail: 42 # Afterglow percentage
  shadow: false # Whether to render a shadow
  hwaccel: false # Whether to use hardware acceleration
  className: "spinner" # The CSS class to assign to the spinner
  zIndex: 2e9 # The z-index (defaults to 2000000000)
  top: "auto" # Top position relative to parent in px
  left: "auto" # Left position relative to parent in px
Stocker.spinner = new Spinner(opts)
