class CoursesController < ApplicationController
    def index
      @planned_courses = Course.where("id == 3 OR id == 4")
    end

    def create
      @course = Course.new(course_params)

      if @course.save
        render json: @course
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @course = Course.find(params[:id])
      @course.destroy
      head :no_content
    end

   def update
        @course = Course.find(params[:id])
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
