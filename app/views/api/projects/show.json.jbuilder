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

json.accepted_count @project.accepted_count
json.creator_full_name @project.creator_full_name
json.remaining_positions @project.remaining_positions

if current_user
  json.current_user_has_applied current_user.has_applied(@project.id)
end

