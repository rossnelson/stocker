Stocker.Photos = Backbone.Collection.extend({
  #url: '/photos'

  render: ()->
    @each (model)->
      view = new Stocker.PhotoShow(model: model)
      view.render()
  
})
