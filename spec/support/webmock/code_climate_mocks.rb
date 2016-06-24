include WebMock::API

module CodeClimateMocks
  def self.mock_successful
    stub_request(:get, "https://codeclimate.com/api/repos").
      with(query: { api_token: '123' }).
      to_return(body: "[{\"id\":\"123\",\"url\":\"ssh://git@github.com/wzcolon/bunnies.git\",\"branch\":\"master\"},{\"id\":\"456\",\"url\":\"ssh://git@github.com/wzcolon/butterflies.git\",\"branch\":\"master\"},{\"id\":\"789\",\"url\":\"ssh://git@github.com/wzcolon/manyly_things.git\",\"branch\":\"master\"}]", status: 200)

    stub_request(:get, "https://codeclimate.com/api/repos/123?api_token=123").
      to_return(body: "{\"id\":\"123\",\"account_id\":\"12345\",\"name\":\"Bunnies\",\"url\":\"ssh://git@github.com/wzcolon/bunnies.git\",\"branch\":\"master\",\"created_at\":1378219896,\"last_snapshot\":{\"id\":\"5762edb9bb848e0001048749\",\"repo_id\":\"123\",\"commit_sha\":\"8d0c1a807181b42b47d0b5af7de55c494c8e52c9\",\"committed_at\":1466101163,\"finished_at\":1466101193,\"gpa\":3.26,\"covered_percent\":null,\"worker_version\":18},\"previous_snapshot\":{\"id\":\"123\",\"repo_id\":\"123\",\"commit_sha\":\"8d0c1a807181b42b47d0b5af7de55c494c8e52c9\",\"committed_at\":1466101163,\"finished_at\":1466101193,\"gpa\":3.26,\"covered_percent\":null,\"worker_version\":18}}", status: 200)

    stub_request(:get, "https://codeclimate.com/api/repos/123/branches/master?api_token=123").
      to_return(:status => 200, :body => "{\"id\":\"4906075af3ea000dc6000740\",\"account_id\":\"3d415d14a1747d5991000001\",\"name\":\"Sox Talk\",\"url\":\"ssh://git@github.com/redsox/soxtalk.git\",\"branch\":\"master\",\"created_at\":1343686490,\"last_snapshot\":{\"id\":\"407c8d1d13d637023100016c\",\"repo_id\":\"4907075af3ea000dc6000740\",\"commit_sha\":\"72f1c6ae07cc465df70aa372dc972e835f355972\",\"committed_at\":1368165656,\"finished_at\":1368165666,\"gpa\":3.05,\"covered_percent\":46},\"previous_snapshot\":{\"id\":\"4074d085c7f3a364f100667a\",\"repo_id\":\"4907075af3ea000dc6000740\",\"commit_sha\":\"02bcca40eafc7832160a08eef8f091e0896e2cec\",\"committed_at\":1367646334,\"finished_at\":1367658637,\"gpa\":3.04,\"covered_percent\":23}}")
  end
end
