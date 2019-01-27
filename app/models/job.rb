class Job < ApplicationRecord
  include Sortable::InstanceMethods
  extend Sortable::ClassMethods

  validates :title, :description, :company, :location, :company_id, presence: true
  belongs_to :user, :class_name => 'User', :foreign_key => 'company_id'
  has_many :job_applications, :dependent => :destroy
  has_many :applicants, :through => :job_applications, :class_name => 'User'
end
