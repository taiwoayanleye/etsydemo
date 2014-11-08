json.array!(@user_mail_boxes) do |user_mail_box|
  json.extract! user_mail_box, :id, :name, :email, :login
  json.url user_mail_box_url(user_mail_box, format: :json)
end
