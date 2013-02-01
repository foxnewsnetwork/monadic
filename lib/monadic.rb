module Monadic
  autoload :Context, File.join(File.dirname(__FILE__), "monadic", "context")
  autoload :Contextable, File.join(File.dirname(__FILE__), "monadic", "contextable")
  autoload :ClassMethods, File.join(File.dirname(__FILE__), "monadic", "class_methods")
  autoload :InstanceMethods, File.join(File.dirname(__FILE__), "monadic", "instance_methods")
  autoload :Helper, File.join(File.dirname(__FILE__), "monadic", "helper")
  def self.included(base)
    base.extend(ClassMethods)
    base.class_exec do
      include InstanceMethods

      def self.inherited(b)
        b.extend(ClassMethods)
      end

    end
  end

end