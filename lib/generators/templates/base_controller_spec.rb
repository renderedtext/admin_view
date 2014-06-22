require 'spec_helper'

describe Admin::BaseController do

  describe "GET 'index'" do

    context "logged in as admin" do

      it "renders index page" do
        controller.stub_chain(:current_user, :admin?).and_return(true)

        get :index

        expect(response).to render_template('index')
      end

    end

    context "logged in as user" do

      it "renders 404" do
        controller.stub_chain(:current_user, :admin?).and_return(false)

        get :index

        expect(response).to render_template('404.html')
        expect(response.response_code).to eql(404)
      end

    end

    context "not logged in" do

      it "renders 404" do
        allow(controller).to receive(:current_user).and_return(nil)

        get :index

        expect(response).to render_template('404.html')
        expect(response.response_code).to eql(404)
      end

    end

  end

end
