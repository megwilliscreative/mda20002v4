#
# Podcast helpers
#
module PodcastHelpers
    
  def all_podcasts
    !data.website.podcastEpisode.nil? ? data.website.podcastEpisode.sort_by{ |id, podcast| podcast.episode_date }.reverse : []
  end

  def friendly_duration(duration)
    friendly = []
    parts = duration.split(':')
    if (parts[0] != "00")
      friendly << pluralise(parts[0].to_i, "hour", "hours")
    end
    if (parts[1] != "00")
      friendly << pluralise(parts[1].to_i, "minute", "minutes")
    end
    if (parts[2] != "00")
      friendly << pluralise(parts[2].to_i, "second", "seconds")
    end

    friendly.join(', ')
  end

end