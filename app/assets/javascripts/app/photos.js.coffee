# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ()->
  Stocker.init()

  uploader = new qq.FineUploaderBasic(
    button: $("#uploader")[0]
    request:
      endpoint: "/photo_uploaders"
      params:
        authenticity_token: $('meta[name="csrf-token"]').attr('content')
    callbacks:
      onComplete: (id, fileName, responseJSON)-> 
        photo = new Stocker.Photo(responseJSON)
        view = new Stocker.PhotoShow(model: photo)
        view.render()
  )

