require 'spec_helper' 

describe Monadic::ClassMethods do


  describe "inheritance" do
    let(:parent) { Class.new { include Monadic } }
    let(:child) { Class.new parent }

    context "collisons" do
      let(:readable) { Class.new { include Monadic::Contextable } }
      let(:viewable) { Class.new { include Monadic::Contextable } }

      before(:each) do
        parent.setup_context readable
        child.setup_context viewable
      end

      it "should have different contexts for the parent and the child" do
        parent.get_context(readable.to_s.to_sym).should eq readable
        child.get_context(viewable.to_s.to_sym).should eq viewable
      end

    end
  end

end