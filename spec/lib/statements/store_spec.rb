require 'spec_helper'

require 'ledgerdary/statements/store'

module Ledgerdary
  module Statements
    describe Store do
      subject { Store.new(account) }

      let(:account) { 'account' }

      describe '#store' do
        let(:filepath) { 'filepath' }
        let(:tempfile) { 'tempfile' }
        let(:id) { 'id' }

        let(:location) do
          instance_double('Location', filepath: filepath, id: id)
        end

        before do
          allow(IO).to receive(:copy_stream)
          allow(Location).to receive(:new) { location }
        end

        it 'creates a location using the account id' do
          expect(Location).to receive(:new).with(account: account)
          subject.store(tempfile)
        end

        it "copies tempfile's stream into filepath specified by location" do
          expect(IO).to receive(:copy_stream).with(tempfile, filepath)
          subject.store(tempfile)
        end

        it "returns the location's id" do
          expect(subject.store(tempfile)).to eq(id)
        end
      end
    end
  end
end
