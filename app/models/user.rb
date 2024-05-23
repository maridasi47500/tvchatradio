class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :yyyy,:mm,:dd
  
  def initialize(attributes = {})
        super
        self.birthdate = Date.today - 18.years
        x=self.birthdate.to_date
        self.mm=x.month
        self.yyyy=x.year
        self.dd=x.day
              end
  before_validation do
    self.birthdate=Date.new(self.yyyy,self.mm,self.dd)
  end
  def age
    (Date.today.to_time.to_i - self.birthdate.to_time.to_i).to_i/365
  end
  def list_tchatche
    User.all.where.not(id: self.id)
  end
end
