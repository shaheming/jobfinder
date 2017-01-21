class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :resumes
  
  has_many :job_relationships
  has_many :applied_jobs, :through => :job_relationships, :source => :job

  def admin?
    is_admin
  end

  def is_member_of?(job)
  	applied_jobs.include?(job)
  end

   def join!(job)
    applied_jobs << job
  end

  def quit!(job)
    applied_jobs.delete(job)
  end
end
