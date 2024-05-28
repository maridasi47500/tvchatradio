class User < ApplicationRecord
  paginates_per 10
  has_many :somefavusers, class_name:"Ilike", foreign_key:"user1_id"
  has_many :favusers, through: :somefavusers, source: :user2
  def online?
      updated_at > 10.minutes.ago
  end
  def self.onlineusers
    select("users.*, cast(users.updated_at > '#{10.minutes.ago.strftime("%Y-%M-%d %H:%m:%S")}' as integer) sometime").group("users.id").order("sometime desc")
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  attr_accessor :yyyy,:mm,:dd, :ajouterprive,:ajouterpublic,:photopublic,:photoprive,:research, :myinterests, :account
  has_and_belongs_to_many :interests, :join_table => :userhaveinterests
  has_many :photoprives, class_name:"Photoprive"
  accepts_nested_attributes_for :photoprives, allow_destroy:true
  def mybirthdate
    birthdate.to_date
  end
  def image=(uploaded_io)
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
      end
      write_attribute(:image,uploaded_io.original_filename)
  end
  def image
      read_attribute(:image)
  end
  
  has_many :photopublics
  accepts_nested_attributes_for :photopublics, allow_destroy:true
  before_validation do
    uploaded_io = self.ajouterpublic
    if uploaded_io
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
      end
      self.photopublics.create(image: uploaded_io.original_filename)
      self.photopublic=true


    end
    uploaded_io = self.ajouterprive
    if uploaded_io
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
      end
      self.photoprives.create(image: uploaded_io.original_filename)
      self.photoprive=true


    end
  end
  
  def initialize(attributes = {})
        super
        self.birthdate = Date.today - 18.years
        x=self.birthdate.to_date
        self.mm=x.month
        self.yyyy=x.year
        self.dd=x.day
              end
  before_validation do
    if self.yyyy and self.mm and self.dd
      self.birthdate=Date.new(self.yyyy.to_i,self.mm.to_i,self.dd.to_i)
    end
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
