require 'json'
require 'faraday'

class InitExecCmd
  def init_exec_cmd
    Faraday::Connection.new(:url => 'https://qiita.com') do |builder|
      builder.adapter Faraday.default_adapter
    end
  end
end
