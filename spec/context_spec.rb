require 'spec_helper'

describe DCI::Context do
  class TestContext
    include DCI::Context

    def run_in_context
      in_context do
        yield
      end
    end
  end

  class TestRole
    include DCI::ContextAccessor
  end

  describe "#in_context" do
    let(:context)        { TestContext.new }
    let(:nested_context) { TestContext.new }
    let(:role)           { TestRole.new }

    it "passes on returned value" do
      return_value = context.run_in_context { "RETURNED VALUE" }

      expect(return_value).to eql "RETURNED VALUE"
    end

    it "maintains stack of contexts" do
      actual_context = context.run_in_context do
        nested_context.run_in_context{}
        role.context
      end

      expect(actual_context).to eql context
    end

    context "when nested int another context" do
      it "maintains stack of contexts (nested case)" do
        context.run_in_context do
          actual_nested_context = nested_context.run_in_context do
            role.context
          end

          expect(actual_nested_context).to eql nested_context
        end
      end
    end
  end
end
