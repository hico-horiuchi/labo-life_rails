require 'spec_helper'

describe TopController do  describe '#index' do
    before do
      get :index
    end
    it { expect( response ).to be_success }
    it { expect( response ).to render_template( :index ) }
  end
end
