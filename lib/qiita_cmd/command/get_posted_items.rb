require "qiita_cmd/command"

module QiitaCmd
  class Command < Thor
    desc "get_posted_items USERNAME", "get_posted_items by USERNAME"
    def get_posted_items(username)
      conn = InitExecCmd.new.init_exec_cmd

      say "-------------------------------------"
      say "#{username} の投稿取得"
      response = conn.get do |req|
        req.url "/api/v1/users/#{username}/items"
      end
      say "-------------------------------------"
      parsed_output_data = JSON.parse(response.body)
        say "stock_count\t title"
      parsed_output_data.each do |ticket|
        say "        #{ticket["stock_count"]}\t #{ticket["title"]}"
      end
    end
  end
end
