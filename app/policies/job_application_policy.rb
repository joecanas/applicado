class JobApplicationPolicy < ApplicationPolicy
  def created_by_user?
    user.applicant? && record.user_id == user.id
  end

  def created_by_company?
    user.employer? && record.job.company_id == user.id
  end

  def show?
    user.admin? || created_by_user? || created_by_company?
  end

  def create?
    user.admin? || user.applicant?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
