require "../gtk-4.0/application"
require "../gio-2.0/action_group"

require "../gio-2.0/action_map"

module Adw
  # A base class for Adwaita applications.
  #
  # `AdwApplication` handles library initialization by calling `#init` in the
  # default `Gio::Application::#startup` signal handler, in turn chaining up
  # as required by `Gtk#Application`. Therefore, any subclass of
  # `AdwApplication` should always chain up its `startup` handler before using
  # any Adwaita or GTK API.
  #
  # ## Automatic Resources
  #
  # `AdwApplication` will automatically load stylesheets located in the
  # application's resource base path (see
  # `Gio::Application#resource_base_path=`, if they're present.
  #
  # They can be used to add custom styles to the application, as follows:
  #
  # - `style.css` contains styles that are always present.
  #
  # - `style-dark.css` contains styles only used when
  # `StyleManager#dark` is `TRUE`.
  #
  # - `style-hc.css` contains styles used when the system high contrast
  #   preference is enabled.
  #
  # - `style-hc-dark.css` contains styles used when the system high contrast
  #   preference is enabled and `StyleManager#dark` is `TRUE`.
  @[GObject::GeneratedWrapper]
  class Application < Gtk::Application
    include Gio::ActionGroup
    include Gio::ActionMap

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibAdw::ApplicationClass), class_init,
        sizeof(LibAdw::Application), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action_group : Gio::ActionGroup? = nil, active_window : Gtk::Window? = nil, application_id : ::String? = nil, flags : Gio::ApplicationFlags? = nil, inactivity_timeout : UInt32? = nil, is_busy : Bool? = nil, is_registered : Bool? = nil, is_remote : Bool? = nil, menubar : Gio::MenuModel? = nil, register_session : Bool? = nil, resource_base_path : ::String? = nil, screensaver_active : Bool? = nil, style_manager : Adw::StyleManager? = nil)
      _names = uninitialized Pointer(LibC::Char)[13]
      _values = StaticArray(LibGObject::Value, 13).new(LibGObject::Value.new)
      _n = 0

      if !action_group.nil?
        (_names.to_unsafe + _n).value = "action-group".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_group)
        _n += 1
      end
      if !active_window.nil?
        (_names.to_unsafe + _n).value = "active-window".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, active_window)
        _n += 1
      end
      if !application_id.nil?
        (_names.to_unsafe + _n).value = "application-id".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, application_id)
        _n += 1
      end
      if !flags.nil?
        (_names.to_unsafe + _n).value = "flags".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, flags)
        _n += 1
      end
      if !inactivity_timeout.nil?
        (_names.to_unsafe + _n).value = "inactivity-timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, inactivity_timeout)
        _n += 1
      end
      if !is_busy.nil?
        (_names.to_unsafe + _n).value = "is-busy".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_busy)
        _n += 1
      end
      if !is_registered.nil?
        (_names.to_unsafe + _n).value = "is-registered".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_registered)
        _n += 1
      end
      if !is_remote.nil?
        (_names.to_unsafe + _n).value = "is-remote".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, is_remote)
        _n += 1
      end
      if !menubar.nil?
        (_names.to_unsafe + _n).value = "menubar".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, menubar)
        _n += 1
      end
      if !register_session.nil?
        (_names.to_unsafe + _n).value = "register-session".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, register_session)
        _n += 1
      end
      if !resource_base_path.nil?
        (_names.to_unsafe + _n).value = "resource-base-path".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, resource_base_path)
        _n += 1
      end
      if !screensaver_active.nil?
        (_names.to_unsafe + _n).value = "screensaver-active".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, screensaver_active)
        _n += 1
      end
      if !style_manager.nil?
        (_names.to_unsafe + _n).value = "style-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, style_manager)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Application.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_application_get_type
    end

    def style_manager : Adw::StyleManager?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "style-manager", pointerof(value), Pointer(Void).null)
      Adw::StyleManager.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `AdwApplication`.
    #
    # If `application_id` is not `NULL`, then it must be valid. See
    # `Gio::Application#id_is_valid`.
    #
    # If no application ID is given then some features (most notably application
    # uniqueness) will be disabled.
    def initialize(application_id : ::String?, flags : Gio::ApplicationFlags)
      # adw_application_new: (Constructor)
      # @application_id: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      application_id = if application_id.nil?
                         Pointer(LibC::Char).null
                       else
                         application_id.to_unsafe
                       end

      # C call
      _retval = LibAdw.adw_application_new(application_id, flags)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Gets the style manager for @self.
    def style_manager : Adw::StyleManager
      # adw_application_get_style_manager: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibAdw.adw_application_get_style_manager(self)

      # Return value handling

      Adw::StyleManager.new(_retval, GICrystal::Transfer::None)
    end
  end
end
