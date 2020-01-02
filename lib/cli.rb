require 'pry'

    #The below few lines are some miscellaneous notes I took from instructors: #get input, look at that input, check and compare to something in that database
    #drawing out what user sees physically can be helpful. #think of next step everytime. every time ask a user a question you have to put a gets.chomp in and do something with that info. 
    #a lot of the cli is puts-ing things. 
    #classes are user, favorite, and a hike. for a user do a user login

class CommandLineInterface

def greet
    puts 'Welcome to Hike Planner, the best resource for planning your favorite hikes!'
end

def user_login
    puts 'Please enter your name.'
    user_input = gets.chomp
    puts "Hi #{user_input}! What would you like to do today?"
    display_options
    User.create(name: user_input)
end 

def display_options
    puts "1. View a list of local hikes" #an instructor said these 3 menu options would be good for what I'm doing. said that "edit your profile" could be an update. 
    puts "2. View your favorite hikes"  
    puts "3. Edit your profile"
    user_selection = gets.chomp
    if user_selection == "1"
        list_of_local_hikes
    elsif user_selection == "2"
        favorite_hikes
    elsif user_selection == "3"
        edit_profile 
    end 
end 
    

def list_of_local_hikes #this method shows the user the list of local hikes they could go on.
    Hike.all.each do |hike|
        puts hike.name
         #instructor said it could be good to focus on pnw for hikes and can add other things as go on. 
    end 
    puts ""
    next_menu_question
end 



def next_menu_question  
    puts "To go back to the main menu then press 1"
    puts "To make a favorite hike list from this list of hikes then press 2"
    user_selection = gets.chomp 
    if user_selection == "1" 
    display_options
    elsif user_selection == "2" 
    make_favorites 
    end 
end
end 
    


def make_favorites #the area where they look at the local hikes to make their favorites list
    #favorite_hikes = []
    Hike.all.each do |hike|
        puts "Hike ID: #{hike.id}"
        puts "Hike Name: #{hike.name}""
    end  
        #binding.pry
        puts ""
        puts 'Please enter your name.'
    user_input = gets.chomp
        puts ""
        puts "Hi #{user_input}, please enter the above id numbers of the hikes you want to add to your favorites list."

    #     if user_selection == "1" 
    #     favorite_hikes << #hike with id 1
    #     elsif user_selection == "2" 
    #     favorite_hikes << #hike with id 2


    #binding.pry
    # Hike.all.each do |hike|
    #     puts hike.name


#     puts "Which of these hikes would you like to add to your favorites list?"
#     user_selection = gets.chomp 

#    #create new instance of that favorite with id of person logged in and that hike. 

#**then if the user types in the hikes correctly, there should be a message saying "Your favorites list is updated." and then there should be an option to go view their favorites list.


#     earlier idea: if user_selection == "Guy Jones I"
#     favorites_list << Guy Jones I
#     if 

    
    

        
    end


def favorite_hikes #the area where the user can see their list of favorite hikes.



puts ""
favorites_menu_question
end 

def favorites_menu_question  #options the user sees underneath their list of favorite hikes 
    puts "To change the priority of the order in which you plan to hike your favorites press 1"
    puts "To delete certain hikes from your favorites list press 2"
    puts "To go back to the list of local hikes press 3"
    puts "To edit your profile press 4"
    puts "To go back to the main menu press 5"
    user_selection = gets.chomp 
    if user_selection == "1" 
    change_favorite_priority
    elsif user_selection == "2" 
    delete_favorites
    elsif user_selection == "3"
    list_of_local_hikes
    elsif user_selection == "4"
    edit_profile 
    elsif user_selection = "5" 
    display_options
    end 
end 
 
def change_favorite_priority #the area where the user can change the priority of the order in which they want their favorite hikes to be displayed in the chance that they want to hike one first, then another hike second, another third, and so on.
    #find out how the user could change the priority of which favorite hikes they want to hike in what order 

    
    #Then, if they type and spell the favorites correctly, their favorites list is updated and they are given a message that says “Your favorites list has been updated.” 
#Then there should be an option menu under the sentence about their favorites list being updated. (menu is the below method)

puts "" #this puts a new line in between the change_favorite_priotity screen and the favorites_priority_menu_question. 
favorites_priority_menu_question 
end 

def favorite_priority_menu_question 
    puts "To go back to your favorites list press 1"
    puts "To go back to the list of local hikes press 2"
    puts "To go back to the main menu press 3"
    user_selection = gets.chomp 
    if user_selection == "1" 
    favorite_hikes
    elsif user_selection == "2" 
    list_of_local_hikes
    elsif user_selection == "3"
    display_options
    end 
end  

def delete_favorite_hikes #the area where a user can delete certain hikes from their favorites list. 



#If the user types and spells the hikes correctly then their favorites list should be updated and they are given a message that says “Your favorites list has been updated.” Then below that they should see a menu which is the below method

puts "" #this puts a new line in between the delete favorite hikes screen and the delete_favorite_hikes_menu_question
delete_favorite_hikes_menu_question
end 

def delete_favorite_hikes_menu_question
    puts "To go back to your favorites list press 1"
    puts "To go back to the list of local hikes press 2"
    puts "To go back to the main menu press 3"
    user_selection = gets.chomp 
    if user_selection == "1" 
    favorite_hikes
    elsif user_selection == "2" 
    list_of_local_hikes
    elsif user_selection == "3"
    display_options
    end 
end  

def edit_profile 
    puts "What would you like to edit on your profile?"
    user_input = gets.chomp


    #there should then be a message later on in this section saying "Your profile has been edited." Then, after this there should be a question menu that shows up with options called edit_profile_question_menu
puts ""
edit_profile_question_menu
end 

def edit_profile_question_menu
    puts "To re-edit your profile press 1"
    puts "To go back to your favorites list press 2"
    puts "To go back to the list of local hikes press 3"
    puts "To go back to the main menu press 4"
    user_selection = gets.chomp 
    if user_selection == "1" 
    edit_profile
    elsif user_selection == "2" 
    favorite_hikes
    elsif user_selection == "3"
    list_of_local_hikes
    elsif user_selection == "4"
    display_options
    end 
end

