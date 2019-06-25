json.partial! "project.json.jbuilder", project: @project

json.user do
  json.partial! @project.user, partial: "api/users/user", as: :user 
end

# only show array if matches current user
if current_user == @project.user
  json.applicants do
    json.array! @project.users.each do | user |
      json.partial! "api/users/user", user: user
    end
  end
end
