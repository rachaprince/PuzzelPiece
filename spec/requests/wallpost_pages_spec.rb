require 'spec_helper'

describe "Wallpost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "wallpost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a wallpost" do
        expect { click_button "Post" }.not_to change(Wallpost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'wallpost_content', with: "Lorem ipsum" }
      it "should create a wallpost" do
        expect { click_button "Post" }.to change(Wallpost, :count).by(1)
      end
    end
  end
end