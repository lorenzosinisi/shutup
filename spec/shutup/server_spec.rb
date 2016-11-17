require "spec_helper"

module Shutup
  describe Server do
    describe '.current_dir' do
      it 'should return the current folder' do
        current_folder = File.expand_path(File.dirname('.'))
        expect(described_class.current_dir).to eq(current_folder)
      end
    end
    describe '.pid_file' do
      before { allow(described_class).to receive(:current_dir).and_return('') }
      it 'should eq /tmp/pids/server.pid' do
        expect(described_class.pid_file).to eq('/tmp/pids/server.pid')
      end
    end
    describe '.pid' do
      context 'with file' do
        before { allow(File).to receive(:read).and_return('111') }
        it 'should return the pid' do
          expect(described_class.pid).to eq('111')
        end
      end
      context 'without pid file' do
        it 'should raise an error' do
          expect {
            described_class.pid
            }.to raise_error(Errno::ENOENT)
          end
      end
    end
    describe '.hit!' do
      context 'with pid' do
        it 'should send kill -9 to system' do
          allow(described_class).to receive(:pid).and_return(1)
          expect(described_class).to receive(:system).with("kill -9 1")
          described_class.hit!
        end
      end
      context 'without pid' do
        it 'should return nil' do
          allow(described_class).to receive(:pid).and_return(false)
          expect(described_class.hit!).to eq(nil)
        end
      end
    end
  end
end
