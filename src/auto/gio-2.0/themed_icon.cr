require "../g_object-2.0/object"
require "./icon"

module Gio
  # #GThemedIcon is an implementation of #GIcon that supports icon themes.
  # #GThemedIcon contains a list of all of the icons present in an icon
  # theme, so that icons can be looked up quickly. #GThemedIcon does
  # not provide actual pixmaps for icons, just the icon names.
  # Ideally something like gtk_icon_theme_choose_icon() should be used to
  # resolve the list of names so that fallback icons work nicely with
  # themes that inherit other themes.
  @[GObject::GeneratedWrapper]
  class ThemedIcon < GObject::Object
    include Icon

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGio::ThemedIconClass), class_init,
        sizeof(LibGio::ThemedIcon), instance_init, 0)
    end

    GICrystal.define_new_method(ThemedIcon, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `ThemedIcon`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, name : ::String? = nil, names : Enumerable(::String)? = nil, use_default_fallbacks : Bool? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !names.nil?
        (_names.to_unsafe + _n).value = "names".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, names)
        _n += 1
      end
      if !use_default_fallbacks.nil?
        (_names.to_unsafe + _n).value = "use-default-fallbacks".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_default_fallbacks)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(ThemedIcon.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_themed_icon_get_type
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def names=(value : Enumerable(::String)) : Enumerable(::String)
      # handle array

      LibGObject.g_object_set(self, "names", unsafe_value, Pointer(Void).null)
      value
    end

    def names : Enumerable(::String)
      # Returns: None

      value = uninitialized Pointer(Pointer(LibC::Char))
      LibGObject.g_object_get(self, "names", pointerof(value), Pointer(Void).null)
      GICrystal.transfer_null_ended_array(value, GICrystal::Transfer::None)
    end

    def use_default_fallbacks=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-default-fallbacks", unsafe_value, Pointer(Void).null)
      value
    end

    def use_default_fallbacks? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-default-fallbacks", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new themed icon for @iconname.
    def self.new(iconname : ::String) : self
      # g_themed_icon_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_themed_icon_new(iconname)

      # Return value handling

      Gio::ThemedIcon.new(_retval, GICrystal::Transfer::Full)
    end

    # Creates a new themed icon for @iconnames.
    def self.new_from_names(iconnames : Enumerable(::String)) : self
      # g_themed_icon_new_from_names: (Constructor)
      # @iconnames: (array length=len element-type Utf8)
      # Returns: (transfer full)

      # Generator::ArrayLengthArgPlan
      len = iconnames.size # Generator::ArrayArgPlan
      iconnames = iconnames.to_a.map(&.to_unsafe).to_unsafe

      # C call
      _retval = LibGio.g_themed_icon_new_from_names(iconnames, len)

      # Return value handling

      Gio::ThemedIcon.new(_retval, GICrystal::Transfer::Full)
    end

    def self.new_from_names(*iconnames : ::String)
      self.new_from_names(iconnames)
    end

    # Creates a new themed icon for @iconname, and all the names
    # that can be created by shortening @iconname at '-' characters.
    #
    # In the following example, @icon1 and @icon2 are equivalent:
    # |[<!-- language="C" -->
    # const char *names[] = {
    #   "gnome-dev-cdrom-audio",
    #   "gnome-dev-cdrom",
    #   "gnome-dev",
    #   "gnome"
    # };
    #
    # icon1 = g_themed_icon_new_from_names (names, 4);
    # icon2 = g_themed_icon_new_with_default_fallbacks ("gnome-dev-cdrom-audio");
    # ]|
    def self.new_with_default_fallbacks(iconname : ::String) : self
      # g_themed_icon_new_with_default_fallbacks: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGio.g_themed_icon_new_with_default_fallbacks(iconname)

      # Return value handling

      Gio::ThemedIcon.new(_retval, GICrystal::Transfer::Full)
    end

    # Append a name to the list of icons from within @icon.
    #
    # Note that doing so invalidates the hash computed by prior calls
    # to g_icon_hash().
    def append_name(iconname : ::String) : Nil
      # g_themed_icon_append_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_themed_icon_append_name(@pointer, iconname)

      # Return value handling
    end

    # Gets the names of icons from within @icon.
    def names : Enumerable(::String)
      # g_themed_icon_get_names: (Method | Getter)
      # Returns: (transfer none) (array zero-terminated=1 element-type Utf8)

      # C call
      _retval = LibGio.g_themed_icon_get_names(@pointer)

      # Return value handling

      GICrystal.transfer_null_ended_array(_retval, GICrystal::Transfer::None)
    end

    # Prepend a name to the list of icons from within @icon.
    #
    # Note that doing so invalidates the hash computed by prior calls
    # to g_icon_hash().
    def prepend_name(iconname : ::String) : Nil
      # g_themed_icon_prepend_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGio.g_themed_icon_prepend_name(@pointer, iconname)

      # Return value handling
    end
  end
end
