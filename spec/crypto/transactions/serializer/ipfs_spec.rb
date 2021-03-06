describe ArkEcosystem::Crypto::Transactions::Serializers::IPFS do
  describe '#serialize' do
    skip 'should be ok' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/ipfs/passphrase.json'), object_class: OpenStruct)

      ArkEcosystem::Crypto::Configuration::Network.set(ArkEcosystem::Crypto::Networks::Devnet)

      actual = ArkEcosystem::Crypto::Transactions::Serializer.new(transaction.data).serialize

      expect(actual).to eq(transaction.serialized)
    end
  end
end
