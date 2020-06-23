#
# Content block helpers
#
module ContentBlockHelpers
    
    # fetch a specific content block by the supplied code name
    def fetch_content_block(code_name)
        content_blocks = data.website.contentBlock
        if (!content_blocks.nil?) 
            matching_content_blocks = content_blocks.select{|id, content | !content.code.nil? && content.code == code_name }
            if (!matching_content_blocks.nil? && matching_content_blocks.size > 0)
                return matching_content_blocks.first.last
            end
        end
        return nil
    end

end