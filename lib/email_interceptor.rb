class EmailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.subject}"
    message.to = [ 'sonialanglet@gmail.com' ]
  end
end
