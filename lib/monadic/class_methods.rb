module Monadic
  module ClassMethods
    def purify

    end

    def contextify( object, opts={} )
      throw :InappropriateContextifcation unless object.respond_to?( :contextify ) && object.is_a?( self )
      context = get_context opts[:as] unless opts[:as].nil?
      context ||= get_context @_first_context_key
      throw :NoSuchContextAvailible if context.nil?
      context.new object
    end

    def setup_context( context )
      @_monadic_context = {}
      add_context context
    end

    def add_context( context )
      if @_monadic_context.nil? || @_monadic_context.empty?
        @_first_context_key = context.to_s.to_sym
        @_monadic_context ||= {}
      end
      @_monadic_context[context.to_s.to_sym] = context
    end

    def get_context( key )
      @_monadic_context ||= {}
      @_monadic_context[key]
    end

    def define_zero( &block )

    end

    def liftm

    end
  end
end