json.partial! "project.json.jbuilder", project: @project

json.user do
  json.partial! @project.user, partial: "api/users/user", as: :user 
end

if current_user == @project.user
  json.applications do
    json.array! @project.applications.each do | application |
      json.partial! "api/applications/application", application: application
      json.user do
        json.partial! "api/users/user", user: application.user
      end
    end
  end
end




