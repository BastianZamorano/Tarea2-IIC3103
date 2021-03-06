class CommentsController < ApplicationController
  before_action :set_json
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :set_post


  # GET /comments
  def index
    @comments = @post.comments.all
    render json: @comments
  end

  # GET /comments/1
  def show
    @comment = Comment.find(params[:id])
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
  
    @comment.post = @post
   
      if @comment.save
        render json: @comment, status: :created
      else  
        render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    render json: @comment
    @comment.destroy
  end

  private

    def set_json
      response.headers["Content-Type"]="application/json"
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.permit(:author, :comment)
    end
end
