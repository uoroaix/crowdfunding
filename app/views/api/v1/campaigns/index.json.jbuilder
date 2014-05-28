json.array! @campaigns do |campaign|
  json.title campaign.title
  json.details campaign.details
  json.id campaign.id
end






# [ {title: "..."}, {title: "..."} ]