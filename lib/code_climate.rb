class CodeClimate
  BASE_URL='https://codeclimate.com'

  # GET /api/repos
  def self.get_repos
    connection = connection('/api/repos')
    response = connection.get(query: { api_token: api_token })

    repos = JSON.parse(response.body)
    repos.map { |repo| Repo.new(repo) }
  end

  # GET /api/repos/:repo_id
  def self.get_repo(repo_id:)
    connection = connection("/api/repos/#{repo_id}")
    response = connection.get(query: { api_token: api_token })

    Repo.new(JSON.parse(response.body))
  end

  # POST /api/repos/:repo_id/refresh
  # GET /api/repos/:repo_id/branches/:branch_name
  # POST /api/repos/:repo_id/branches/:branch_name/refresh
  #
  private

  def self.connection(url)
    Excon.new(BASE_URL+url)
  end

  def self.api_token
    RubyCodeClimate.configuration.api_token
  end
end
