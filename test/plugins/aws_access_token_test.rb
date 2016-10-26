require_relative '../test_helper'

require 'plugins/base_plugin'
require 'plugins/aws_access_token'

describe Vcsmap::Plugin::AwsAccessToken do
  let(:plugin) { Vcsmap::Plugin::AwsAccessToken.new }

  let(:file) do
    <<-eos
      [contoso]
      aws_access_key_id = AKIAED8B369A90EDAB2A
      aws_secret_access_key = EAB37ae33174B8A2B0f0/3798C78ca26EAB37AE3
    eos
  end

  describe '#capture_match' do
    it 'must return the matched AWS key pair' do
      credentials = plugin.credentials(file)

      expected = ['AKIAED8B369A90EDAB2A', 'EAB37ae33174B8A2B0f0/3798C78ca26EAB37AE3']
      credentials.must_equal expected
    end
  end
end
