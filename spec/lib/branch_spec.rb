require 'spec_helper'

describe Branch do

  it 'is a Hashie::Mash' do
    expect(described_class.new).to be_a Hashie::Mash
  end

  describe 'instance_methods' do
    let(:branch) { described_class.new(branch_params) }

    specify 'responds to appropriate method calls' do
      expect(branch.id).to eq '123'
      expect(branch.account_id).to eq '12345'
      expect(branch.name).to eq 'Bunnies'
      expect(branch.url).to eq 'ssh://git@github.com/wzcolon/bunnies.git'
      expect(branch.branch).to eq 'master'
      expect(branch.created_at).to eq 1378219896

      expect(branch.last_snapshot.gpa).to eq 3.26
    end

    describe '#current_gpa' do
      specify 'returns the current gpa' do
        expect(branch.current_gpa).to eq 3.26
      end
    end

    describe '#previous_gpa' do
      specify 'returns the previous gpa' do
        expect(branch.previous_gpa).to eq 3.26
      end
    end
  end

  def branch_params
    {"id"=>"123",
      "account_id"=>"12345",
      "name"=>"Bunnies",
      "url"=>"ssh://git@github.com/wzcolon/bunnies.git",
      "branch"=>"master",
      "created_at"=>1378219896,
      "last_snapshot"=>
    {"id"=>"5762edb9bb848e0001048749",
      "repo_id"=>"123",
      "commit_sha"=>"8d0c1a807181b42b47d0b5af7de55c494c8e52c9",
      "committed_at"=>1466101163,
      "finished_at"=>1466101193,
      "gpa"=>3.26,
      "covered_percent"=>nil,
      "worker_version"=>18
    },
      "previous_snapshot"=>
    {"id"=>"123",
      "repo_id"=>"123",
      "commit_sha"=>"8d0c1a807181b42b47d0b5af7de55c494c8e52c9",
      "committed_at"=>1466101163,
      "finished_at"=>1466101193,
      "gpa"=>3.26,
      "covered_percent"=>nil,
      "worker_version"=>18
    }}
  end
end
