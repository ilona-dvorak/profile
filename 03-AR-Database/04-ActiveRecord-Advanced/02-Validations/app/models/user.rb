class User < ActiveRecord::Base
  has_many :posts

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }

  before_validation :strip_email
  after_create :send_welcome_email

  def strip_email
    self.email = email.strip unless email.nil?
  end

  def send_welcome_email
    FakeMailer.instance.mail(email, "Welcome #{username}!")
  end
end
