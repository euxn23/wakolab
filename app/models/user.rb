class User < ActiveRecord::Base
  attr_accessor :name, :provider, :uid, :sid

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider=auth['provider']
      user.uid=auth['uid']
      user.name=auth['info']['name']
      user.sid=auth['info']['nickname']
    end
  end
end
