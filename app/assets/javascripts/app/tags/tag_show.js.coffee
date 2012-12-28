Stocker.TagShow = Backbone.View.extend({

  render: ()->
    self = @

    $('.tags-in-use').tokenInput "/tags?create=false",
      theme: 'facebook'
      onAdd: ()->
        self.searchTags()
      onDelete: ()->
        self.searchTags()

  searchTags: ()->
    search = new Stocker.Search(collection: @collection)
    search.submit()

  #className: 'token-input-token-facebook'
  #tagName: "li"

  #initialize: ()->
    #@model.bind('destroy', @remove, @)

  #events:
    #"click .tag-wrap" : "moveTag"

  #render: (list='.available-tags', state='tag')->
    #self = @
    #@model.set 'state', state

    #template = Handlebars.compile($('#tag-template').html())
    #@.$el.html template(self.model.attributes)
    #$(list).append self.el

    #@el

  #moveTag: ()->
    #@remove()
    #if @model.get('state') == 'tag'
      #@render('.tags-in-use', 'remove')
    #else
      #@render()
    #@delegateEvents()
    #@searchTags()

})
