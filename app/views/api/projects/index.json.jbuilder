json.array! @projects.each do | project |
  json.partial! "project.json.jbuilder", project: project
  json.user do
    json.partial! project.user, partial: "api/users/user", as: :user 
  end
end

# if current_user
#   json.current_user_has_applied current_user.has_applied(@project.id)
# end

