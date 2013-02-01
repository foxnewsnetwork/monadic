require 'spec_helper'

describe Monadic::Contextable do

  context "multiplicity" do
    let(:handicapable) { Class.new { include Monadic::Contextable } }
    let(:doable) { Class.new Monadic::Context }
    let(:klass) { Class.new { include Monadic } }

    before :each do
      klass.setup_context handicapable, :as => :handicapable
      klass.add_context doable, :as => :doable
    end

    it "should have modified the instance invariable that stores the keys" do
      var = klass.instance_variable_get :@_monadic_context
      var.should be_a Hash
      var.keys.should include "handicapable"
      var.keys.should include "doable"
    end

    describe "#get_context" do
      it "should allow me to retreive the contexts I want when I provide their matching keys" do
        klass.get_context( :handicapable ).should eq handicapable
        klass.get_context( :doable ).should eq doable
      end
    end

    describe "#contextify" do
      context "default" do
        context "zero" do
          subject { klass.contextify }

          it "should give me the handicapable context that corresponds to the zero of klass if defined, nil otherwise" do
            should be_a handicapable
            should be_empty
          end
        end
        context "nonzero" do
          subject { klass.contextify klass.new }

          it "should still give me a handicapable context, but it should no longer be zero" do
            should be_a handicapable
            should_not be_empty
          end
        end
      end
      context ":as => something" do
        context "zero" do
          subject { klass.contextify :as => :doable }

          it "should give me a doable context that correspondsd to the zero of klass" do
            should be_a doable
            should be_empty
          end
        end
        context "nonzero" do
          subject { klass.contextify klass.new, :as => :doable }

          it "should give me a doable context that is not zero" do
            should be_a doable
            should_not be_empty
          end
        end
      end
    end

  end

end