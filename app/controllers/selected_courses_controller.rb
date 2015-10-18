class SelectedCoursesController < ApplicationController
    def index
      @selected_courses = SelectedCourse.all
    end

    def create
      @course = SelectedCourse.new(course_params)

      if @course.save
        render json: @course
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @course = SelectedCourse.find(params[:id])
      @course.destroy
      head :no_content
    end

   def update
        @course = SelectedCourse.find(params[:id])
        if @course.update(course_params)
          render json: @course
        else
          render json: @course.errors, status: :unprocessable_entity
        end
      end

    private

      def course_params
        params.require(:course).permit(:title, :amount, :date)
      end

end
