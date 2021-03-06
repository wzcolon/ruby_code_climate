require 'spec_helper'

describe CodeClimate do
  describe 'class methods' do
    before do
      RubyCodeClimate.configure do |config|
        config.api_token = '123'
      end
    end

    describe 'get_repos' do
      specify 'returns a list of repositories' do
        expect(described_class.get_repos).to eq [
          {"id"=>"123", "url"=>"ssh://git@github.com/wzcolon/bunnies.git", "branch"=>"master"},
          {"id"=>"456", "url"=>"ssh://git@github.com/wzcolon/butterflies.git", "branch"=>"master"},
          {"id"=>"789", "url"=>"ssh://git@github.com/wzcolon/manyly_things.git", "branch"=>"master"}
        ]

        expect(described_class.get_repos.map(&:class).uniq.count).to eq 1
        expect(described_class.get_repos.first).to be_a Repo
      end
    end

    describe 'get_repo' do
      specify 'returns a single repository' do
        expect(described_class.get_repo(repo_id: '123')).to be_a Repo
      end
    end

    describe 'refresh_repo' do
      describe 'when successful' do
        specify 'returns true' do
          allow_any_instance_of(Excon::Connection).to receive(:post).and_return(Hashie::Mash.new(status: 200))
          expect(described_class.refresh_repo(repo_id: '123')).to be_truthy
        end
      end

      describe 'when unsuccessful' do
        specify 'returns false' do
          allow_any_instance_of(Excon::Connection).to receive(:post).and_return(Hashie::Mash.new(status: 400))
          expect(described_class.refresh_repo(repo_id: '123')).to be_falsey
        end
      end
    end

    describe 'get_branch' do
      specify 'returns a single branch' do
        expect(described_class.get_branch(repo_id: '123', branch_name: 'master')).to be_a Branch
      end
    end

    describe 'refresh_branch' do
      describe 'when successful' do
        specify 'returns true' do
          allow_any_instance_of(Excon::Connection).to receive(:post).and_return(Hashie::Mash.new(status: 200))
          expect(described_class.refresh_branch(repo_id: '123', branch_name: 'master')).to be_truthy
        end
      end

      describe 'when unsuccessful' do
        specify 'returns false' do
          allow_any_instance_of(Excon::Connection).to receive(:post).and_return(Hashie::Mash.new(status: 400))
          expect(described_class.refresh_branch(repo_id: '123', branch_name: 'master')).to be_falsey
        end
      end
    end
  end
end
