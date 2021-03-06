class Admin::CategoriesController < AdminController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @works = @category.works.recent.paginate(:page => params[:page], :per_page => 5)  #paginate(:page => params[:page], :per_page => 5) 指的是分页
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save!
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path, alert: "Category delete"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
