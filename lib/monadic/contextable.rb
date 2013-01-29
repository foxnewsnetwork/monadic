module Monadic
  module Contextable

    def initialize( pure=nil )
      @_pure = pure
      @_empty_flag = @_pure.nil? || @_pure.empty?
    end

    def empty?
      @_empty_flag
    end

    def purify
      @_pure
    end

  end
end