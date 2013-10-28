class PostMailer < ActionMailer::Base
  default to: "founders@hunterco.com.br"
  default from: "notification@hunterco.com.br"

  def new_post(post)
    @post = post
    mail(subject: "Nova oportunidade: #{@post.id} - #{@post.title}")
  end

  def new_candidato(candidato)
    @candidato = candidato
    mail(subject: "Nova candidatura: #{@candidato.post_id} - #{@candidato.name}")
  end
end
