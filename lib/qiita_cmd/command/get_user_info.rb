require "qiita_cmd/command"

module QiitaCmd
  class Command < Thor
    desc "get_user_info USERNAME", "get_user_info of USERNAME"
    def get_user_info(username)
      conn = InitExecCmd.new.init_exec_cmd

      say "-------------------------------------"
      say "#{username} の基本情報取得"
      response = conn.get do |req|
        req.url "/api/v1/users/#{username}"
      end
      parsed_output_data = JSON.parse(response.body)
      say "------------------------------"
      say parsed_output_data["url_name"]
      say parsed_output_data["description"]
      say "------------------------------"

    end
  end
end
