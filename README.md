[![Code Climate](https://codeclimate.com/github/wzcolon/ruby_code_climate/badges/gpa.svg)](https://codeclimate.com/github/wzcolon/ruby_code_climate)

# RubyCodeClimate

Simple Ruby Wrapper for the Code Climate API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_code_climate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_code_climate


## Configure

```ruby
# config/initializers/code_climate.rb
RubyCodeClimate.configuration do |config|
  config.api_token = 'your_token_here'
end
```

## Usage

### GET /api/repos
```ruby
CodeClimate.get_repos
```

Example Response:
```
[
  {
    "id": "4906075af3ea000dc6000740",
      "url": "ssh://git@github.com/redsox/soxtalk.git",
      "branch": "master"
  },
  {
    "id": "1222075af3ea000dc6000799",
    "url": "ssh://git@github.com/redsox/baseball.git",
    "branch": "dev"
  }
]
```

GET /api/repos/:repo_id
```ruby
CodeClimate.get_repo(repo_id: '123')
```

Example Reponse:
```
{
  "id": "4906075af3ea000dc6000740",
  "account_id": "3d415d14a1747d5991000001",
  "name": "Sox Talk",
  "url": "ssh://git@github.com/redsox/soxtalk.git",
  "branch": "master",
  "created_at": 1343686490,
  "last_snapshot": {
    "id": "407c8d1d13d637023100016c",
    "repo_id": "4907075af3ea000dc6000740",
    "commit_sha": "72f1c6ae07cc465df70aa372dc972e835f355972",
    "committed_at": 1368165656,
    "finished_at": 1368165666,
    "gpa": 3.05,
    "covered_percent": 46
  },
  "previous_snapshot": {
    "id": "4074d085c7f3a364f100667a",
    "repo_id": "4907075af3ea000dc6000740",
    "commit_sha": "02bcca40eafc7832160a08eef8f091e0896e2cec",
    "committed_at": 1367646334,
    "finished_at": 1367658637,
    "gpa": 3.04,
    "covered_percent": 23
  }
}
```

POST /api/repos/:repo_id/refresh
```ruby
CodeClimate.refresh_repo(repo_id: '123')
```

This will return either true or false based on the response from CodeClimate


GET /api/repos/:repo_id/branches/:branch_name
```ruby
CodeClimate.get_branch(repo_id: '123', branch_name: 'master')
```

Example Response:
```
{
  "id": "4906075af3ea000dc6000740",
  "account_id": "3d415d14a1747d5991000001",
  "name": "Sox Talk",
  "url": "ssh://git@github.com/redsox/soxtalk.git",
  "branch": "master",
  "created_at": 1343686490,
  "last_snapshot": {
    "id": "407c8d1d13d637023100016c",
    "repo_id": "4907075af3ea000dc6000740",
    "commit_sha": "72f1c6ae07cc465df70aa372dc972e835f355972",
    "committed_at": 1368165656,
    "finished_at": 1368165666,
    "gpa": 3.05,
    "covered_percent": 46
  },
  "previous_snapshot": {
    "id": "4074d085c7f3a364f100667a",
    "repo_id": "4907075af3ea000dc6000740",
    "commit_sha": "02bcca40eafc7832160a08eef8f091e0896e2cec",
    "committed_at": 1367646334,
    "finished_at": 1367658637,
    "gpa": 3.04,
    "covered_percent": 23
  }
}
```
POST /api/repos/:repo_id/branches/:branch_name/refresh
```ruby
CodeClimate.refresh_branch(repo_id: '123', branch_name: 'master')
```

This will return either true or false based on the response from CodeClimate

## Other Info

All attributes of objects returned can be accessed with method calls. For instance, if you request a single repo, you can ask it for it's gpa directly.

```ruby
repo = CodeClimate.get_repo(repo_id: '123')
repo.name # 'Sox Talk'
repo.gpa # 3.05
repo.last_gpa # 3.04
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wzcolon/ruby_code_climate.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

