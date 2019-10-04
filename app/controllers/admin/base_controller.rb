class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :set_main_menu, expect: :destroy
  before_action :set_active_main_menu_item, expect: :destroy

  private
  def set_main_menu
    @main_menu = { teachers: { name: 'Teachers', path: admin_teachers_path } }
  end
end
