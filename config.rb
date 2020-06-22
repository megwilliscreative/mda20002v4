# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :livereload

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end



# helpers
# require "lib/common_helpers"
# require "lib/video_helpers"
# require "lib/content_block_helpers"
# require "lib/speaker_helpers"
# require "lib/event_helpers"
require "lib/post_helpers"
# require "lib/podcast_helpers"
require "lib/people_helpers"
# require "lib/value_helpers"
# require "lib/announcement_helpers"
# helpers CommonHelpers
# helpers VideoHelpers
# helpers ContentBlockHelpers
# helpers SpeakerHelpers
# helpers EventHelpers
helpers PostHelpers
# helpers PodcastHelpers
helpers PeopleHelpers
# helpers ValueHelpers
# helpers AnnouncementHelpers




# contentful integration !! copied from previous
activate :contentful do |f|
  f.space         = { website: ENV['MD_CONTENTFUL_SPACE_ID'] }
  f.access_token  = ENV['MD_CONTENTFUL_API_KEY']
  f.cda_query     = { include: 1, order: 'sys.createdAt' }
  f.all_entries = true
  f.content_types = { 
    book: 'book', 
    video: 'video',
    supporter: 'supporter',
    contentBlock: 'contentBlock',
    speaker: 'speaker',
    event: 'event',
    post: 'post',
    person: 'person',
    value: 'value',
    podcastEpisode: 'podcastEpisode',
    announcement: 'announcement'
  }
  f.use_preview_api = !ENV['MD_CONTENTFUL_USE_PREVIEW'].nil? && ENV['MD_CONTENTFUL_USE_PREVIEW'] == "true"
end

# if Dir.exist?(config.data_dir + "/website")
#   # events
#   if Dir.exist?(config.data_dir + "/website/event")
#     data.website.event.each do |id, event|
#       proxy "/events/#{event.year}/#{event.slug}.html", '/events/event.html', locals: { event: event }, data: { :title => event.seo_title, :description => event.seo_description, :keywords => event.seo_keywords, :header_class => "", :append_js => [], :append_css => ['event'] }, :ignore => true
#     end
#   end

#   # posts
#   if Dir.exist?(config.data_dir + "/website/post")
#     data.website.post.each do |id, post|
#       proxy "/resources/blog/#{post.slug}.html", '/resources/blog/post.html', locals: { post: post }, data: { :title => post.title + " | Blog | ", :header_class => "", :append_js => [], :append_css => ['posts'] }, :ignore => true
#     end
#   end

#   # posts
#   if Dir.exist?(config.data_dir + "/website/podcastEpisode")
#     data.website.podcastEpisode.each do |id, podcast|
#       proxy "/resources/podcast/#{podcast.slug}.html", 
#         '/resources/podcast/podcast.html', 
#         locals: { podcast: podcast }, 
#         data: { 
#           :title => podcast.title + " | Love Your City Podcast | ", 
#           :header_class => "", 
#           :append_js => ['vendor/media-element/mediaelement-and-player.min.js'], 
#           :append_css => ['podcasts', 'vendor/media-element/mediaelementplayer.min.css'] 
#         }, 
#         :ignore => true
#     end
#   end
# end