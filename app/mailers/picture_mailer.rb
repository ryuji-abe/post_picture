class PictureMailer < ApplicationMailer
  def picture_mail(post_picture)
   @post_picture = post_picture
   user_info = User.find(@post_picture.user_id)
   user_email = user_info.email

   mail to: user_email, subject: "投稿完了メール"
  end
end
