require 'spec_helper'

describe 'Static pages' do
  describe 'root url' do
    it 'should work just fine' do
      get '/'
      expect(response.status).to eq(200)
    end
  end
end
