require 'spec_helper'

describe Team do

  before { @team = Team.new(name: "Example Team")} 

  subject { @team }

  it { should respond_to(:name) }

   it { should be_valid }

  describe "when name is not present" do
    before { @team.name = " " }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @team.name = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when team name is already taken" do
    before do
      team_with_same_name = @team.dup
      team_with_same_name.name = @team.name.upcase
      team_with_same_name.save
    end

    it { should_not be_valid }
  end

end

