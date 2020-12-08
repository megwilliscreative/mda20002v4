#
# Post helpers
#
module PostHelpers
  def all_posts
    !data.website.post.nil? ? data.website.post.sort_by{ |id, post| post.post_date }.reverse : []
  end

  def stories
    all_posts.select{ |id, post| !post.tags.nil? && post.tags.include?("Story") }
  end

  def posts_by_tag(tag_name)
    all_posts.select{ |id, post| !post.tags.nil? && post.tags.include?(tag_name) }
  end

  def posts_and_videos
    (all_posts + all_videos).sort_by { |id, item| item.post_date || DateTime.parse(item['_meta']['created_at'])}.reverse
  end


end