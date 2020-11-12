uri = URI.parse(ENV["REDISTOGO_URL"])
uri2 = URI.parse("redis://redistogo:c78cdb75e5e7d4bc1ea1988ba8a87eb4@dory.redistogo.com:9004/")
REDIS = Redis.new(:url => uri2)
