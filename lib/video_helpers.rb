#
# Video helpers
#

module VideoHelpers

    # fetch the videos - grouping them by year
    def fetch_videos
        # fetch the articles  
        if (!data.website.video.nil?)
            return data.website.video.sort_by{ |id, e| [e['year'].to_i, e['_meta']['created_at']] }.reverse.group_by{ |id, v| v.year }
        else
            return []
        end
    end

end