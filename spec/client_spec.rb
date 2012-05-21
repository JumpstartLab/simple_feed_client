Bundler.require

describe SimpleFeed::Client do 
  let(:client) do
    SimpleFeed::Client.new(:basic_auth => {:login => 'j3', :password => 'hungry'})
  end

  describe ".get_feeds" do
    it "can get feeds" do
      client.should respond_to(:get_feeds)
    end

    it "gets a 200 response" do
      client.get_feeds.first.status.should == 200
    end
  end

  
end