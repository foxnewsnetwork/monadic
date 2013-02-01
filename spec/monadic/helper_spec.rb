require 'spec_helper'

describe Monadic::Helper do

  let(:api) { Monadic::Helper }
  describe "#normalize_arguments" do

    it "should return an array" do
      api.normalize_arguments( 1,2,3,4,5, :dog => :cat ).should be_a Hash
    end

    it "should correctly parse the arguments into their appropriate bins" do
      api.normalize_arguments(1,2,3, :dog => :cat)[:args].should eq [1,2,3]
      api.normalize_arguments(1,2,3, :dog => :cat)[:opts].should eq :dog => :cat
    end

    it "should give me predictable goods even when called with really shitty parameters" do
      api.normalize_arguments[:args].should be_a Array
      api.normalize_arguments[:args].should be_empty
      api.normalize_arguments[:opts].should be_a Hash 
      api.normalize_arguments[:opts].should be_empty
    end

  end

  describe "#in_the_family?" do
    let(:klass) { Class.new }
    let(:grandchild) { Class.new Class.new Class.new klass }
    it "should return true for things that are obviously in the family" do
      api.in_the_family?(klass, klass).should be_true
    end

    it "should still be true for the grandchild" do
      api.in_the_family?(grandchild, klass).should be_true
    end

    it "should fail for things not in the family" do
      api.in_the_family?(Object, klass).should_not be_true
    end
  end

end