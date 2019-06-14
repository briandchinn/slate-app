json.partial! "project.json.jbuilder", project: @project

json.applicants do
  json.array! @project.users.each do | user |
    json.partial! "api/users/user", user: user
  end
end
