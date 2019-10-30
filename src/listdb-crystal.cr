# TODO: Write documentation for `Listdb::Crystal`
def create(args)
  if args.size > 0
    target = args.shift
    case target.strip.upcase
    when "TOPIC"
      create_topic(args)
    else
      puts "I don't know how to create a #{target}."
    end
  else
    puts "I don't know what you want me to create."
  end
end

def create_topic(args)
  puts args
end

def load_properties(property_path)
  properties = {} of String => String
  if File.exists?(property_path)
    line_no = 1
    File.each_line property_path do |line|
      if line.starts_with?("#")
        next
      end
      tokens = line.split("=")
      if tokens.size != 2
        puts "The property file is invalid. Error at line #{line_no}"
        puts "ERR-> #{line}"
        return
      end
      key = tokens[0]
      value = tokens[1]
      properties[key] = value
      line_no += 1
    end
  else
    puts "I cant find the property file"
    return
  end
  return properties
end

module Listdb::Crystal
  VERSION = "0.1.0"

  properties = load_properties("./listdb.properties")
  if properties
    puts(properties["data.home"])
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
            puts "I don't know how to #{command}."
          end
        end
      end
    end
  end
end
