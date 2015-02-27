OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter, "HoVab6MwmTklrqD1J4Bw3A", "1muXZ3UV0HKY8W3zc0Go9g1vhmXsfTopSzYujyyNTw"
	
end