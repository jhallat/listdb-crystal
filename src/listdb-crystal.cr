# TODO: Write documentation for `Listdb::Crystal`
module Listdb::Crystal
  VERSION = "0.1.0"

  loop do 
    print "> "
    command = gets
    if command
      if command.strip.upcase == "EXIT"
        break
      end
    end
  end
  
end
