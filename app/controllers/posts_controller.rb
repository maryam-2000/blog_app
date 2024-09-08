class PostsController < ApplicationController
    before_action :authenticate_request
    before_action :set_post, only: [:show, :update, :destroy]
    before_action :authorize_post, only: [:update, :destroy]
  
    # GET /posts
    def index
      @posts = Post.all
      render json: @posts
    end
  
    # GET /posts/:id
    def show
      render json: @post
    end
  
    # POST /posts
    def create
      @post = @current_user.posts.build(post_params)
      if @post.save
        render json: @post, status: :created
        DeletePostJob.set(wait: 24.hours).perform_later(@post.id)
      else
        render json: { error: @post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PUT /posts/:id
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: { error: @post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /posts/:id
    def destroy
      @post.destroy
      head :no_content
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :body, :tags)
    end
  
    def set_post
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Post not found' }, status: :not_found
    end
  
    def authorize_post
      unless @post.user_id == @current_user.id
        render json: { error: 'Not authorized' }, status: :unauthorized
      end
    end
  end
  