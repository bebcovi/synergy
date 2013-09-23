require "activeadmin"
require_relative "markdown_rendering"

ActiveAdmin.setup do |config|
  # Set the link url for the title. For example, to take
  # users to your main site. Defaults to no link.
  #
  config.site_title_link = "/"

  # == Root
  #
  # Set the action to call for the root path. You can set different
  # roots for each namespace.
  #
  # Default:
  config.root_to = 'posts#index'


  # == User Authentication
  #
  # Active Admin will automatically call an authentication
  # method in a before filter of all controller actions to
  # ensure that there is a currently logged in admin user.
  #
  # This setting changes the method which Active Admin calls
  # within the controller.
  config.authentication_method = :authenticate_user!

  # == Current User
  #
  # Active Admin will associate actions with the current
  # user performing them.
  #
  # This setting changes the method which Active Admin calls
  # to return the currently logged in user.
  config.current_user_method = :current_user

  # == Logging Out
  #
  # Active Admin displays a logout link on each screen. These
  # settings configure the location and method used for the link.
  #
  # This setting changes the path where the link points to. If it's
  # a string, the strings is used as the path. If it's a Symbol, we
  # will call the method to return the path.
  #
  # Default:
  config.logout_link_path = :destroy_user_session_path


  # == Admin Comments
  #
  # This allows your users to comment on any resource registered with Active Admin.
  #
  # You can completely disable comments:
  config.allow_comments = false
  #
  # You can disable the menu item for the comments index page:
  # config.show_comments_in_menu = false
  #
  # You can change the name under which comments are registered:
  # config.comments_registration_name = 'AdminComment'


  # == Batch Actions
  #
  # Enable and disable Batch Actions
  #
  config.batch_actions = true


  # == Download Links
  #
  # You can disable download links on resource listing pages,
  # or customize the formats shown per namespace/globally
  #
  # To disable/customize for the :admin namespace:
  #
  #   config.namespace :admin do |admin|
  #
  #     # Disable the links entirely
  #     admin.download_links = false
  #
  #     # Only show XML & PDF options
  #     admin.download_links = [:xml, :pdf]
  #
  #   end
  config.namespace :admin do |admin|
    admin.download_links = false
  end
end

Arbre::Element.send(:include, MarkdownRendering)

module ActiveAdmin
  module Views
    module Pages
      class Show

        def locale_attributes(*attributes)
          %i[en hr].each do |locale|
            h1 { {en: "English", hr: "Croatian"}[locale] }

            attributes_table do
              I18n.with_locale(locale) do
                attributes.each do |attribute|
                  row attribute
                end
              end
            end
          end
        end

      end
    end
  end
end
