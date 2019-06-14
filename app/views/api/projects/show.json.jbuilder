json.partial! "project.json.jbuilder", project: @project

# only show array if matches current user
# if current_user == @project.user
  json.applicants do
    json.array! @project.users.each do | user |
      json.partial! "api/users/user", user: user
    end
  end
# end
