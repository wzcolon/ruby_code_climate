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
  def self.refresh_repo(repo_id:)
    connection = connection("/api/repos/#{repo_id}/refresh")
    response = connection.post(query: { api_token: api_token })

    response.status == 200 ? true : false
  end

  # GET /api/repos/:repo_id/branches/:branch_name
  def self.get_branch(repo_id:, branch_name:)
    connection = connection("/api/repos/#{repo_id}/branches/#{branch_name}")
    response = connection.get(query: { api_token: api_token })

    Branch.new(JSON.parse(response.body))
  end

  # POST /api/repos/:repo_id/branches/:branch_name/refresh
  def self.refresh_branch(repo_id:, branch_name:)
    connection = connection("/api/repos/#{repo_id}/branches/#{branch_name}/refresh")
    response = connection.post(query: { api_token: api_token })

    response.status == 200 ? true : false
  end
  private

  def self.connection(url)
    Excon.new(BASE_URL+url)
  end

  def self.api_token
    RubyCodeClimate.configuration.api_token
  end
end
