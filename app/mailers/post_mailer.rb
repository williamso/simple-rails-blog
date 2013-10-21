class PostMailer < ActionMailer::Base
  default to: "founders@hunterco.com.br"
  default from: "notification@hunterco.com.br"

  def new_post(post)
    @post = post
    mail(subject: "Nova oportunidade: #{@post.id} - #{@post.title}")
  end
end
