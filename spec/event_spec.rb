require 'spec_helper'
require 'pry'
require_relative '../lib/event'

class Test
  attr_accessor :calls, :args
  def initialize
    @calls=0
    @args=[]
  end
  def call(*args)
    @calls+=1
    @args+=args
  end
end

RSpec.describe Event do
  subject(:subject) { described_class.new }
  let!(:test) {
    Test.new
  }

  let!(:hello) {
    {hello: []}
  }

  context "When nothing is subscribed " do
    it "does not call anything" do
      expect(subject.handlers.count).to eq 0
    end 
  end

  describe "subscribe" do
    it "assigns a value to handler" do
      subject.subscribe(test)
      expect(subject.handlers.count).to eq 1
    end

    it "assigns another value to handler" do
      subject.subscribe(test)
      subject.subscribe("hello")
      expect(subject.handlers.count).to eq 2
    end
  end

  describe "unsubscribe" do
    before do
      subject.subscribe(test)
      subject.subscribe("hello")
      subject.unsubscribe(test)
    end

    it "remove test value from handler" do
      expect(subject.handlers.count).to eq 1
    end
  end

  describe "broadcast" do
    before do
      subject.subscribe(test)
      subject.broadcast(1,"hello")
      allow(subject.handlers.first).to receive(:call).with(1,"hello")
    end

    it "remove test value from handler" do
      expect(subject.broadcast(1,"hello").first.calls).to eq 1
    end

    context "Unsubscribe test" do
      it "call hello and return empty array" do
        subject.unsubscribe(test)
        subject.broadcast(10)
        expect(subject.broadcast(10)).to eq []
      end
    end
  end
end