class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
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
    (Date.today.to_time.to_i - self.birthdate.to_time.to_i).to_i/(365*24*3600)
  end
  def search_room(myid)
    Room.all.where(["(user1_id = ? and user2_id = ?) or (user1_id = ? and user2_id = ?)",self.id,myid,myid,self.id])[0]
  end
  def list_room
    Room.all.where(["user1_id = ? or user2_id = ?",self.id,self.id])
  end
  def list_tchatche
    User.all.where.not(id: self.id)
  end
end
