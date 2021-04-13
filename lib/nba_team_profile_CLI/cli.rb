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
      puts "Hello #{name} lets get started today. Would you like to see some team information? enter yes to see list, enter exit to leave."
            menu
    end

    def menu
        selection = user_input
        # enter yes print out a list of teams
        if selection == "yes"
            #print nba teams
        # enter exit I want them to exit 
                print_teams
                menu #recrusion waiting for another command (slection)
        elsif selection == "exit"
            goodbye
            #exit application
        else 
            invalid
        #invalid message , lets user keep trying to enter
    end
        #enter yes print a list of nba teams
        #enter exit will i want them to exit
        # invalid message

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
      # puts "input yes to see a list or exit to leave list"
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
        puts "---------------------------------------------"
        puts "enter yes to see more teams or exit to exit"
        
        else
            invalid
        end
    
    end


end