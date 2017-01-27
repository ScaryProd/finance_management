# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# Gem controller, demands http authentication in order to allow the admin or client access.
module Admin
  class ApplicationController < Administrate::ApplicationController
    http_basic_authenticate_with name: 'alvaro', password: 'password'
  end
end
