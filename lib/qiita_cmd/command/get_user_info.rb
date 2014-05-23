require "qiita_cmd/command"

module QiitaCmd
  class Command < Thor
    desc "get_user_info USERNAME", "get_user_info of USERNAME"
    def get_user_info(username)
      conn = InitExecCmd.new.init_exec_cmd

      puts "-------------------------------------"
      puts "#{username} の基本情報取得"
      response = conn.get do |req|
        req.url "/api/v1/users/#{username}"
      end
      parsed_output_data = JSON.parse(response.body)
      puts "------------------------------"
      puts parsed_output_data["url_name"]
      puts parsed_output_data["description"]
      puts "------------------------------"

    end
  end
end
