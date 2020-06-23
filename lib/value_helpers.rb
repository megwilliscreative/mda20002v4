#
# Value helpers
#

module ValueHelpers
  def fetch_values
      if (!data.website.value.nil?)
          return data.website.value
      else
          return []
      end
  end
end