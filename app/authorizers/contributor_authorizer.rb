require 'authorizer/base'

class ContributorAuthorizer < Authorizer::Base
  alias contributor record

  def destroy?
    organization = contributor.organization

    if user.is_admin_of_organization?(organization)
      if contributor.admin?
        not contributor.only_admin?
      else
        true
      end
    end
  end

  def update?
    destroy?
  end
end

