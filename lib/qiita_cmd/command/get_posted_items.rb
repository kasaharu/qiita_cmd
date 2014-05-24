require "qiita_cmd/command"

module QiitaCmd
  class Command < Thor
    desc "get_posted_items USERNAME", "get_posted_items by USERNAME"
    def get_posted_items(username)
      conn = InitExecCmd.new.init_exec_cmd

      puts "-------------------------------------"
      puts "#{username} の投稿取得"
      response = conn.get do |req|
        req.url "/api/v1/users/#{username}/items"
      end
      puts "-------------------------------------"
      parsed_output_data = JSON.parse(response.body)
        puts "stock_count\t title"
      parsed_output_data.each do |ticket|
        puts "        #{ticket["stock_count"]}\t #{ticket["title"]}"
      end
    end
  end
end
