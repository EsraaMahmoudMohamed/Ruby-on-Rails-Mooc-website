class CommentsController < InheritedResources::Base

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id =current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :lecture_id)
    end

    def find_lecture
      @lecture =Lecture.find(params[:lecture_id])
    end
end
