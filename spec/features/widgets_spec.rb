require 'spec_helper'

describe "Admin", type: :feature do
  context "As an admin user" do
    before do
      user = create(:admin)
      visit new_user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_link_or_button "Log in"
    end

    context "Widgets" do
      it "shows a list of widgets" do
        3.times { create(:widget) }

        visit storytime_admin.widgets_path

        Widget.all.each do |widget|
          expect(page).to have_content widget.title
        end
      end

      it "creates a widget" do
        visit storytime_admin.new_widget_path

        fill_in "widget_title", with: "Title"
        fill_in "widget_content", with: "Lorizzle go to hizzle dolor its fo rizzle amizzle, consectetuer adipiscing elit. Nullam sapien velit, my shizz volutpat, suscipit shizzle my nizzle crocodizzle, check it out vel, arcu. Pellentesque egizzle ghetto. Sed that's the shizzle. Fusce at dolizzle dapibus we gonna chung tempizzle yippiyo. Maurizzle pellentesque nibh et turpis. Boom shackalack in tortizzle. Mah nizzle eleifend rhoncizzle nisi. In hac crunk platea dictumst. Shiznit dapibus. Shiznit uhuh ... yih! pizzle, pretizzle dawg, mattizzle mofo, eleifend vitae, nunc. Gangsta suscipizzle. You son of a bizzle check it out fizzle sheezy ass."
        click_button "Save"

        expect(page).to have_content "success"
      end

      it "edits a widget" do
        widget = create :widget

        visit storytime_admin.edit_widget_path(widget)
        fill_in "widget_title", with: "New Title"
        click_button "Save"

        widget.reload
        expect(widget.title).to eq "New Title"
      end

      it "deletes a widget" do
        widget = create :widget

        visit storytime_admin.widgets_path
        click_link "delete_widget_#{widget.id}"

        expect(page).not_to have_content widget.title
      end
    end
  end

  context "As a non-admin user" do
    before do
      user = create(:user)
      visit new_user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_link_or_button "Log in"
    end

    context "Widgets" do
      it "redirects to root" do
        create(:widget)

        visit storytime_admin.widgets_path

        expect(page).to have_content "Only admin users can access this page"
      end
    end
  end
end