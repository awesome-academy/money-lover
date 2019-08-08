class Admin::CategoriesController < Admin::BaseAdminController
  before_action :get_category, except: %i(index new create)
  before_action :get_category_select, only: %i(new edit)

  def index
    @category = Category.new
    @categories = Category.default_category.root_category
    @list_categories = Category.default_category.list_category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t("alert.created", obj: Category.name)
      redirect_to admin_categories_path
    else
      get_category_select
      render :index
    end
  end

  def show; end

  def edit; end

  def update
    if @category.update category_params
      flash[:success] = t("alert.updated", obj: Category.name)
      redirect_to admin_categories_path
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
      params.require(:category).permit Category::CATEGORY_PARAMS
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
