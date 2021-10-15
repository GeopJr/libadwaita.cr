module Gio
  # #GIcon is a very minimal interface for icons. It provides functions
  # for checking the equality of two icons, hashing of icons and
  # serializing an icon to and from strings.
  #
  # #GIcon does not provide the actual pixmap for the icon as this is out
  # of GIO's scope, however implementations of #GIcon may contain the name
  # of an icon (see #GThemedIcon), or the path to an icon (see #GLoadableIcon).
  #
  # To obtain a hash of a #GIcon, see g_icon_hash().
  #
  # To check if two #GIcons are equal, see g_icon_equal().
  #
  # For serializing a #GIcon, use g_icon_serialize() and
  # g_icon_deserialize().
  #
  # If you want to consume #GIcon (for example, in a toolkit) you must
  # be prepared to handle at least the three following cases:
  # #GLoadableIcon, #GThemedIcon and #GEmblemedIcon.  It may also make
  # sense to have fast-paths for other cases (like handling #GdkPixbuf
  # directly, for example) but all compliant #GIcon implementations
  # outside of GIO must implement #GLoadableIcon.
  #
  # If your application or library provides one or more #GIcon
  # implementations you need to ensure that your new implementation also
  # implements #GLoadableIcon.  Additionally, you must provide an
  # implementation of g_icon_serialize() that gives a result that is
  # understood by g_icon_deserialize(), yielding one of the built-in icon
  # types.
  module Icon
    def self.deserialize(value : _) : Gio::Icon?
      # g_icon_deserialize: (None)
      # Returns: (transfer full)

      value = GLib::Variant.new(value) unless value.is_a?(GLib::Variant)

      _retval = LibGio.g_icon_deserialize(value)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def self.hash(icon : Pointer(Nil)) : UInt32
      # g_icon_hash: (None)
      # Returns: (transfer none)

      _retval = LibGio.g_icon_hash(icon)
      _retval
    end

    def new_for_string(str : ::String) : Gio::Icon
      # g_icon_new_for_string: (Throws)
      # Returns: (transfer full)

      _retval = LibGio.g_icon_new_for_string(str)
      Gio::Icon__Impl.new(_retval, GICrystal::Transfer::Full)
    end

    def equal(icon2 : Gio::Icon?) : Bool
      # g_icon_equal: (Method)
      # @icon2: (nullable)
      # Returns: (transfer none)

      icon2 = if icon2.nil?
                Pointer(Void).null
              else
                icon2.to_unsafe
              end

      _retval = LibGio.g_icon_equal(self, icon2)
      GICrystal.to_bool(_retval)
    end

    def serialize : GLib::Variant?
      # g_icon_serialize: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_icon_serialize(self)
      GLib::Variant.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def to_string : ::String?
      # g_icon_to_string: (Method)
      # Returns: (transfer full)

      _retval = LibGio.g_icon_to_string(self)
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class Icon__Impl
    include Icon

    @pointer : Pointer(Void)

    def initialize(@pointer, transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

    def to_unsafe
      @pointer
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGio.g_icon_get_type
    end

    # Cast a `GObject::Object` to `Icon`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object)
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Icon")
    end

    # Cast a `GObject::Object` to `Icon`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object)
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
