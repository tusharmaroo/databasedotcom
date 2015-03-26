module Databasedotcom
  # A Salesforce Flow

  class Flow
    def initialize(client, flow_name, params = {}, options = {})
      @client = client
      @flow_name = flow_name
      @params = params
      @version = options[:version] || '32.0'
    end

    def run
      params_hash = {inputs: [@params]}
      @client.http_post(flow_url, params_hash.to_json)
    end

    protected

    def flow_url
      "/services/data/v#{@version}/actions/custom/flow/#{@flow_name}"
    end
  end
end

