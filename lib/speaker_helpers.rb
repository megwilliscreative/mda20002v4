#
# Speaker helpers
#

module SpeakerHelpers
    # fetch the speakers - grouping them by year
    def fetch_speakers
        # fetch the articles  
        if (!data.website.speaker.nil?)
            return data.website.speaker.sort_by { |i,d| d.display_order.to_f }
        else
            return []
        end
    end
end