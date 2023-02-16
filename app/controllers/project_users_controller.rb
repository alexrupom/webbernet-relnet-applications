class ProjectUsersController < ProjectsBaseController
  layout 'backstage_bare'
  def index
    @facade = ProjectUsers::IndexFacade.new(params)
  end

  def create
    GrantProjectPermissionToUser.new(@current_project, params[:user_id]).run
    redirect_back(fallback_location: root_path)
  end

  def destroy
    ProjectUser.find_by(user_id: params[:id], project: @current_project).destroy
    redirect_back(fallback_location: root_path)
  end
end
