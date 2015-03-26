module Databasedotcom
  # A Salesforce Flow

  class Flow
    def initialize(client, flow_url, params = {})
      @client = client
      @flow_url = flow_url
      @params = params
    end

    def run
      params_hash = {inputs: [@params]}
      @client.http_post(@flow_url, params_hash.to_json)
    end
  end
end