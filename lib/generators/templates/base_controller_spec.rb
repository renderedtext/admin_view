require 'spec_helper'

describe Admin::BaseController do

  describe "GET 'index'" do

    context "logged in as admin" do

      it "renders index page" do
        controller.stub_chain(:current_user, :admin?).and_return(true)
        get :index
        response.should render_template('index')
      end

    end

    context "logged in as user" do

      it "renders 404" do
        controller.stub_chain(:current_user, :admin?).and_return(false)
        get :index
        response.should render_template('404.html')
        response.response_code.should eql(404)
      end

    end

    context "not logged in" do

      it "renders 404" do
        controller.stub(:current_user).and_return(nil)
        get :index
        response.should render_template('404.html')
        response.response_code.should eql(404)
      end

    end

  end

end
