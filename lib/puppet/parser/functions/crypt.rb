module Puppet::Parser::Functions
  newfunction(:crypt, :type => :rvalue) do |args|

    if args.size > 3 or args.size < 2
      raise Puppet::ParseError, "crypt(): Wrong number of arguments (#{args.size}; must be 2 or 3)"
    end

    input = args[0]
    salt  = args[1]

    if args.size == 3
      hash_type = args[2]
      unless %w[1 2a 5 6].include? hash_type
        raise Puppet::ParseError, "crypt(): Hash type is invalid (#{hash_type}; must be one of '1', '2a', '5', '6')"
      end
      salt = "$#{hash_type}$#{salt}"
    end

    input.crypt(salt)
  end
end
