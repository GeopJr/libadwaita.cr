require "../gio-2.0/app_launch_context"

module Gdk
  # `GdkAppLaunchContext` handles launching an application in a graphical context.
  #
  # It is an implementation of `GAppLaunchContext` that provides startup
  # notification and allows to launch applications on a specific screen
  # or workspace.
  #
  # ## Launching an application
  #
  # ```c
  # GdkAppLaunchContext *context;
  #
  # context = gdk_display_get_app_launch_context (display);
  #
  # gdk_app_launch_context_set_display (display);
  # gdk_app_launch_context_set_timestamp (gdk_event_get_time (event));
  #
  # if (!g_app_info_launch_default_for_uri ("http://www.gtk.org", context, &error))
  #   g_warning ("Launching failed: %s\n", error->message);
  #
  # g_object_unref (context);
  # ```
  class AppLaunchContext < Gio::AppLaunchContext
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, display : Gdk::Display? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if display
        (_names.to_unsafe + _n).value = "display".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, display)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(AppLaunchContext.g_type, _n, _names, _values)
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

    def display : Gdk::Display
      # gdk_app_launch_context_get_display: (Method | Getter)
      # Returns: (transfer none)

      _retval = LibGdk.gdk_app_launch_context_get_display(self)
      Gdk::Display.new(_retval, GICrystal::Transfer::None)
    end

    def desktop=(desktop : Int32) : Nil
      # gdk_app_launch_context_set_desktop: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_app_launch_context_set_desktop(self, desktop)
    end

    def icon=(icon : Gio::Icon?) : Nil
      # gdk_app_launch_context_set_icon: (Method)
      # @icon: (nullable)
      # Returns: (transfer none)

      icon = if icon.nil?
               Pointer(Void).null
             else
               icon.to_unsafe
             end

      LibGdk.gdk_app_launch_context_set_icon(self, icon)
    end

    def icon_name=(icon_name : ::String?) : Nil
      # gdk_app_launch_context_set_icon_name: (Method)
      # @icon_name: (nullable)
      # Returns: (transfer none)

      icon_name = if icon_name.nil?
                    Pointer(LibC::Char).null
                  else
                    icon_name.to_unsafe
                  end

      LibGdk.gdk_app_launch_context_set_icon_name(self, icon_name)
    end

    def timestamp=(timestamp : UInt32) : Nil
      # gdk_app_launch_context_set_timestamp: (Method)
      # Returns: (transfer none)

      LibGdk.gdk_app_launch_context_set_timestamp(self, timestamp)
    end
  end
end
