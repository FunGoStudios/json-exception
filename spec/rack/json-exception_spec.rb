require 'spec_helper'
require 'rack/lint'
require 'rack/mock'

describe Rack::JsonException do
  before do
    @logger = Object.new
    @logger.stub(:write).and_return(true)
  end

  def json_exception(app)
    Rack::Lint.new Rack::JsonException.new(app, @logger)
  end

  it 'raises exceptions' do
    req = Rack::MockRequest.new(
      json_exception(
        lambda{|env| raise RuntimeError }
    ))

    @logger.should_receive(:write)
    lambda{
      req.get("/")
    }.should raise_error(RuntimeError)
  end
end
