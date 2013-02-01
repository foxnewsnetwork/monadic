module Monadic
  module Helper
    def self.normalize_arguments( *args )
      return { :opts => {}, :args => [] } if args.empty?
      output = {}
      if args.last.is_a?( Hash )
        output[:opts] = args.pop || {}
      end
      output[:opts] ||= {}
      output[:args] = args || []
      return output
    end

    # checks if the given instance is in the inheritance
    # hierarchy of a given class
    def self.in_the_family?( child, parent )
      return false if parent.nil? || child.nil?
      return child == parent || in_the_family?(child.superclass, parent)
    end
  end
end