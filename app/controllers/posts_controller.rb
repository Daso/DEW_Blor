class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_blog
  
  respond_to :html
  # GET /posts
  # GET /posts.json
  def index
    @posts = @blog.posts
    respond_with(@blog, @posts)
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    respond_with(@blog, @post)
  end

  # GET /posts/new
  def new
    @post = @blog.posts.new
    respond_with(@blog, @post)
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @blog.posts.new(post_params)
    @post.save
    respond_with(@blog)
     
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
   @post.update(post_params)
   respond_with(@blog)
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_with(@blog)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_blog
      @blog = Blog.find(params[:blog_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :blog_id)
    end
end
