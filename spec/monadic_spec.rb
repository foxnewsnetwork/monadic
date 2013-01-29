require 'spec_helper'

describe Monadic do

  describe "api" do
    let(:dog) { Class.new { include Monadic } }
    let(:context) { Class.new }

    describe "class" do

      [:setup_context, :add_context, :get_context, :define_zero, :liftm, :contextify].each do |method|
        it "should respond to the #{method} method" do
          dog.should respond_to method
        end
      end

      describe "#define_zero" do
        pending "it should have tests"
      end

      describe "#setup_context" do
        it "should properly setup the contexts and allow me to retrieve" do
          dog.setup_context context
          dog.get_context(context.to_s.to_sym).should eq context
        end
      end
      
      describe "#get_context" do
        it "should get me nil if no such context exists" do
          dog.get_context(:nothing).should be_nil
        end
      end

      describe "#add_context" do
        before :each do
          class Cat; end
          class Bat; end 
          dog.add_context Cat
          dog.add_context Bat
        end

        it "should now have both context" do
          dog.get_context(:Cat).should eq Cat
          dog.get_context(:Bat).should eq Bat
        end
      end

      describe "#liftm" do
        pending "Need to have context defined in order to test this macro"
      end

      

      describe "#contextify" do
        pending "Need to have context defined in order to test this macro"
      end

    end

    describe "instance" do
      let(:fluffy) { dog.new }

      [:contextify, :empty?].each do |method|
        it "should respond_to the #{method} method" do
          fluffy.should respond_to method
        end
      end

      describe "#empty?" do 
        pending "need to have tests "
      end

      describe "#contextify" do
        pending "Need to have context defined in order to test this macro"
      end
    end
  end

end