class StoriesController < ApplicationController
  def index
    @stories = HackerNewsAPI
               .fetch_stories(HackerNewsAPI.fetch_top_story_ids.first(10))
    render
  end
end
