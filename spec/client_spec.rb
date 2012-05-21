Bundler.require

describe SimpleFeed::Client do 
  it "can get feeds" do
    SimpleFeed::Client.new.should respond_to(:get_feeds)
  end
  
end