require 'test_helper'

class BouncerTest < ActiveSupport::TestCase
  test 'remove ids of nerdy stories' do
    top_story_ids = (1..10).to_a
    allowed_ids = Bouncer.deny_nerds top_story_ids
    assert_equal(5, allowed_ids.size)
  end
end
