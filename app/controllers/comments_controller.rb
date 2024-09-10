# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
    before_action :authenticate_request
    before_action :set_comment, only: [:update, :destroy]
    before_action :set_post, only: [:create]
  
    # POST /posts/:post_id/comments
    def create
      @comment = @post.comments.new(comment_params)
      @comment.user = @current_user
  
      if @comment.save
        render json: @comment, status: :created
      else
        render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /comments/:id
    def update
      if @comment.user == @current_user
        if @comment.update(comment_params)
          render json: @comment, status: :ok
        else
          render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  
    # DELETE /comments/:id
    def destroy
      if @comment.user == @current_user
        @comment.destroy
        head :no_content
      else
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  
    private
  
    def set_comment
      @comment = Comment.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Comment not found" }, status: :not_found
    end
  
    def set_post
      @post = Post.find(params[:post_id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Post not found" }, status: :not_found
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end
  