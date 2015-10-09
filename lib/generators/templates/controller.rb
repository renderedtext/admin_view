class Admin::<%= controller_class_name %>Controller < Admin::BaseController

  helper_method :sort_column, :sort_direction

  before_filter :find_<%= singular_table_name %>, :only => [<% unless options[:read_only] %>:edit, :update,<% end %> :show, :destroy]

  def index
    @q = <%= class_name %>.search(params[:q])
    @<%= plural_table_name %> = find_<%= plural_table_name %>
  end

<% unless options[:no_create] || options[:read_only] %>
  def new
    @<%= singular_table_name %> = <%= class_name %>.new
  end

  def create
    @<%= singular_table_name %> = <%= class_name %>.new(<%= singular_table_name %>_params)
    if @<%= singular_table_name %>.save
      redirect_to admin_<%= plural_table_name %>_path, :notice => "Successfully created <%= human_name.downcase %>."
    else
      render :new
    end
  end
<% end -%>

  def show
  end

<% unless options[:read_only] -%>
  def edit
  end

  def update
    if @<%= singular_table_name %>.update_attributes(<%= singular_table_name %>_params)
      redirect_to admin_<%= plural_table_name %>_path, :notice => "Successfully updated <%= human_name.downcase %>."
    else
      render :edit
    end
  end
<% end -%>

  def destroy
    @<%= singular_table_name %>.destroy
    redirect_to admin_<%= plural_table_name %>_path, :notice => "<%= human_name %> deleted."
  end

  protected

  def find_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= class_name %>.find(params[:id])
  end

  def find_<%= plural_table_name %>
    search_relation = @q.result
    @<%= plural_table_name %> = search_relation.order(sort_column + " " + sort_direction).references(:<%= singular_table_name %>).page params[:page]
  end

  def sort_column
    <%= class_name %>.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

<% unless options[:read_only] -%>
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def <%= singular_table_name %>_params
    params.require(:<%= singular_table_name %>).permit(<%= @attributes_symbols.join(", ") %>)
  end
<% end -%>

end
