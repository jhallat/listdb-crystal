# TODO: Write documentation for `Listdb::Crystal`
def create(args) 
  if args.size > 0
    puts args
  else 
    puts "I don't know what you want me to create."  
  end   
end

module Listdb::Crystal
  VERSION = "0.1.0"

  loop do 
    print "> "
    input = gets
    if input 
      args = input.split(' ')
      if args.size > 0
        command = args.shift
        case command.strip.upcase
        when "EXIT"
            break
        when "CREATE"
          create(args)  
        else
          puts "I don't know what you are asking me to do."
        end
      end
    end
  end
  

end
