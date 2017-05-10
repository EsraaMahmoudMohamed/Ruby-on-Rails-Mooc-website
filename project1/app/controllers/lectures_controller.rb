class LecturesController < ApplicationController

  before_action :set_lecture, only: [:show, :edit, :update, :destroy, :add_to_fav, :delete_from_fav]

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  
  def show
      @comments=Comment.where(lecture_id: @lecture).order("created_at DESC")
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
  end

  # GET /lectures/1/edit
  def edit
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_fav
  current_user.lectures << @lecture
  current_user.save
  redirect_to lectures_path
  end

def delete_from_fav
  current_user.lectures.delete(@lecture)
  current_user.save
  redirect_to lectures_path
end

def upvote
@lecture = Lecture.find(params[:id])
@lecture.upvote_by current_user
  redirect_to @lecture
end

def downvote
@lecture = Lecture.find(params[:id])
  @lecture.downvote_by current_user
  redirect_to @lecture
end


def spam
@lecture = Lecture.find(params[:id])
@lecture.upvote_by current_user
  redirect_to @lecture
end

def unspam
@lecture = Lecture.find(params[:id])
  @lecture.downvote_by current_user
  redirect_to @lecture
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id, :user_id)
    end
end
