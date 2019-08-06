class CategoriesUserController < ApplicationController
  before_action :get_category, except: %i(index new create)
  before_action :get_category_select, only: %i(new edit)

  def index
    @categories = Category.root_category
    @categories_not_user = Category.categories_not_user
    @categories_user = Category.categories_for_user current_user.id
    @categories_by_user = Category.by_user current_user.id
    @category = Category.new
  end

  def edit; end

  def create
    category = Category.find_by(name: category_params[:name], parent_id: category_params[:parent_id])
    ActiveRecord::Base.transaction do
      category ||= Category.create! category_params
      return if CategoriesUser.find_by(category_id: category.id)
      categories_user = category.categories_user.build category_user_params
      return unless categories_user.save
      flash[:success] = t("alert.created", obj: Category.name)
    end
    redirect_to categories_user_index_path
  rescue
    flash[:danger] = t("flash.update_fail")
    redirect_to categories_user_index_path
  end
  
  def update
    if @category.update category_params
      flash[:success] = t("alert.updated", obj: Category.name)
      redirect_to categories_user_index_path
    else
      get_category_select
      render :index
    end
  end

  def destroy
    @status = :success if @category.destroy
    respond_to :js
  end

  private
    def category_params
      params.require(:categories_user).permit Category::CATEGORY_PARAMS
    end

    def category_user_params
      params.require(:categories_user).permit CategoriesUser::CATEGORY_USER_PARAMS
    end

    def get_category
      @category = Category.find_by id: params[:id]
      return if @category
      flash[:error] = t("alert.not_found", obj: Category.name)
      redirect_to admin_categories_path
    end

    def get_category_select
      @categories = Category.category_select params[:id]
    end
end
