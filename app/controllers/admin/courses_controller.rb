class Admin::CoursesController < Admin::BaseController
  add_breadcrumb "Курси", :admin_courses_path

  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.order(id: :desc).page(params[:page])
  end
 
  def new
    add_breadcrumb "Новий курс", new_admin_course_path

    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to admin_courses_path, notice: 'Курс успішно доданий'
    else 
      add_breadcrumb "Новий курс", new_admin_course_path

      flash.now[:alert] = 'Не вдалося створити курс'
      render :new
    end
  end

  def edit
    add_breadcrumb "Редагувати #{@course.name}", [:edit, :admin, @course]
  end
 
  def update 
    if @course.update(course_params)
      redirect_to admin_courses_path, notice: 'Курс успішно змінено'
    else 
      add_breadcrumb "Редагувати #{@course.name}", [:edit, :admin, @course]

      flash.now[:alert] = 'Не вдалося змінити курс'
      render :edit
    end
  end

  def destroy
    if @course.destroy
      redirect_to admin_courses_path, notice: 'Курс успішно видалено'
    else
      redirect_to admin_courses_path, alert: 'Не вдалось видалити курс'
    end
  end

  def order
    @course = Course.new
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_active_main_menu_item
    @main_menu[:courses][:active] = true
  end

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
