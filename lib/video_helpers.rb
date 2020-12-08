#
# Video helpers
#
require 'net/http'
require 'json'

module VideoHelpers

    # fetch the videos - grouping them by year
    def fetch_videos
        all_videos.group_by{ |id, v| v.year }
    end

    def all_videos
        # fetch the articles  
        if (!data.website.video.nil?)
            return data.website.video.sort_by{ |id, e| [e.year.to_i, e['_meta']['created_at']] }.reverse
        else
            return []
        end
    end

    def video_thumbnail(video, size="large")
        url = URI(video.video_url.sub("player.vimeo.com", "vimeo.com/api/v2") + ".json")
        response = JSON.parse Net::HTTP.get(url)
        response.first["thumbnail_#{size}"]
    end

end