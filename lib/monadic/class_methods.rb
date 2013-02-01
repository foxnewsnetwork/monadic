module Monadic
  module ClassMethods

    def contextify( *args )
      params = Monadic::Helper.normalize_arguments *args
      opts = params[:opts]
      object = params[:args].shift
      if object.nil?
        subject = nil
      else
        if object.respond_to?(:contextify) && Monadic::Helper.in_the_family?(object.class, self)
          subject = object
        else
          throw :InappropriateContextifcation
        end   
      end
      context = get_context opts[:as] unless opts[:as].nil?
      context ||= get_context @_first_context_key
      throw :NoSuchContextAvailible if context.nil?
      context.new *params[:args].unshift( subject )
    end

    def setup_context( context, opts={} )
      @_monadic_context = {}
      add_context context, opts
    end

    def add_context( context, opts={} )
      key = opts[:as]
      key ||= context
      if @_monadic_context.nil? || @_monadic_context.empty?
        @_first_context_key = key.to_s
        @_monadic_context ||= {}
      end
      @_monadic_context[key.to_s] = context
    end

    def get_context( key )
      @_monadic_context ||= {}
      @_monadic_context[key.to_s]
    end

    def define_zero( &block )

    end

    def liftm

    end
  end
end