describe DatabaseConnection do
  describe '.setup' do
    it 'creates a connection to mongodb' do
      expect(Mongo::Client).to receive(:new).with(['127.0.0.1:27017'], database: 'thermostatTest')
      described_class.setup('thermostatTest')
    end
  end

  describe '.insert' do
    xit 'querys the database through the stored connection' do
      client = described_class.setup('thermostatTest')
      # db = client.database
      # settings = db.collections[0]
      new_temperature = { temperature: 25 }
      expect(client).to receive(:database).with(new_temperature)

      described_class.insert(temperature: 25)
    end
  end
end
