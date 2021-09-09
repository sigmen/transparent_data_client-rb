RSpec.describe TransparentData::Response do
  subject(:instance) { described_class.new(response) }

  let(:response) do
    double(body: data, headers: { 'X-Header' => 'example' }, success?: true, status: 200)
  end

  let(:data) { '{ "x": "y" }' }

  describe 'delegators' do
    %w[headers success? status].each do |method_name|
      it "##{method_name} delegated from the raw response" do
        expect(instance.public_send(method_name)).to eq response.public_send(method_name)
      end
    end
  end

  describe '#body' do
    subject(:body) { described_class.new(response).body }

    context 'when the body contains a valid json' do
      let(:result) { { content: { x: 'y' } } }

      it { is_expected.to eq result }
    end

    context 'when the body contains an invalid json' do
      let(:data) { '<html></html>' }
      let(:result) { { content: data } }

      it { is_expected.to eq result }
    end
  end
end
