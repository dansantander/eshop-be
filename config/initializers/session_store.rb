# We define what the cookies are going to be structured like
if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: "_eshop_be_app", tld_length: 2,
  domain: "https://eshop-be-1418.herokuapp.com", same_site: :none, secure: true
else
  Rails.application.config.session_store :cookie_store, key: "_eshop_be_app", same_site: :none, secure: true
end
