
JWTSessions.encryption_key  =  'secreto'
JWTSessions.token_store = :redis, { redis_url: ENV["REDISTOGO_URL"] || "redis://localhost:6379/" }
