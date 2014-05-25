require "qiita_cmd/command"

module QiitaCmd
  class Command < Thor
    desc "find_mutual_following_users USERNAME_A USERNAME_B",
      "find_mutual_following_users to USER_A and USER_B"
    def find_mutual_following_users(user_a, user_b)
      conn = InitExecCmd.new.init_exec_cmd


      follow_by_a = []
      follow_by_b = []

      target_users = [user_a, user_b]
      followed_by_target_user = { user_a => follow_by_a, user_b => follow_by_b }

      say "-------------------------------------"
      say "#{user_a} と #{user_b} のフォローしている共通ユーザ取得"
      say "-------------------------------------"
      target_users.each do |user|
        t_follow = followed_by_target_user[user]
        response = conn.get do |req|
          req.url "/api/v1/users/#{user}/following_users"
        end
        res = JSON.parse(response.body)
        res.each do |follower|
          t_follow << follower["url_name"]
        end
      end

      check_flag = false

      follow_by_a.each do |compare_a|
        check_flag = false
        follow_by_b.each do |compare_b|
          if compare_a == compare_b
            check_flag = true
            break
          else
            check_flag = false
          end
        end
        say compare_a if check_flag
      end

    end
  end
end
