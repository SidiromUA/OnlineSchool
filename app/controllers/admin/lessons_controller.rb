class Admin::LessonsController < Admin::BaseController
  add_breadcrumb "Заняття", :admin_lessons_path

  before_action :set_course
  before_action :set_lesson, only: [:edit, :update, :destroy]

  def index
    @lessons = @course.lessons.order(id: :asc).page(params[:page])
  end
 
  def new
    add_breadcrumb "Нове заняття", [:new, :admin, @course, :lesson]

    @lesson = @course.lessons.build
  end

  def create
    @lesson = @course.lessons.build(lesson_params)

    if @lesson.save
      redirect_to [:admin, @course, @lessons], notice: 'Заняття успішно доданий'
    else 
      add_breadcrumb "Нове заняття", [:new, :admin, @course, :lesson]

      flash.now[:alert] = 'Не вдалося створити заняття'
      render :new 
    end
  end

  def edit
    add_breadcrumb "Редагувати #{@lesson.name}", [:edit, :admin, @course, @lesson]
  end
  
  def update 
    if @lesson.update(lesson_params)
      redirect_to [:admin, @course, @lessons], notice: 'Заняття успішно змінено'
    else 
      add_breadcrumb "Редагувати #{@lesson.name}", [:edit, :admin, @course, @lesson]

      flash.now[:alert] = 'Не вдалося змінити заняття'
      render :edit
    end
  end

  def destroy
    if @lesson.destroy
      redirect_to [:admin, @course, @lessons], notice: 'Заняття успішно видалено'
    else
      redirect_to [:admin, @course, @lessons], alert: 'Не вдалось видалити заняття'
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
    add_breadcrumb "Курси", :admin_courses_path
    add_breadcrumb @course.name, [:admin, @course, :lessons]
  end

  def set_lesson
    @lesson = Lesson.find(params[:id]) 
  end

  def set_active_main_menu_item
    @main_menu[:courses][:active] = true
  end

  def lesson_params
    params.require(:lesson).permit(:name, :description)
  end
end
