class Cli 
    
    def start
        puts "Hello! This is your current list of NBA teams. What is your name?"
        API.get_data
        input = user_input
       greet(input)

    end
    
    def user_input  #dot(.)strip over chomp catches all the white space before and after, will just get that text  
        gets.strip
    end
    
    def greet(name) #greet takes user_input which is the name the user enters at the start of the application.
      puts "Hello #{name} lets get started today. Would you like to see updated information for your favorite NBA Team? enter yes to see list, enter exit to leave."
            menu
    end

    def menu
        selection = user_input
        if selection == "yes"
                print_teams
                menu 
        elsif selection == "exit"
            goodbye
        else 
            invalid
        
    end
        
end

    def goodbye
        puts "Thank you for visiting, come back soon!!"
    end

    def invalid
        puts "Hmmmm.... that doesnt look right. Please try again. "
    end

    def print_teams
       
       Team.all.each.with_index(1) do |team, index |
            puts "#{index}.#{team.full_name}"
       end
       select_teams

    end

    def select_teams

        puts " Please enter the name of the team you would like to learn more information about."
        selection = user_input
        if Team.find_by_selection(selection)
            team = Team.find_by_selection(selection)
        else 
            team = selection
        end
      
        team_details(team)

    end

    def team_details(team)
        if team == "exit"
            goodbye
        elsif team.class == Team
        puts ""
        puts ""
        puts "-------------------------------------------"
        puts "Abbreviation: #{team.abbreviation}"
        puts "Conference: #{team.conference}"
        puts "Division: #{team.full_name}"
        puts "Full Name: #{team.full_name}"
        puts "City: #{team.city}"
        puts ""
        puts ""
        puts " This is your team #{team.full_name}"
        puts "---------------------------------------------"
        puts "enter yes to see more teams or exit to exit"
        
        else
            invalid
        end
    
    end


end