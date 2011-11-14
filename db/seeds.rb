# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

State.destroy_all
states = { "Alabama"=> "AL","Alaska"=> "AK","Arizona"=> "AZ","Arkansas"=> "AR","California"=> "CA","Colorado"=> "CO","Connecticut"=> "CT","Delaware"=> "DE","District Of Columbia"=> "DC","Florida"=> "FL","Georgia"=> "GA","Hawaii"=> "HI","Idaho"=> "ID","Illinois"=> "IL","Indiana"=> "IN","Iowa"=> "IA","Kansas"=> "KS","Kentucky"=> "KY","Louisiana"=> "LA","Maine"=> "ME","Maryland"=> "MD","Massachusetts"=> "MA","Michigan"=> "MI","Minnesota"=> "MN","Mississippi"=> "MS","Missouri"=> "MO","Montana"=> "MT","Nebraska"=> "NE","Nevada"=> "NV","New Hampshire"=> "NH","New Jersey"=> "NJ","New Mexico"=> "NM","New York"=> "NY","North Carolina"=> "NC","North Dakota"=> "ND","Ohio"=> "OH","Oklahoma"=> "OK","Oregon"=> "OR","Pennsylvania"=> "PA","Rhode Island"=> "RI","South Carolina"=> "SC","South Dakota"=> "SD","Tennessee"=> "TN","Texas"=> "TX","Utah"=> "UT","Vermont"=> "VT","Virginia"=> "VA","Washington"=> "WA","West Virginia"=> "WV","Wisconsin"=> "WI","Wyoming"=> "WY" }
states.each do |name, state_abbreviation|
  State.create :name => name, :state_abbreviation => state_abbreviation
end

Category.destroy_all 
categories = Category.create([{:title => 'Accessories' }, { :title => ' Art' }, { :title => ' Bags' }, { :title => ' Books' }, { :title => ' Candles' }, { :title => ' Clothing-Men' }, { :title => ' Clothing-Women' }, { :title => ' Food' }, { :title => ' Furniture' }, { :title => ' Jewelry-Bracelets' }, { :title => ' Jewelry-Earrings' }, { :title => ' Jewelry-Necklaces' }, { :title => ' Jewelry-Other' }, { :title => ' Jewelry-Rings' }, { :title => ' Kitchen Goods' }, { :title => ' Knitted/Quilted/Crocheted' }, { :title => ' Other' }, { :title => ' Paper Goods' }, { :title => ' Pet supplies' }, { :title => ' Pottery' }, { :title => ' Toiletries'}])

Neighborhood.destroy_all
Neighborhood.create(:name => 'Ravenswood')
Neighborhood.create(:name => 'Old Town')
Neighborhood.create(:name => 'Hyde Park')
Neighborhood.create(:name => 'West Loop')
Neighborhood.create(:name => 'Roscoe Village')

