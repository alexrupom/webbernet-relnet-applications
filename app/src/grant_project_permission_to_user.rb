class GrantProjectPermissionToUser
  def initialize(project, user_id)
    @project = project
    @user_id = user_id
  end

  def run
    return unless @project.active

    ProjectUser.create!(project: @project, user_id: @user_id)
  end
end
