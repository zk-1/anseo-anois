Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://#{ENV["SITE_DOMAIN"]}"
    resource "*",
      headers: :any,
      expose: [ "Authorization" ],
      methods: [ :get, :post, :patch, :put, :delete, :options ]
  end
end
