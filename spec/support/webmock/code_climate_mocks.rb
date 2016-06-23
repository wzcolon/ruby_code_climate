include WebMock::API

module CodeClimateMocks
  def self.mock_successful
    stub_request(:get, "https://codeclimate.com/api/repos").
      with(query: { api_token: '123' }).
      to_return(body: "[{\"id\":\"123\",\"url\":\"ssh://git@github.com/wzcolon/bunnies.git\",\"branch\":\"master\"},{\"id\":\"456\",\"url\":\"ssh://git@github.com/wzcolon/butterflies.git\",\"branch\":\"master\"},{\"id\":\"789\",\"url\":\"ssh://git@github.com/wzcolon/manyly_things.git\",\"branch\":\"master\"}]", status: 200)

    stub_request(:get, "https://codeclimate.com/api/repos/123?api_token=123").
      to_return(body: "{\"id\":\"123\",\"account_id\":\"12345\",\"name\":\"Bunnies\",\"url\":\"ssh://git@github.com/wzcolon/bunnies.git\",\"branch\":\"master\",\"created_at\":1378219896,\"last_snapshot\":{\"id\":\"5762edb9bb848e0001048749\",\"repo_id\":\"123\",\"commit_sha\":\"8d0c1a807181b42b47d0b5af7de55c494c8e52c9\",\"committed_at\":1466101163,\"finished_at\":1466101193,\"gpa\":3.26,\"covered_percent\":null,\"worker_version\":18},\"previous_snapshot\":{\"id\":\"123\",\"repo_id\":\"123\",\"commit_sha\":\"8d0c1a807181b42b47d0b5af7de55c494c8e52c9\",\"committed_at\":1466101163,\"finished_at\":1466101193,\"gpa\":3.26,\"covered_percent\":null,\"worker_version\":18}}", status: 200)
  end
end
