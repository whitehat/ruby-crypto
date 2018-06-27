require "spec_helper"

require 'btcruby'
require 'ark_crypto/crypto'
require 'ark_crypto/serialisers/transfer'

describe ArkCrypto::Serialisers::Transfer do
  let(:transaction) {}

  describe '#serialise' do
    it 'should be ok' do
      serialiser = ArkCrypto::Serialisers::Transfer.new(transaction)

      actual = serialiser.serialise

      expect(actual).to eq(transaction[:serialized])
    end
  end
end