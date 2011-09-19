class Admin::<%= controller_class_name %>Controller < Admin::BaseController

  helper_method :sort_column, :sort_direction, :search_params

  before_filter :find_<%= singular_table_name %>, :only => [:edit, :update, :show, :destroy]

  def index
    @search = <%= class_name %>.search(params[:search])
    @<%= plural_table_name %> = find_<%= plural_table_name %>
  end

  def new
    @<%= singular_table_name %> = <%= class_name %>.new
  end

  def create
    @<%= singular_table_name %> = <%= class_name %>.new(params[:<%= singular_table_name %>])
    if @<%= singular_table_name %>.save
      redirect_to admin_<%= plural_table_name %>_path, :notice => "Successfully created <%= human_name.downcase %>."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @<%= singular_table_name %>.update_attributes(params[:<%= singular_table_name %>])
      redirect_to admin_<%= plural_table_name %>_path, :notice => "Successfully updated <%= human_name.downcase %>."
    else
      render :edit
    end
  end

  def destroy
    @<%= singular_table_name %>.destroy
    redirect_to admin_<%= plural_table_name %>_path, :notice => "<%= human_name %> has been deleted."
  end

  protected

  def find_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= class_name %>.find(params[:id])
  end

  def find_<%= plural_table_name %>
    search_relation = @search.relation
    search_relation.order(sort_column + " " + sort_direction).page params[:page]
  end

  def sort_column
    <%= class_name %>.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def search_params
    {:search => params[:search]}
  end

end
