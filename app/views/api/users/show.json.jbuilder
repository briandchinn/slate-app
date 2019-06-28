json.partial! "user.json.jbuilder", user: @user

json.projects do
  json.array! @user.projects.each do |project|
    json.partial! "api/projects/project", project: project
  end
end

# only show if matches current user
if current_user == @user
  json.applications do
    json.array! @user.applications.each do |application|
      json.partial! "api/applications/application", application: application
      json.project do
        json.partial! "api/projects/project", project: application.project
        json.project_owner do
          json.partial! "api/users/user", user: application.project.user
        end
      end
    end
  end
end
