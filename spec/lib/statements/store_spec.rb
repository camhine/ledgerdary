require 'spec_helper'

require 'ledgerdary/statements/store'

module Ledgerdary::Statements
  describe Store do
    subject { Store.new(account_id) }

    let(:account_id) { 'account id' }

    describe '#store' do
      let(:filepath) { 'filepath' }
      let(:location) { instance_double('Location', filepath: filepath, url: url) }
      let(:tempfile) { 'tempfile' }
      let(:url) { 'url' }

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

      it "returns the location's url" do
        expect(subject.store(tempfile)).to eq(url)
      end
    end
  end
end
