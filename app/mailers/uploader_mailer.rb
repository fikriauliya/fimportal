class UploaderMailer < ActionMailer::Base
  default from: "no.reply.fim@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.uploader_mailer.photo_uploaded.subject
  #
  def photo_uploaded(receiver_email)
    mail to: receiver_email, subject: "[FIM] Pemberitahuan: Foto sudah diunggah"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.uploader_mailer.recommendation_letter_uploaded.subject
  #
  def recommendation_letter_uploaded(receiver_email)
    mail to: receiver_email, subject: "[FIM] Pemberitahuan: Surat rekomendasi sudah diunggah"
  end
end
