require "../gio-2.0/app_launch_context"

module Gdk
  # `GdkAppLaunchContext` handles launching an application in a graphical context.
  #
  # It is an implementation of `GAppLaunchContext` that provides startup
  # notification and allows to launch applications on a specific workspace.
  #
  # ## Launching an application
  #
  #
  #
  # WARNING: **⚠️ The following code is in c ⚠️**
  # ```c
  # GdkAppLaunchContext *context;
  #
  # context = gdk_display_get_app_launch_context (display);
  #
  # gdk_app_launch_context_set_timestamp (gdk_event_get_time (event));
  #
  # if (!g_app_info_launch_default_for_uri ("http://www.gtk.org", context, &error))
  #   g_warning ("Launching failed: %s\n", error->message);
  #
  # g_object_unref (context);
  # ```
  @[GObject::GeneratedWrapper]
  class AppLaunchContext < Gio::AppLaunchContext
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::AppLaunchContext), instance_init, 0)
    end

    GICrystal.define_new_method(AppLaunchContext, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `AppLaunchContext`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !display.nil?
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(AppLaunchContext.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_app_launch_context_get_type
    end

    def display=(value : Gdk::Display?) : Gdk::Display?
      unsafe_value = value

      LibGObject.g_object_set(self, "display", unsafe_value, Pointer(Void).null)
      value
    end

    def display : Gdk::Display?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "display", pointerof(value), Pointer(Void).null)
      Gdk::Display.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Gets the `GdkDisplay` that @context is for.
    def display : Gdk::Display
      # gdk_app_launch_context_get_display: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_app_launch_context_get_display(@pointer)

      # Return value handling

      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    # Sets the workspace on which applications will be launched.
    #
    # This only works when running under a window manager that
    # supports multiple workspaces, as described in the
    # [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec).
    # Specifically this sets the `_NET_WM_DESKTOP` property described
    # in that spec.
    #
    # This only works when using the X11 backend.
    #
    # When the workspace is not specified or @desktop is set to -1,
    # it is up to the window manager to pick one, typically it will
    # be the current workspace.
    def desktop=(desktop : Int32) : Nil
      # gdk_app_launch_context_set_desktop: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_app_launch_context_set_desktop(@pointer, desktop)

      # Return value handling
    end

    # Sets the icon for applications that are launched with this
    # context.
    #
    # Window Managers can use this information when displaying startup
    # notification.
    #
    # See also `Gdk::AppLaunchContext#icon_name=`.
    def icon=(icon : Gio::Icon?) : Nil
      # gdk_app_launch_context_set_icon: (Method)
      # @icon: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon = if icon.nil?
               Pointer(Void).null
             else
               icon.to_unsafe
             end

      # C call
      LibGdk.gdk_app_launch_context_set_icon(@pointer, icon)

      # Return value handling
    end

    # Sets the icon for applications that are launched with this context.
    #
    # The @icon_name will be interpreted in the same way as the Icon field
    # in desktop files. See also `Gdk::AppLaunchContext#icon=`.
    #
    # If both @icon and @icon_name are set, the @icon_name takes priority.
    # If neither @icon or @icon_name is set, the icon is taken from either
    # the file that is passed to launched application or from the `GAppInfo`
    # for the launched application itself.
    def icon_name=(icon_name : ::String?) : Nil
      # gdk_app_launch_context_set_icon_name: (Method)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      # C call
      LibGdk.gdk_app_launch_context_set_icon_name(@pointer, icon_name)

      # Return value handling
    end

    # Sets the timestamp of @context.
    #
    # The timestamp should ideally be taken from the event that
    # triggered the launch.
    #
    # Window managers can use this information to avoid moving the
    # focus to the newly launched application when the user is busy
    # typing in another window. This is also known as 'focus stealing
    # prevention'.
    def timestamp=(timestamp : UInt32) : Nil
      # gdk_app_launch_context_set_timestamp: (Method)
      # Returns: (transfer none)

      # C call
      LibGdk.gdk_app_launch_context_set_timestamp(@pointer, timestamp)

      # Return value handling
    end
  end
end
