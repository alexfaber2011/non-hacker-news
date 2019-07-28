class HackerNewsAPI
  class << self
    def fetch_top_story_ids
      url = 'https://hacker-news.firebaseio.com/v0/topstories.json'
      response = HTTP.get(url)
      parse_json response
    end

    # TODO - speed this up with parrallel requests
    def fetch_stories(ids)
      ids.reduce([]) do |stories, id|
        stories.push(fetch_story(id))
      end
    end

    def fetch_story(id)
      url = "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
      response = HTTP.get(url)
      parse_json response
    end

    private

    def parse_json(response)
      return handle_fetch_error response unless response.status.success?

      JSON.parse response, symbolize_names: true
    end

    # TODO - do something better here
    def handle_fetch_error(response)
      puts "Fetch error.  Received #{response.code} - #{response.body}"
    end
  end
end
