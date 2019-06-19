json.array! @projects.each do | project |
  json.partial! "project.json.jbuilder", project: project

  # json.project_owner do
  #   json.array! @project.users.each do | user |
  #     json.partial! "api/users/user", user: user
  #   end
  # end
end