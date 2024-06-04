class Mysearch < ApplicationRecord
  self.abstract_class = true
  attr_accessor "iam"
  attr_accessor "isearchman"
  attr_accessor "isearchwoman"
  attr_accessor "showweightsize"
  attr_accessor "image"
  attr_accessor "description"
  attr_accessor "size"
  attr_accessor "country"
  attr_accessor "region_id"
  attr_accessor "weight"
  attr_accessor "birthdate"
  attr_accessor "phone"
  attr_accessor "nickname"
  attr_accessor "region"
   #def self.columns
   #      @columns ||= [];
   #        end

   #  def self.column(name, sql_type = nil, default = nil, null = true)
   #        columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default,
   #                                                                      sql_type.to_s, null)
   #          end

   #   # Override the save method to prevent exceptions.
   #     def save(validate = true)
   #         validate ? valid? : true
   #           end
end
