require 'spec_helper'

describe Monadic::Context do

  describe "api" do
    let(:api) { Monadic::Context }

    describe "class" do
      
      it "should include the contextable module" do
        api.should include Monadic::Contextable
      end

    end

    describe "instance" do
      let(:instance) { api.new }

      [:empty?, :purify].each do |method|
        it "should respond to the #{method} method" do
          instance.should respond_to method
        end
      end

      describe "functionality" do
        let(:klass) { Class.new { include Monadic } }

        describe "#empty?" do
          let(:full) { api.new klass.new }

          it "should recognize something initialized with nil as empty" do
            instance.should be_empty
          end

          it "should recognize that somethings are not empty" do
            full.should_not be_empty
          end
        end

        describe "#purify" do
          let(:full) { api.new klass.new }

          it "should give me the correct object" do
            full.purify.should be_a klass
          end

          it "should return nil when it's empty" do
            instance.purify.should be_nil
          end
        end

      end
    end

  end

end