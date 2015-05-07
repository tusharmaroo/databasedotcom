module Databasedotcom
  # A Salesforce API endpoint that can trigger predefinted flows in salesforce to kick off salesforce side processes.
  # A flow can be triggered by its unique name and can be passed a hash of input variables.

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

