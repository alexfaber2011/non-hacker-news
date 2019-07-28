class Bouncer
  class << self
    def deny_nerds(ids)
      hidden_ids = Post
                   .where(hacker_news_id: ids, hidden: true)
                   .map(&:hacker_news_id)
      ids.difference(hidden_ids)
    end
  end
end
