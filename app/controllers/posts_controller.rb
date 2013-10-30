class PostsController < ApplicationController
  #before_filter :authenticate, :except => [:index, :show, :search]
  
  # GET /posts
  # GET /posts.json
  def index
    
     #if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").page(params[:page])
    #else
      #@posts = Post.where("status = true").order("created_at DESC").page(params[:page])
      #@posts = Post.all
    #end 

    @post = Post.new
    #@post = Post.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        PostMailer.new_post(@post).deliver
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def success
    @candidato = Candidato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidato }
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  # GET /posts/search/name
  # GET /posts/search/name.json
  def search
    @posts = Post.where("status = true and name = ?", params[:name]).order("created_at DESC").page(params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def apply
    if params[:candidato]
      @candidato = Candidato.new(candidato_params)

      respond_to do |format|
        if @candidato.save
          PostMailer.new_candidato(@candidato).deliver
          format.html { redirect_to @candidato, notice: 'Você candidatou-se com sucesso!' }
          format.json { render json: @candidato, status: :created, location: @candidato }
        else
          format.html { render action: "apply" }
          format.json { render json: @candidato.errors, status: :unprocessable_entity }
        end
      end
    else
      @candidato = Candidato.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @candidato }
      end
    end
  end

  private
  
  def authenticate
    authenticate_or_request_with_http_basic do |admin_name, password|
      (admin_name == 'root' && password == 'pass') ||
      (admin_name == 'rt' && password == 'ps')
    end
  end

  def post_params
    params.require(:post).permit(:title, :name, :email, :body)
  end

  def candidato_params
    params.require(:candidato).permit(:post_id, :name, :email, :urllinkedin)
  end
end
