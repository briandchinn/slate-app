json.array! @projects.each do |project|
  json.partial! "project.json.jbuilder", project: project
end