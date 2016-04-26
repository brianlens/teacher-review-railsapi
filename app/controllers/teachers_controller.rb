class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
    render json: { teachers:@teachers }
  end

  def create
    @teacher = Teacher.new
    if @teacher.save
      render json: { teacher:@teacher, location: teacher_url(@teacher)}, status: 201
    else
      render json: { errors: @teacher.errors }, status:422
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
    render json: { teacher:@teacher }
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      render json: { teacher:@teacher }, status: 202
    else
      render json: { errors:@teacher.errors }, status:422
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    if @teacher.destroy
      render json: { teacher: nil }
    else
      render json: { errors:@teacher.errors }
    end
  end

  protected

    def teacher_params
      params.require(:teacher).permit(:name, :nickname, :subject, :school)
    end
end
