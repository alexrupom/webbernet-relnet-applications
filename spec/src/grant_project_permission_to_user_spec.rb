require "rails_helper"

RSpec.describe GrantProjectPermissionToUser do
  subject    { described_class.new(project, user.id) }
  let(:user) { create(:user, team: project.team) }

  context "when the project is active" do
    let(:project) { create(:project, :with_team) }

    context "when the user is granted project permission" do
      it "user permission to project returns true" do
        subject.run
        expect(user_permission_to_project).to eq(true)
      end
    end
  end

  context "when the project is inactive" do
    let(:project) { create(:project, :with_team, active: false) }

    context "when the user is NOT granted project permission" do
      it "user permission to project returns false" do
        subject.run
        expect(user_permission_to_project).to eq(false)
      end
    end
  end

  def user_permission_to_project
    UserPermissionToProject.new(project, user).run
  end
end
