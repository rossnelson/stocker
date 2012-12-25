Stocker.PhotoShow = Backbone.View.extend({

  className: 'photo-wrap'

  initialize: ()->
    @model.bind('destroy', @remove, @)
    @model.bind('change', @spinnerInit, @)

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
    @tagsInit() 
    @serverStatus = @.$el.find('.server-status')[0]
    @el

  trash: ()->
    @model.destroy()

  tagsInit: ()->
    @.$el.find('#tag_list').tokenInput "/tags",
      theme: 'facebook'

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
          self.killSpinner()
        onProgress: (id, fileName, uploadedBytes, totalBytes)->
          self.spinnerInit()

  submitForm: ()->
    self = @
    attrs =
      title: @.$el.find('input[name="title"]').val()
      source: @.$el.find('select[name="source"]').val()
      tag_list: @.$el.find('input[name="tag_list"]').val()
    @model.save(attrs, {success: ()->
      self.killSpinner()
    })

  spinnerInit: ()->
    self = @
    $(@serverStatus).html('')
    Stocker.spinner.spin(self.serverStatus)

  killSpinner: ()->
    Stocker.spinner.stop()
    $(@serverStatus).html('<i class="icon-ok-circle"></i> </a>')

})


