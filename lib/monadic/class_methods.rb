module Monadic
  module ClassMethods
    def purify

    end

    def contextify

    end

    def setup_context( context )
      @_monadic_context = {}
      add_context context
    end

    def add_context( context )
      @_monadic_context ||= {}
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