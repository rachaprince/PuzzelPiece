require 'spec_helper'

describe "Team pages" do

  subject { page }

  describe "create page" do
    before { visit new_team_path }

    it { should have_content('Create Your Team') }
    it { should have_title(full_title('Teams')) }
  end

  describe "profile page" do
    let(:team) { FactoryGirl.create(:team) }
    before { visit teams_path(team) }

    it { should have_content(team.name) }
    it { should have_title(team.name) }
  end
  describe "signup" do

    before { visit new_team_path }

    let(:submit) { "Create my Team" }

    describe "with invalid information" do
      it "should not create a team" do
        expect { click_button submit }.not_to change(Team, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Team"
      end

      it "should create a user" do
        expect { click_button submit }.to change(Team, :count).by(1)
      end
    end
  end
end
