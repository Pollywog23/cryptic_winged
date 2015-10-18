#= require active_admin/base
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl

jQuery ->
  $('.edit_gallery').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('.edit_gallery').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        file = data.files[0].name
        data.context.find('.progress-bar .sr-only').text(file + ' - ' + progress + '%')
        data.context.find('.progress-bar').css('width', progress + '%')
        if progress == 100
          data.context.find('.progress').removeClass('active')
