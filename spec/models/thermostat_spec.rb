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

  describe '#up' do
    it 'increments the tempurature' do
      subject.up
      expect(subject.temperature).to be 21
    end
  end

  describe '#down' do
    it 'decrements the tempurature' do
      subject.down
      expect(subject.temperature).to be 19
    end
  end
end
