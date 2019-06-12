json.array! @notifications.each do |notification|
  json.partial! "notification.json.jbuilder", notification: notification
end