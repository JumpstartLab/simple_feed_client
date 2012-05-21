require "faraday"
require "json"

module SimpleFeed
  class Client
    def initialize(options={})
      port = options[:port] || 2999
      @conn = Faraday.new(:url => "http://simplefeed.dev:#{port}")
      if basic_auth = options[:basic_auth]
        @conn.basic_auth(basic_auth[:login], basic_auth[:password])
      end
      @options = options
    end

    def get_feeds
      resp = @conn.get do |req|
        req.url '/api/feeds/items.json'
        req.headers['Content-Type'] = 'application/json'
      end
      [resp.status, resp.body]
    end

    def get_feed(feed)
      resp = @conn.get do |req|
        req.url "/api/feeds/#{feed}/items.json"
        req.headers['Content-Type'] = 'application/json'
      end
      [resp.status, resp.body]
    end

    def create_feed_item(feed, attributes)
      resp = @conn.post do |req|
        req.url "/api/feeds/#{feed}/items.json"
        req.headers['Content-Type'] = 'application/json'
        req.body = JSON.dump({item: attributes})
      end
      [resp.status, resp.body]
    end

    def update_feed_item(feed, item, attributes)
      item = item.id if item.respond_to? :id
      resp = @conn.put do |req|
        req.url "/api/feeds/#{feed}/items/#{item}.json"
        req.headers['Content-Type'] = 'application/json'
        req.body = JSON.dump({item: attributes})
      end
      [resp.status, resp.body]
    end
  end
end

