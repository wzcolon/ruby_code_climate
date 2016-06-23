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
  end
end
