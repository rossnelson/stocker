Stocker.PhotoTeaser = Backbone.View.extend({

  className: 'photo'

  renderIndex: ()->
    self = @
    template = Handlebars.compile($('#photo-teaser').html())
    @.$el.html template(self.model.attributes)
    @el

})
