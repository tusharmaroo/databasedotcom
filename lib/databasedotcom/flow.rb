module Databasedotcom
  # A Salesforce Flow

  class Flow
    def initialize(client, flow_url, params)
      @client = client
      @flow_url = flow_url
      @params = params
    end

    def run
      @client.http_post(@flow_url, nil, @params)
    end
  end
end