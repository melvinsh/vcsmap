require 'maildrop'

class GithubAccountService
  def initialize
    @cookie = cookie
    @token = csrf_token
    @mailbox = mailbox
  end

  def create_account
    puts 'Creating account ...'
    puts "Username: #{@mailbox.address}"
    puts "Password: #{@mailbox.address}"
    HTTP.cookies('_gh_sess' => @cookie)
        .post('https://github.com/join', params: request_body)
    puts 'Done!'
  end

  private

  def cookie
    cookies = HTTP.get('https://github.com').cookies
    session_cookie = cookies.select do |cookie|
      cookie.name == '_gh_sess'
    end
    session_cookie.first.value
  end

  def csrf_token
    regex = /<input name="authenticity_token"(?:.*)value="(.*)"/
    html = HTTP.cookies('_gh_sess' => @cookie)
               .get('https://github.com/join?source=header-home')
               .to_s
    regex.match(html)[1]
  end

  def request_body
    params = {}
    params['authenticity_token'] = csrf_token
    params['user[login]'] = @mailbox.name
    params['user[email]'] = @mailbox.address
    params['user[password]'] = @mailbox.address
    params['source'] = 'login'
    params
  end

  def mailbox
    Maildrop::Mailbox.random_get
  end
end
