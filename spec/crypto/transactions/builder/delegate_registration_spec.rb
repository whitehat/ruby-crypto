describe ArkEcosystem::Crypto::Transactions::Builder::DelegateRegistration do
  let(:passphrase) { 'this is a top secret passphrase' }
  let(:second_passphrase) { 'this is a top secret second passphrase' }
  let(:username) { 'polo polo' }

  it 'should be ok with a passhrase' do
    ArkEcosystem::Crypto::Configuration::Network.set(ArkEcosystem::Crypto::Networks::Devnet)

    transaction = described_class.new
    .set_username(username)
    .sign(passphrase)

    expect(transaction.verify).to be_truthy
  end

  it 'should be ok with a second passphrase' do
    ArkEcosystem::Crypto::Configuration::Network.set(ArkEcosystem::Crypto::Networks::Devnet)

    transaction = described_class.new
    .set_username(username)
    .sign(passphrase)
    .second_sign(second_passphrase)

    second_public_key = ArkEcosystem::Crypto::Identities::PublicKey.from_passphrase(second_passphrase)

    expect(transaction.verify).to be_truthy
    expect(transaction.second_verify(BTC.to_hex(second_public_key))).to be_truthy
  end
end
