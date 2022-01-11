set :rails_env, 'production'

# githubへの設定
#  事前に「ssh-add ~/.ssh/id_rsa」が必要
set :ssh_options, {
  auth_methods: [ 'publickey' ],
  keys:         [ '~/.ssh/attendance.pem' ], # 自分の環境のパスを指定
}

server '54.178.33.227', user: 'ec2-user', roles: %w{app db web}