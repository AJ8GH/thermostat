describe Thermostat do
  describe '.instance' do
    it 'creates an instance of itself and stores it' do
      instance = described_class.instance
      expect(described_class.instance).to be instance
    end
  end

  describe '#temperature' do
    it 'is 20 by default' do
      expect(subject.temperature).to be 20
    end
  end

  describe '#update_temperature' do
    it 'changes the tempurature' do
      subject.update_temperature(21)
      expect(subject.temperature).to be 21
    end
  end
end
