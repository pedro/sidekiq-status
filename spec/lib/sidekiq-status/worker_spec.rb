require 'spec_helper'

describe Sidekiq::Status::Worker do

  let!(:job_id) { SecureRandom.hex(12) }

  describe ".perform_async" do
    it "generates and returns job id" do
      SecureRandom.should_receive(:hex).once.and_return(job_id)
      StubJob.perform_async().should == job_id
    end
  end

  describe ".expiration" do
    subject { StubJob.new }
    it "allows to set/get expiration" do
      expect(subject.expiration).to be_nil
      subject.expiration = :val
      expect(subject.expiration).to eq(:val)
    end
  end
end
