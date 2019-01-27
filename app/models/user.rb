class User < ApplicationRecord
  after_initialize :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Three roles are supported within the application...
  enum role: [:applicant, :employer, :admin]
  # ... but only allow signups for the first two roles
  # validates :role, inclusion: { in: ['applicant', 'employer'],
  #   message: "unauthorized! Please select 'Applicant' or 'Employer' as your account type." }, on: :create

  # Require custom name fields on signup form and account edit form
  validates :first_name, :last_name, presence: true #, on: :create

  has_many :jobs, :foreign_key => 'company_id', :dependent => :destroy
  has_many :job_applications, :foreign_key => 'user_id'

  def set_default_role
    self.role ||= :applicant
  end
end
