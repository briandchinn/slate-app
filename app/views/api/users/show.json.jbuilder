json.partial! "user.json.jbuilder", user: @user

json.applications do
  json.array! @user.applications.each do |application|
    json.partial! "api/applications/application", application: application
    json.project do
      json.partial! "api/projects/project", project: application.project
    end
  end
end

# json.project_offers do
#   # is there a way to display only those that are true? Or do we return all and then handle in the front end?
#   json.title @user.applications.first.project.title
#   json.offer @user.applications.first.offered
# end