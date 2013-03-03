#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require s3_direct_upload
#= require footable/footable-0.1.js

jQuery ->
  $("#myS3Uploader").S3Uploader()
  
  $('#myS3Uploader').bind "s3_upload_failed", (e, content) ->
    alert("#{content.filename} gagal diunggah. Pastikan ukuran file tidak melebihi spesifikasi")
