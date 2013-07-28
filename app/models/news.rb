class News
  def self.all
    news = Project.upcoming.available_in(I18n.locale) + Post.available_in(I18n.locale)
    news.sort { |x, y| y.created_at <=> x.created_at }
  end
end
