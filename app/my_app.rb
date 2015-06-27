#app/my_app.rb
require "thor"
 
class MyApp < Thor
  desc "Starting with new property ABC1DEF2", "Please Enter the credentials of your new property!"
  
  def new
    output = []
    title = ask("Title for your property: ")
    title_pro = ask_title title
    output << "title: "+ title_pro
    property_type = ask_property
    output << "type: "+ property_type
    address = ask("Write your address: ")
    address_pro = ask_address address
    output << "address: "+ address_pro
    rate = ask("Nightly Rate: ")
    nightly_rate = ask_nightly_rate rate
    output << "rate: "+ nightly_rate + " EUR"
    guest = ask("Max guest: ")
    max_guest = ask_guest guest
    output << "guest: "+ max_guest
    email =ask("Email: ")
    email_pro = ask_email email
    output << "email: "+ email_pro
    phone = ask("Phone Number: ")
    phone_number = ask_phone phone_number
    output << "number: " +phone_number
    output = output.join("\n")
    
    File.open("ABC1DEF2.txt", "w") do |f|     
     f.write(output)   
    end
  end
  
  # desc "Continue with ABC1DEF2", "Resuming..."
  # def continue
  # 	input = []
  # 	IO.foreach("ABC1DEF2.txt") do |line| 
  #     key, value = line.split ': ', 2
  #     input[key] = value
     
  #   end
  # end
 
  
  private

  def ask_title title
  	
    if title.empty?
    	say("Title cant be empty. Please put a value!")
    	title = ask("Title: ")
      return title
    end
    return title
  end
  def ask_address address
  	
    if address.empty?
    	say("Address cant be empty. Please put a value!")
    	address = ask("Address: ")
    	return address if address
    end
    return address
  end
  def ask_property
    say("Now select the property type")
    type = ['holiday home', 'apartment','private room']
    ask 'Select by typing the first letter and use tab from keyboard, it will auto-complete the rest.. :', 
    {:limited_to => type }
  end
  def ask_nightly_rate rate
  	until rate =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
    	rate = ask("Nightly Rate in EUR: ") 
    	return rate if rate =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
    end
    return rate
  end
  
  def ask_guest guest
  	until guest =~ /\A[-+]?[0-9]+\Z/
  		say("Max Guest can not be empty and must  have to be numeric . Please put a value!")
    	guest = ask("Max Guest in Numeric: ")
      return guest if guest =~ /\A[-+]?[0-9]+\Z/
    end
    return guest
  end
  def ask_email email
  	until email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  		say("Email can not be empty and must be a valid email id. Please provide your valid email id")
    	email = ask("Email: ")
      return email if email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    end
    return email
  end
  def ask_phone phone
  	phone_regex = /([0-9\s\-]{7,})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/
  	until phone =~ phone_regex
  		say("Phone number not be empty and must be a valid number. Please provide your phone number")
    	phone = ask("Phone Number: ")
      return phone if phone =~ phone_regex
    end
    return phone
  end
end
 
MyApp.start(ARGV)