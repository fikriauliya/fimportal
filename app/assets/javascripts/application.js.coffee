#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require_tree .
#= require s3_direct_upload
jQuery ->
  $("#myS3Uploader").S3Uploader()
  
  $('#myS3Uploader').bind "s3_upload_failed", (e, content) ->
    alert("#{content.filename} gagal diunggah. Pastikan ukuran file tidak melebihi spesifikasi")
