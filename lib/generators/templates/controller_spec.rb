require 'spec_helper'

describe Admin::<%= controller_class_name %>Controller do

  def mock_<%= singular_table_name %>(stubs={})
    (@mock_<%= singular_table_name %> ||= mock_model(<%= class_name %>).as_null_object).tap do |<%= singular_table_name %>|
      <%= singular_table_name %>.stub(stubs) unless stubs.empty?
    end
  end

  before { controller.stub(:require_admin) }

  describe "GET index" do
    it "assigns all <%= plural_table_name %> as @<%= plural_table_name %>" do
      controller.stub(:find_<%= plural_table_name %>).and_return([mock_<%= singular_table_name %>])
      get :index
      assigns(:<%= plural_table_name %>).should eq([mock_<%= singular_table_name %>])
    end
  end

  describe "GET show" do
    it "assigns the requested <%= singular_table_name %> as @<%=singular_table_name %>" do
      <%= class_name %>.stub(:find).with("37") { mock_<%= singular_table_name %> }
      get :show, :id => "37"
      assigns(:<%= singular_table_name %>).should be(mock_<%= singular_table_name %>)
    end
  end

  describe "GET new" do
    it "assigns a new <%= singular_table_name %> as @<%= singular_table_name %>" do
      <%= class_name %>.stub(:new) { mock_<%= singular_table_name %> }
      get :new
      assigns(:<%= singular_table_name %>).should be(mock_<%= singular_table_name %>)
    end
  end

  describe "GET edit" do
    it "assigns the requested <%= singular_table_name %> as @<%= singular_table_name %>" do
      <%= class_name %>.stub(:find).with("37") { mock_<%= singular_table_name %> }
      get :edit, :id => "37"
      assigns(:<%= singular_table_name %>).should be(mock_<%= singular_table_name %>)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created <%= singular_table_name %> as @<%= singular_table_name %>" do
        <%= class_name %>.stub(:new).with({'these' => 'params'}) { mock_<%= singular_table_name %>(:save => true) }
        post :create, :<%= singular_table_name %> => {'these' => 'params'}
        assigns(:<%= singular_table_name %>).should be(mock_<%= singular_table_name %>)
      end

      it "redirects to the created <%= singular_table_name %>" do
        <%= class_name %>.stub(:new) { mock_<%= singular_table_name %>(:save => true) }
        post :create, :<%= singular_table_name %> => {}
        response.should redirect_to(admin_<%= plural_table_name %>_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved <%= singular_table_name %> as @<%= singular_table_name %>" do
        <%= class_name %>.stub(:new).with({'these' => 'params'}) { mock_<%= singular_table_name %>(:save => false) }
        post :create, :<%= singular_table_name %> => {'these' => 'params'}
        assigns(:<%= singular_table_name %>).should be(mock_<%= singular_table_name %>)
      end

      it "re-renders the 'new' template" do
        <%= class_name %>.stub(:new) { mock_<%= singular_table_name %>(:save => false) }
        post :create, :<%= singular_table_name %> => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested <%= singular_table_name %>" do
        <%= class_name %>.should_receive(:find).with("37") { mock_<%= singular_table_name %> }
        mock_<%= singular_table_name %>.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :<%= singular_table_name %> => {'these' => 'params'}
      end

      it "assigns the requested <%= singular_table_name %> as @<%= singular_table_name %>" do
        <%= class_name %>.stub(:find) { mock_<%= singular_table_name %>(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:<%= singular_table_name %>).should be(mock_<%= singular_table_name %>)
      end

      it "redirects to the <%= singular_table_name %>" do
        <%= class_name %>.stub(:find) { mock_<%= singular_table_name %>(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_<%= plural_table_name %>_url)
      end
    end

    describe "with invalid params" do
      it "assigns the <%= singular_table_name %> as @<%= singular_table_name %>" do
        <%= class_name %>.stub(:find) { mock_<%= singular_table_name %>(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:<%= singular_table_name %>).should be(mock_<%= singular_table_name %>)
      end

      it "re-renders the 'edit' template" do
        <%= class_name %>.stub(:find) { mock_<%= singular_table_name %>(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested <%= singular_table_name %>" do
      <%= class_name %>.should_receive(:find).with("37") { mock_<%= singular_table_name %> }
      mock_<%= singular_table_name %>.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the <%= plural_table_name %> list" do
      <%= class_name %>.stub(:find) { mock_<%= singular_table_name %> }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_<%= plural_table_name %>_url)
    end
  end

end

