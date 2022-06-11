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
  @[GObject::GeneratedWrapper]
  class Notification < GObject::Object
    @pointer : Pointer(Void)

    macro inherited
    
    {{ raise "Cannot inherit from #{@type.superclass}" unless @type.annotation(GObject::GeneratedWrapper) }}
    
    end

    GICrystal.define_new_method(Notification, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `Notification`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_notification_get_type
    end

    # Creates a new #GNotification with @title as its title.
    #
    # After populating @notification with more details, it can be sent to
    # the desktop shell with g_application_send_notification(). Changing
    # any properties after this call will not have any effect until
    # resending @notification.
    def self.new(title : ::String) : self
      # g_notification_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_notification_new(title)

      # Return value handling

      Gio::Notification.new(_retval, GICrystal::Transfer::Full)
    end

    # Adds a button to @notification that activates the action in
    # @detailed_action when clicked. That action must be an
    # application-wide action (starting with "app."). If @detailed_action
    # contains a target, the action will be activated with that target as
    # its parameter.
    #
    # See g_action_parse_detailed_name() for a description of the format
    # for @detailed_action.
    def add_button(label : ::String, detailed_action : ::String) : Nil
      # g_notification_add_button: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_notification_add_button(@pointer, label, detailed_action)

      # Return value handling
    end

    # Adds a button to @notification that activates @action when clicked.
    # @action must be an application-wide action (it must start with "app.").
    #
    # If @target_format is given, it is used to collect remaining
    # positional parameters into a #GVariant instance, similar to
    # g_variant_new(). @action will be activated with that #GVariant as its
    # parameter.
    def add_button_with_target(label : ::String, action : ::String, target : _?) : Nil
      # g_notification_add_button_with_target_value: (Method)
      # @target: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      target = if target.nil?
                 Pointer(Void).null
               elsif !target.is_a?(GLib::Variant)
                 GLib::Variant.new(target).to_unsafe
               else
                 target.to_unsafe
               end

      # C call
      LibGio.g_notification_add_button_with_target_value(@pointer, label, action, target)

      # Return value handling
    end

    # Sets the body of @notification to @body.
    def body=(body : ::String?) : Nil
      # g_notification_set_body: (Method)
      # @body: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      body = if body.nil?
               Pointer(LibC::Char).null
             else
               body.to_unsafe
             end

      # C call
      LibGio.g_notification_set_body(@pointer, body)

      # Return value handling
    end

    # Sets the type of @notification to @category. Categories have a main
    # type like `email`, `im` or `device` and can have a detail separated
    # by a `.`, e.g. `im.received` or `email.arrived`. Setting the category
    # helps the notification server to select proper feedback to the user.
    #
    # Standard categories are [listed in the specification](https://specifications.freedesktop.org/notification-spec/latest/ar01s06.html).
    def category=(category : ::String?) : Nil
      # g_notification_set_category: (Method)
      # @category: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      category = if category.nil?
                   Pointer(LibC::Char).null
                 else
                   category.to_unsafe
                 end

      # C call
      LibGio.g_notification_set_category(@pointer, category)

      # Return value handling
    end

    # Sets the default action of @notification to @detailed_action. This
    # action is activated when the notification is clicked on.
    #
    # The action in @detailed_action must be an application-wide action (it
    # must start with "app."). If @detailed_action contains a target, the
    # given action will be activated with that target as its parameter.
    # See g_action_parse_detailed_name() for a description of the format
    # for @detailed_action.
    #
    # When no default action is set, the application that the notification
    # was sent on is activated.
    def default_action=(detailed_action : ::String) : Nil
      # g_notification_set_default_action: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_notification_set_default_action(@pointer, detailed_action)

      # Return value handling
    end

    # Sets the default action of @notification to @action. This action is
    # activated when the notification is clicked on. It must be an
    # application-wide action (it must start with "app.").
    #
    # If @target_format is given, it is used to collect remaining
    # positional parameters into a #GVariant instance, similar to
    # g_variant_new(). @action will be activated with that #GVariant as its
    # parameter.
    #
    # When no default action is set, the application that the notification
    # was sent on is activated.
    def set_default_action_and_target(action : ::String, target : _?) : Nil
      # g_notification_set_default_action_and_target_value: (Method)
      # @target: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      target = if target.nil?
                 Pointer(Void).null
               elsif !target.is_a?(GLib::Variant)
                 GLib::Variant.new(target).to_unsafe
               else
                 target.to_unsafe
               end

      # C call
      LibGio.g_notification_set_default_action_and_target_value(@pointer, action, target)

      # Return value handling
    end

    # Sets the icon of @notification to @icon.
    def icon=(icon : Gio::Icon) : Nil
      # g_notification_set_icon: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_notification_set_icon(@pointer, icon)

      # Return value handling
    end

    # Sets the priority of @notification to @priority. See
    # #GNotificationPriority for possible values.
    def priority=(priority : Gio::NotificationPriority) : Nil
      # g_notification_set_priority: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_notification_set_priority(@pointer, priority)

      # Return value handling
    end

    # Sets the title of @notification to @title.
    def title=(title : ::String) : Nil
      # g_notification_set_title: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_notification_set_title(@pointer, title)

      # Return value handling
    end

    # Deprecated in favor of g_notification_set_priority().
    def urgent=(urgent : Bool) : Nil
      # g_notification_set_urgent: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_notification_set_urgent(@pointer, urgent)

      # Return value handling
    end
  end
end
