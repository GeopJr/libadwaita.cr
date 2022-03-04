require "../g_object-2.0/object"

module Gio
  # #GNotification is a mechanism for creating a notification to be shown
  # to the user -- typically as a pop-up notification presented by the
  # desktop environment shell.
  #
  # The key difference between #GNotification and other similar APIs is
  # that, if supported by the desktop environment, notifications sent
  # with #GNotification will persist after the application has exited,
  # and even across system reboots.
  #
  # Since the user may click on a notification while the application is
  # not running, applications using #GNotification should be able to be
  # started as a D-Bus service, using #GApplication.
  #
  # In order for #GNotification to work, the application must have installed
  # a `.desktop` file. For example:
  # |[
  #  [Desktop Entry]
  #   Name=Test Application
  #   Comment=Description of what Test Application does
  #   Exec=gnome-test-application
  #   Icon=org.gnome.TestApplication
  #   Terminal=false
  #   Type=Application
  #   Categories=GNOME;GTK;TestApplication Category;
  #   StartupNotify=true
  #   DBusActivatable=true
  #   X-GNOME-UsesNotifications=true
  # ]|
  #
  # The `X-GNOME-UsesNotifications` key indicates to GNOME Control Center
  # that this application uses notifications, so it can be listed in the
  # Control Center’s ‘Notifications’ panel.
  #
  # The `.desktop` file must be named as `org.gnome.TestApplication.desktop`,
  # where `org.gnome.TestApplication` is the ID passed to g_application_new().
  #
  # User interaction with a notification (either the default action, or
  # buttons) must be associated with actions on the application (ie:
  # "app." actions).  It is not possible to route user interaction
  # through the notification itself, because the object will not exist if
  # the application is autostarted as a result of a notification being
  # clicked.
  #
  # A notification can be sent with g_application_send_notification().
  class Notification < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_notification_get_type
    end

    def initialize(title : ::String)
      # g_notification_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGio.g_notification_new(title)

      # Return value handling
      @pointer = _retval
    end

    def add_button(label : ::String, detailed_action : ::String) : Nil
      # g_notification_add_button: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_notification_add_button(self, label, detailed_action)

      # Return value handling
    end

    def add_button_with_target(label : ::String, action : ::String, target : _?) : Nil
      # g_notification_add_button_with_target_value: (Method)
      # @target: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      target = if target.nil?
                 Pointer(Void).null
               else
                 target.to_unsafe
               end
      target = GLib::Variant.new(target) unless target.is_a?(GLib::Variant)

      # C call
      LibGio.g_notification_add_button_with_target_value(self, label, action, target)

      # Return value handling
    end

    def body=(body : ::String?) : Nil
      # g_notification_set_body: (Method)
      # @body: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      body = if body.nil?
               Pointer(LibC::Char).null
             else
               body.to_unsafe
             end

      # C call
      LibGio.g_notification_set_body(self, body)

      # Return value handling
    end

    def category=(category : ::String?) : Nil
      # g_notification_set_category: (Method)
      # @category: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      category = if category.nil?
                   Pointer(LibC::Char).null
                 else
                   category.to_unsafe
                 end

      # C call
      LibGio.g_notification_set_category(self, category)

      # Return value handling
    end

    def default_action=(detailed_action : ::String) : Nil
      # g_notification_set_default_action: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_notification_set_default_action(self, detailed_action)

      # Return value handling
    end

    def set_default_action_and_target(action : ::String, target : _?) : Nil
      # g_notification_set_default_action_and_target_value: (Method)
      # @target: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      target = if target.nil?
                 Pointer(Void).null
               else
                 target.to_unsafe
               end
      target = GLib::Variant.new(target) unless target.is_a?(GLib::Variant)

      # C call
      LibGio.g_notification_set_default_action_and_target_value(self, action, target)

      # Return value handling
    end

    def icon=(icon : Gio::Icon) : Nil
      # g_notification_set_icon: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_notification_set_icon(self, icon)

      # Return value handling
    end

    def priority=(priority : Gio::NotificationPriority) : Nil
      # g_notification_set_priority: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_notification_set_priority(self, priority)

      # Return value handling
    end

    def title=(title : ::String) : Nil
      # g_notification_set_title: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_notification_set_title(self, title)

      # Return value handling
    end

    def urgent=(urgent : Bool) : Nil
      # g_notification_set_urgent: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGio.g_notification_set_urgent(self, urgent)

      # Return value handling
    end
  end
end
