require 'spec_helper'

require 'ledgerdary/statements/store'

module Ledgerdary::Statements
  describe Store do
    subject { Store.new(account_id) }

    let(:account_id) { 'account id' }

    describe '#store' do
      let(:filepath) { 'filepath' }
      let(:location) { instance_double('Location', filepath: filepath, id: id) }
      let(:tempfile) { 'tempfile' }
      let(:id) { 'id' }

      before do
        allow(IO).to receive(:copy_stream)
        allow(Location).to receive(:new) { location }
      end

      it "creates a location using the account id" do
        expect(Location).to receive(:new).with(account_id)
        subject.store(tempfile)
      end

      it "copies tempfile's stream into the filepath specified by the location" do
        expect(IO).to receive(:copy_stream).with(tempfile, filepath)
        subject.store(tempfile)
      end

      it "returns the location's id" do
        expect(subject.store(tempfile)).to eq(id)
      end
    end
  end
end
