module Gdk
  # A `GdkPopup` is a surface that is attached to another surface.
  #
  # The `GdkPopup` is positioned relative to its parent surface.
  #
  # `GdkPopup`s are typically used to implement menus and similar popups.
  # They can be modal, which is indicated by the `GdkPopup#autohide`
  # property.
  module Popup
    def autohide=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "autohide", unsafe_value, Pointer(Void).null)
      value
    end

    def autohide? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "autohide", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def parent=(value : Gdk::Surface?) : Gdk::Surface?
      unsafe_value = value

      LibGObject.g_object_set(self, "parent", unsafe_value, Pointer(Void).null)
      value
    end

    def parent : Gdk::Surface?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "parent", pointerof(value), Pointer(Void).null)
      Gdk::Surface.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def autohide : Bool
      # gdk_popup_get_autohide: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_get_autohide(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def parent : Gdk::Surface?
      # gdk_popup_get_parent: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_get_parent(self)

      # Return value handling

      Gdk::Surface.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def position_x : Int32
      # gdk_popup_get_position_x: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_get_position_x(self)

      # Return value handling

      _retval
    end

    def position_y : Int32
      # gdk_popup_get_position_y: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_get_position_y(self)

      # Return value handling

      _retval
    end

    def rect_anchor : Gdk::Gravity
      # gdk_popup_get_rect_anchor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_get_rect_anchor(self)

      # Return value handling

      Gdk::Gravity.new(_retval)
    end

    def surface_anchor : Gdk::Gravity
      # gdk_popup_get_surface_anchor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_get_surface_anchor(self)

      # Return value handling

      Gdk::Gravity.new(_retval)
    end

    def present(width : Int32, height : Int32, layout : Gdk::PopupLayout) : Bool
      # gdk_popup_present: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_popup_present(self, width, height, layout)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class Popup__Impl < GObject::Object
    include Popup

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_popup_get_type
    end

    # Cast a `GObject::Object` to `Popup`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to Popup")
    end

    # Cast a `GObject::Object` to `Popup`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
