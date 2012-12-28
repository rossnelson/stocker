Stocker.PhotosView = Backbone.View.extend({

  el: 'photos'

  initialize: ->
    @collection.on('reset', @render, @)

  render: ()->
    $('.photos').html('')
    @collection.each(@appendPhoto)

  appendPhoto: (photo)->
    view = new Stocker.PhotoTeaser(model: photo)
    $('.photos').append(view.renderIndex())

})
