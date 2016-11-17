require "spec_helper"

describe Shutup do
  it "has a version number" do
    expect(Shutup::VERSION).not_to be nil
  end

  describe '.process' do
    context 'without args' do
      it 'shoult fail' do
        expect {
          described_class.process
          }.to raise_error(ArgumentError)
      end
    end

    context 'when the service is implemented' do
      it 'should kill the service' do
        expect(Shutup::Server).to receive(:hit!)
        described_class.process(name: 'server')
      end
    end

    context 'when the service is NOT implemented' do
      it 'should kill the service' do
        expect(described_class.process(name: 'batman')).to eq(false)
      end
    end
  end


  describe '.server' do
    it 'should receive :hit and :delete_pid' do
      allow(Shutup::Server).to receive(:pid)
      expect(Shutup::Server).to receive(:hit!).and_return(true)
      expect(Shutup::Server).to receive(:delete_pid)
      Shutup.server
    end
  end
end
