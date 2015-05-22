require 'spec_helper'

RSpec.describe StorytimeAdmin::WidgetsController, type: :controller do
  describe "GET index" do
    before(:each) do
      admin = create(:admin)
      sign_in admin
    end

    describe "assigns @collection" do
      it "with no sort column or direction" do
        widgets = create_list(:widget, 3)

        get :index, { use_route: :storytime_admin }

        expect(assigns(:collection)).to eq(widgets)
      end

      it "with descending direction" do
        widgets = create_list(:widget, 3)

        get :index, { use_route: :storytime_admin, :direction => "desc" }

        expect(assigns(:collection)).to eq(widgets.reverse)
      end

      it "with title sort column and descending direction" do
        widget_1 = create(:widget, title: "Omega")
        widget_2 = create(:widget, title: "Alpha")
        widget_3 = create(:widget, title: "Beta")

        get :index, { use_route: :storytime_admin, :direction => "desc", :sort => "title" }

        expect(assigns(:collection)).to eq([widget_1, widget_3, widget_2])
      end
    end

    it "renders the index template" do
      get :index, { use_route: :storytime_admin }

      expect(response).to render_template("index")
    end
  end
end
