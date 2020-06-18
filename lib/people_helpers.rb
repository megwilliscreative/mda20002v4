#
# People helpers
#
module PeopleHelpers
  def committee_members
    !data.website.person.nil? ? data.website.person.select{ |id,x| !x.tags.nil? && x.tags.include?("Committee Member") } : []
  end

  def ambassadors
    !data.website.person.nil? ? data.website.person.select{ |id,x| !x.tags.nil? && x.tags.include?("Ambassador") } : []
  end 
end