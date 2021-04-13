# Real information inserted into our application. This infomation comes from the api site and loads in the application.

class API
    def self.get_data
       response = RestClient.get("https://www.balldontlie.io/api/v1/teams")
       teams_array = JSON.parse(response)["data"]
       teams_array.each do |team|
        Team.new(team)
       end
    
    end
end
