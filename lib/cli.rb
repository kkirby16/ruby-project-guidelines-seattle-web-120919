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
    puts '  
          /\
         /**\
        /****\   /\
       /      \ /**\
      /  /\    /    \        /\    /\  /\      /\            /\/\/\  /\
     /  /  \  /      \      /  \/\/  \/  \  /\/  \/\  /\  /\/ / /  \/  \
    /  /    \/ /\     \    /    \ \  /    \/ /   /  \/  \/  \  /    \   \
   /  /      \/  \/\   \  /      \  /     /    \
__/__/_______/___/__\___\___________________________________________________'
    puts ""
    puts 'Please enter your name.'
    user_input = gets.chomp
    puts ""
    puts "Hi #{user_input}! What would you like to do today?"
    # User.find_or_create_by(name: user_input)
    $user_id = User.find_or_create_by(name: user_input).id

    display_options($user_id) 
end 

def display_options(user_id)
    puts ""
    puts "1. View a list of local hikes" #an instructor said these 3 menu options would be good for what I'm doing. said that "edit your profile" could be an update. 
    puts "2. View your favorite hikes"  
    puts "3. Change your name"
    user_selection = gets.chomp
    if user_selection == "1"
        list_of_local_hikes(user_id)
    elsif user_selection == "2"
        favorite_hikes(user_id)
    elsif user_selection == "3"
        change_name(user_id)
    elsif user_selection != "1" && user_selection != "2" && user_selection != "3"
        puts "Invalid entry. Please try again."
        display_options($user_id)
    end 
end 
    

def list_of_local_hikes (user_id)#this method shows the user the list of local hikes they could go on.
    Hike.all.each do |hike|
        puts hike.name
         #instructor said it could be good to focus on pnw for hikes and can add other things as go on. 
    end 
    puts ""
    next_menu_question(user_id)
end 



def next_menu_question(user_id)
    puts "To go back to the main menu then press 1"
    puts "To make a favorite hike list from this list of hikes then press 2"
    user_selection = gets.chomp 
    if user_selection == "1" 
    display_options(user_id)
    elsif user_selection == "2" 
    make_favorites(user_id)
    elsif 
    user_selection != "1" && user_selection != "2" 
    puts "Invalid entry. Please try again."
    display_options($user_id)
    end 
end
end 
    


def make_favorites(user_id) #the area where they look at the local hikes to make their favorites list
    favorite_hikes = [] #had to pass that user_id around. had to chomp it split it loop through the hike id and convert to an integer. to get user id we had to find or bcreate by, grab that id and pass it around.
    Hike.all.each do |hike|
        puts "Hike ID: #{hike.id}   Hike Name: #{hike.name}" 
    end  
        puts ""
    #     puts 'Please enter your name.'
    # user_input = gets.chomp
    #     puts ""
    #user_id = User.find_or_create_by(name: user_input).id
        puts "Hi #{User.where(id: user_id).pluck("name")[0]}, please enter the above ID numbers of the hikes you want to add to your favorites list. Ex: 1, 3, 5" 
        #thinking using sql? like SELECT name from USERS ? were you thinking of select_all? or 
        #SELECT name FROM users WHERE id = user_id ? ***User.where(user_id = ?), params[:orders], false)
        #User.where(user_id = ?), u

        
        user_input = gets.chomp 
        favorite_hikes << user_input.split(", ")
        puts favorite_hikes 
        favorite_hikes.flatten.each do |new_fave|
            Favorite.create(user_id: user_id, hike_id: new_fave.to_i, notes: "")
        end 
        puts ""
        favorite_hikes(user_id)
    end
        #.each will grab the user in[ut and do it however many times it needs to be done

        #whatever kevs idea is , hike_id: , 
        

    #user is giving a string. 


    #     if user_selection.include(1)
    #     favorite_hikes << #hike with id 1
    #     elsif user_selection == "2" 
    #     favorite_hikes << #hike with id

    #could add 1 or more than 1




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

    

def favorite_hikes(user_id) #the area where the user can see their list of favorite hikes.
#one line sql line that greg said I know how to do for showing the favorites of the user. 
    # user = User.find_by(name: name)
    # user.hikes
# binding.pry
#     user.hike.each do |hikes|
#     puts hike.name 
#SELECT hike_id FROM FAVORITES WHERE user_id = user_id
    
puts "The below are your favorite hikes:"
puts ""
# binding.pry
hikes_names_array =[]
hikes_id_array = Favorite.where(user_id: user_id).pluck("hike_id").uniq
hikes_id_array.each do |hike|
    hikes_names_array << Hike.find(hike).name
    #binding.pry
end
puts hikes_names_array.join(", ")
puts ""
favorites_menu_question
end 

def favorites_menu_question  #options the user sees underneath their list of favorite hikes 
    puts "To change your name press 1"
    puts "To delete certain hikes from your favorites list press 2"
    puts "To go back to the list of local hikes press 3"
    puts "To go back to the main menu press 4"
    user_selection = gets.chomp 
    if user_selection == "1" 
    change_name($user_id)
    elsif user_selection == "2" 
    delete_favorites($user_id)
    elsif user_selection == "3"
    list_of_local_hikes($user_id)
    elsif user_selection == "4" 
    display_options($user_id)
    end 
end 
 
def add_notes_to_favorites #the area where the user can change the priority of the order in which they want their favorite hikes to be displayed in the chance that they want to hike one first, then another hike second, another third, and so on.
    #find out how the user could change the priority of which favorite hikes they want to hike in what order 

    
    #Then, if they type and spell the favorites correctly, their favorites list is updated and they are given a message that says “Your favorites list has been updated.” 
#Then there should be an option menu under the sentence about their favorites list being updated. (menu is the below method)

puts "" #this puts a new line in between the change_favorite_priotity screen and the favorites_priority_menu_question. 
add_notes_to_favorites_menu_question
end 

def add_notes_to_favorites_menu_question 
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

def delete_favorites(user_id) #the area where a user can delete certain hikes from their favorites list. 
#maybe something display the favorite hike list and then say something like "type the IDs of the hikes that you'd like to delete from your favorites list."

#If the user types and spells the hikes correctly then their favorites list should be updated and they are given a message that says “Your favorites list has been updated.” Then below that they should see a menu which is the below method
puts ""
puts "Which of your below favorites do you want to delete? Enter a Hike ID number from the above list for which hike you want to delete."
puts ""
hikes_names_array =[]
hikes_id_array = Favorite.where(user_id: user_id).pluck("hike_id").uniq
hikes_id_array.each do |hike|
    hikes_names_array << Hike.find(hike).name
    #binding.pry
end
puts hikes_names_array.join(", ")
# Get response from user
response = gets.chomp

# Use response to find the hike
favorite_choice = Favorite.find_by(hike_id: response)
# binding.pry


# User the hike's ID to delete it from Favorites
# Favorite.destroy(id: hike.id)

Favorite.destroy(favorite_choice.id) #favorite choice was an array of two things and needss to be an array of one thing. 

puts "" #this puts a new line in between the delete favorite hikes screen and the delete_favorite_hikes_menu_question
puts 
puts ""
puts "Your selection has been deleted."
puts ""
delete_favorite_hikes_menu_question
end 

def delete_favorite_hikes_menu_question
    puts ""
    puts "Your favorites list has been updated."
    puts ""
    puts "To go back to your favorites list press 1"
    puts "To go back to the list of local hikes press 2"
    puts "To go back to the main menu press 3"
    user_selection = gets.chomp 
    if user_selection == "1" 
    favorite_hikes($user_id)
    elsif user_selection == "2" 
    list_of_local_hikes($user_id)
    elsif user_selection == "3"
    display_options($user_id)
    end 
end  


def change_name(user_id)
    puts ""
    puts "Please enter your new name."
    user_input = gets.chomp
    user = User.find(user_id)
    # User.find_by(name: user_input).name
    user.update(name: user_input)
    
    #binding.pry

    #.save

    #find the hiker first 
    puts ""
    puts "Your name has been updated and we have also taken you back to the main menu."
    puts ""
    puts "Main Menu:"
    puts ""
    display_options(user_id)

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

#**update could be changing your name and greg said that could be done in 2 lines of code but said to check with soundarya to see if that can work as an update for me.

