RSpec.describe TransparentData::Configurable do
  describe '#initialize_config_accessors' do
    subject do
      Module.new do
        extend TransparentData::Configurable

        initialize_config_accessors(:example_attr)
      end
    end

    it 'has an accessor' do
      expect(subject.methods).to include :example_attr
      expect(subject.methods).to include :'example_attr='
    end
  end
end
