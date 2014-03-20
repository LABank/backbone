#encoding: utf-8
require 'spec_helper'

describe Vacuum do
  let(:vacuum) { Vacuum.new( Rails.root + "db/import/journal.xlsx")}
  describe '#start' do

    it 'should return a transaction list' do
      transactions = vacuum.start
      transactions[0].should eq({ 
        date:'Thu, 27 Feb 2014 00:00:00 +0000', 
        expeditor: 'Sebastien Nedjar', 
        origin: 'LAB', 
        destination: 'Olivier Pons', 
        amount: 500, 
        reference: 'Achat d\'écrous'})
    end
  end
end
