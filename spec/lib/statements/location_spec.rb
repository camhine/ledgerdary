require 'spec_helper'

require 'ledgerdary/statements/location'

module Ledgerdary
  module Statements
    describe Location do

      describe '#create' do
        subject { Location.new(account: 'account') }

        let(:dir_exist?) { true }
        let(:now) { double('now', utc: utc) }
        let(:utc) { double('utc', iso8601: 'iso8601') }

        before do
          allow(Dir).to receive(:exist?) { dir_exist? }
          allow(FileUtils).to receive(:mkdir)
          allow(Time).to receive(:now) { now }
        end

        it "sets the location's filepath" do
          expect(subject.filepath).to \
          eq('/srv/ledgerdary/statements/account/iso8601')
        end

        it "sets the location's id" do
          expect(subject.id).to eq('iso8601')
        end

        context "when the location's directory doesn't exist yet" do
          let(:dir_exist?) { false }

          it 'creates the directory' do
            expect(FileUtils).to \
            receive(:mkdir).with('/srv/ledgerdary/statements/account')
            subject
          end
        end
      end
    end
  end
end
