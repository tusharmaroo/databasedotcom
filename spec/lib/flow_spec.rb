require 'rspec'
require 'spec_helper'
require 'databasedotcom'

describe Databasedotcom::Flow do
  before do
    @client_mock = double("client")
    @flow = Databasedotcom::Flow.new(@client_mock, "TEST_FLOW_NAME", {foo: 'bar'})
  end

  describe "#run" do
    it "does a post with the correct params" do
      @client_mock.should_receive(:http_post).with("/services/data/v32.0/actions/custom/flow/TEST_FLOW_NAME", "{\"inputs\":[{\"foo\":\"bar\"}]}")
      @flow.run
    end

    context "when an API version is specified" do
      before do
        @flow = Databasedotcom::Flow.new(@client_mock, "TEST_FLOW_NAME", {foo: 'bar'}, {version: 40})
      end

      it "does a post with the correct params when version" do
        @client_mock.should_receive(:http_post).with("/services/data/v40/actions/custom/flow/TEST_FLOW_NAME", "{\"inputs\":[{\"foo\":\"bar\"}]}")
        @flow.run
      end
    end
  end
end