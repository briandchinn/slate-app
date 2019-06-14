json.partial! "user.json.jbuilder", user: @user

# only show if matches current user
if current_user == @user
  json.applications do
    json.array! @user.applications.each do |application|
      json.partial! "api/applications/application", application: application
      json.project do
        json.partial! "api/projects/project", project: application.project
      end
    end
  end
end
