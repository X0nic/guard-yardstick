# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Guard::Yardstick do
  subject(:guard) { Guard::Yardstick.new(options) }
  let(:options) { {} }

  describe '#options' do
    subject { super().options }

    context 'by default' do
      let(:options) { {} }

      describe '[:all_on_start]' do
        subject { super()[:all_on_start] }
        it { should be_truthy }
      end
    end
  end
end
