Stocker.Search = Backbone.Model.extend({

  url: '/photos/from/tags'

  initialize: ()->
    @set(collection: null)

  submit: ()->
    self = @
    self.collection = new Stocker.Tags()
    _.each $('.token-input-token-facebook'), (model)->
       self.collection.add(title: $(model).find('p').html())

    @tags()

  tags: ()->
    tags = @collection#.where({state: 'remove'})
    @set(tags: tags)
    @save tags: tags, 
      success: (model, response, options)->
        Stocker.photos.remove()
        Stocker.spinner.spin($('.photos'))
        collection = new Stocker.Photos(response)
        Stocker.photos = new Stocker.PhotosView(collection: collection)
        Stocker.photos.render()

})
