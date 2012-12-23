Stocker.PhotoShow = Backbone.View.extend({

  className: 'photo-wrap'

  initialize: ()->
    @model.bind('destroy', @remove, @)

  events:
    "click .remove"   : "trash"
    "focusout input" : "submitForm"
    "change #source" : "submitForm"

  render: ()->
    self = @
    template = Handlebars.compile($('#photo-template').html())
    window.model = @model
    @.$el.html template(self.model.attributes)
    $('.photos').prepend self.el
    @uploaderInit()
    @el

  trash: ()->
    @model.destroy()

  uploaderInit: ()->
    self = @
    new qq.FineUploaderBasic
      button: @.$el.find("#uploader")[0]
      multiple: false
      request:
        endpoint: "/usage_right_uploaders"
        params:
          authenticity_token: $('meta[name="csrf-token"]').attr('content')
          photo_id: @model.id
      callbacks:
        onComplete: (id, fileName, responseJSON)-> 
          self.$el.find('#uploader').html(responseJSON.filename)

  submitForm: ()->
    @model.set('title', @.$el.find('input[name="title"]').val())
    @model.set('source', @.$el.find('select[name="source"]').val())
    @model.set('tag_list', @.$el.find('input[name="tag_list"]').val())
    @model.save()

})


