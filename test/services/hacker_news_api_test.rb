require 'test_helper'

class HackerNewsAPITest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette('top stories ids') do
      @story_ids = HackerNewsAPI.fetch_top_story_ids
    end
    VCR.use_cassette('top stories') do
      @stories = HackerNewsAPI.fetch_stories(@story_ids);
    end
    VCR.use_cassette('first story') do
      @first_story = HackerNewsAPI.fetch_story(@story_ids.first)
    end
  end

  test 'fetches latest top stories and returns array of ids' do
    assert_instance_of(Array, @story_ids)
    assert(@story_ids.all?(&:integer?))
  end

  test 'fetches all of the latest stories' do
    assert_instance_of(Array, @stories)
    assert_equal(@stories.size, @story_ids.size)
  end

  test 'fetches one story by id' do
    assert_not_nil(@first_story[:id])
    assert_not_nil(@first_story[:title])
    assert_not_nil(@first_story[:url])
  end
end
