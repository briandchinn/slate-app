  json.array! @notifications.each do |notification|
    json.partial! "notification.json.jbuilder", notification: notification
    json.project do
      json.partial! "api/projects/project", project: notification.application.project
    end
  end



