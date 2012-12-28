Stocker.Search = Backbone.Model.extend({

  url: '/photos/from/tags'

  initialize: ()->
    @collection = @get('collection')
    @set(collection: null)

  submit: ()->
    @tags()

  tags: ()->
    tags = @collection.where({state: 'remove'})
    @set(tags: tags)
    @save tags: tags, 
      success: (model, response, options)->
        Stocker.photos.remove()
        Stocker.spinner.spin($('.photos'))
        collection = new Stocker.Photos(response)
        Stocker.photos = new Stocker.PhotosView(collection: collection)
        Stocker.photos.render()

})
