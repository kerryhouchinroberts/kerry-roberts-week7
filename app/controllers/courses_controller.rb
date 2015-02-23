class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path, notice: 'Course was successfully created'
    else
      flash.now[:alert] = @course.errors.full_messages
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(course_params)
      redirect_to courses_path, notice: 'Course was successfully updated'
    else
      flash.now[:alert] = @course.errors.full_messages
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to courses_path, notice: 'Course was successfully deleted'
    end
  end

  def course_params
    params.require(:course).permit(:title, :day_night)
  end

end
